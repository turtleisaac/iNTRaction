# iNTRaction
Developed by turtleisaac

Nintendo DS Action Replay Code Compiler/Decompiler

# Usage

* ```make build_tools``` will clone [armips](https://github.com/Kingcom/armips) and place it in the project directory. This is a necessary step before you can compile/decompile codes.

* ```make compile``` compiles iNTRaction scripts into AR codes. See Makefile for formatting instructions if you add your own new files.

* ```make decompile``` decompiles AR codes into iNTRaction scripts. See Makefile for formatting instructions if you add your own new files.

# Notes

* iNTRaction script function names can be found in `include/macros.s`
* Further information on functions, including what each does, can be found [here](http://uk.codejunkies.com/support_downloads/Trainer-Toolkit-for-Nintendo-DS-User-Manual.pdf).
* Included with this repo is the file `codes/example.s`, which contains a few AR codes in iNTRaction script format. By default, running ```make compile``` will output ```codes/example.txt``` which contains the compiled AR codes.
* By default, running ```make decompile``` will decompile ```codes/example.txt``` into iNTRaction scripts in the file ```codes/decompiled.s```. This Makefile rule **will** fail by default if you have not yet ran ```make compile```.
* `directMemoryWrite (EXXXXXXX NNNNNNNN VVVVVVVV VVVVVVVV)` is currently not supported by the iNTRaction compiler/decompiler. Please be patient while I figure out how the heck it functions.
