# NTRaction
Developed by turtleisaac

Nintendo DS Action Replay Code Compiler/Decompiler

# Usage

* ```make build_tools``` will clone [armips](https://github.com/Kingcom/armips) and place it in the project directory. This is a necessary step before you can compile/decompile codes.

* ```make compile``` compiles NTRaction scripts into the AR format. See Makefile for formatting instructions if you add your own new files.

* ```make decompile``` decompiles codes into NTRaction scripts. See Makefile for formatting instructions if you add your own new files.

# Notes

* NTRaction script function names can be found in `include/macros.s`
* Further information on functions, including what each does, can be found [here](http://uk.codejunkies.com/support_downloads/Trainer-Toolkit-for-Nintendo-DS-User-Manual.pdf)
* `directMemoryWrite (EXXXXXXX NNNNNNNN VVVVVVVV VVVVVVVV)` is currently not supported by the NTRaction compiler/decompiler. Please be patient while I figure out how the heck it functions.