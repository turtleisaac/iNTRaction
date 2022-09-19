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

compile:
	$(ARMIPS) codes/example.s

decompile:
	@echo moo

build_tools:
	@rm -r -f armips
	@git clone --recursive https://github.com/Kingcom/armips.git
	@cd $(ARMIPS_SOURCE) ; mkdir build
	@cd $(ARMIPS_SOURCE)/build ; cmake -DCMAKE_BUILD_TYPE=Release ..
	@cd $(ARMIPS_SOURCE)/build ; cmake --build .

clean:
	@rm -r -f $(ARMIPS_SOURCE)
