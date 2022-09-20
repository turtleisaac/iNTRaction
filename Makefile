# Makefile

.PHONY: clean all

SYSTEM = $(shell grep -i -q 'microsoft' /proc/version; echo $$?)

ifeq ($(SYSTEM), 0)
EXE := .exe
SEP := \\
else
EXE := 
SEP := /
endif

####################### Tools #########################
ARMIPS_SOURCE = armips
ARMIPS = $(ARMIPS_SOURCE)/build/armips
PYTHON = python3
####################### Seting ########################
OUTPUT = build/output.bin
####################### Build #########################

default:
	@echo "Usage: make <compile/decompile>"

compile: # add new lines matching the following format for any files you add to be compiled
	$(ARMIPS) codes/example.s

decompile: # add new lines matching the following format for any files you add to be decompiled
	$(PYTHON) decompile.py -i example.txt -o decompiled.s

build_tools:
	@rm -r -f armips
	@git clone --recursive https://github.com/Kingcom/armips.git
	@cd $(ARMIPS_SOURCE) ; mkdir build
	@cd $(ARMIPS_SOURCE)/build ; cmake -DCMAKE_BUILD_TYPE=Release ..
	@cd $(ARMIPS_SOURCE)/build ; cmake --build .

clean:
	@rm -r -f $(ARMIPS_SOURCE)
