import getopt
import sys
import re
import json
import os


def main(argv):
    infile, outfile = '', ''
    try:
        opts, args = getopt.getopt(argv, "hi:o:", ["ifile=", "ofile="])
    except getopt.GetoptError:
        print('test.py -i <inputfile> -o <outputfile>')
        sys.exit(2)
    for opt, arg in opts:
        if opt in ("-i", "--ifile"):
            infile = arg
        elif opt in ("-o", "--ofile"):
            outfile = arg

    if infile != '':
        decompile(infile, outfile)


def decompile(infile, outfile):
    with open(os.getcwd() + '/include/functions.json', 'r') as f:
        functions = json.load(f)
    with open(os.getcwd() + infile, 'r') as f:
        text = f.read()

    codes = re.split('[^\n]+:\n', text)
    codes = codes[1:]
    for idx in range(len(codes)):
        codes[idx] = codes[idx].strip().upper().split('\n')

    names = re.findall('[^\n]+:\n', text)
    for idx in range(len(names)):
        if isinstance(names[idx], str):
            names[idx] = names[idx].replace(':\n', '')

    cheats = dict()
    for idx in range(len(names)):
        # print('%s:\n%s' % (names[idx], codes[idx]))
        cheats[names[idx]] = codes[idx]

    nibble_functions = functions['NibbleIdentifiers']
    byte_functions = functions['ByteIdentifiers']

    for cheat in cheats:
        decompiled = []
        for line in cheats[cheat]:
            output = locate_function(byte_functions, line)
            if output is None:
                output = locate_function(nibble_functions, line)
            decompiled.append(output)
            print(output)
        cheats[cheat] = decompiled

    with open(os.getcwd() + outfile, 'w') as f:
        f.write('.nds\n.thumb\n\n.include \"include/macros.s\"\n\n.create \"codes.txt\",0\n\n')
        for cheat in cheats:
            f.write('AR_CODE \"' + cheat + '\"\n')
            for line in cheats[cheat]:
                f.write('\t' + line + '\n')
            f.write('END_AR_CODE\n\n')
        f.write('\n.close')



def locate_function(functions, line):
    params = []
    output = None
    for function in functions:
        if line.startswith(function):
            this_function = functions[function]
            for param in this_function['params']:
                match = re.findall(param, line)
                if match:
                    match = match[0].strip()
                    params.append('0x' + hex(int(match, base=16)).upper()[2:])
            if len(this_function['params']) != 0:
                output = str.format(this_function['usage'] % tuple(params))
            else:
                output = this_function['usage']
            break
    return output


if __name__ == '__main__':
    main(sys.argv[1:])
