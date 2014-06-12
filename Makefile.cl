# Makefile for building SWIG with Microsoft Visual C++ compiler (cl.exe)
#
# Notice that this is a GNU make makefile and not an nmake one and it relies
# on having the usual Unix/Cygwin tools available.

swig: libfiles source

source:
	@$(MAKE) -C Source -f Makefile.cl

libfiles: Lib/swigwarn.swg

Lib/swigwarn.swg: Source/Include/swigwarn.h
	mkdir -p Lib
	echo "/* Automatically generated file containing all the swig warning codes.  */" > $@
	echo "/* Do not modify this file by hand, change 'Source/Include/swigwarn.h'  */" >> $@
	echo "/* and use the command 'make Lib/swigwarn.swg' instead.                 */" >> $@
	echo >> $@; echo >> $@
	awk '/#define WARN/{$$1="%define"; $$2="SWIG"$$2; $$3=sprintf("%d %%enddef", $$3); print $$0; next;}\
	      /#/{next;} {print $0}' < $? >> $@

clean:
	@$(MAKE) -C Source -f Makefile.cl clean

.PHONY: clean libfiles source swig
