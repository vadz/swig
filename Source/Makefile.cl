# Makefile for building SWIG with Microsoft Visual C++ compiler (cl.exe)
#
# Notice that this is a GNU make makefile and not an nmake one and it relies
# on having the usual Unix/Cygwin tools available.

all: swig.exe

ifdef DEBUG
    swig_CFLAGS := -Zi -D_DEBUG
else
    swig_CFLAGS := -DNDEBUG -O2 -GL
endif

swig_INCLUDES := -IInclude/msvc -IInclude -ICParse -IPreprocessor -IDoh -IModules -ISwig
swig_LIBS := pcre3.lib

swig_HEADERS = Include/swigwarn.h		\
		Include/msvc/swigconfig.h	\
		$(wildcard */*.h)

swig_SOURCES =	CParse/cscanner.c		\
		CParse/parser.c			\
		CParse/templ.c			\
		CParse/util.c			\
		DOH/base.c			\
		DOH/file.c			\
		DOH/fio.c			\
		DOH/hash.c			\
		DOH/list.c			\
		DOH/memory.c			\
		DOH/string.c			\
		DOH/void.c			\
		Modules/allegrocl.cxx		\
		Modules/allocate.cxx		\
		Modules/browser.cxx		\
		Modules/cffi.cxx		\
		Modules/chicken.cxx		\
		Modules/clisp.cxx		\
		Modules/contract.cxx		\
		Modules/csharp.cxx		\
		Modules/d.cxx			\
		Modules/directors.cxx		\
		Modules/emit.cxx		\
		Modules/go.cxx			\
		Modules/guile.cxx		\
		Modules/java.cxx		\
		Modules/javascript.cxx		\
		Modules/lang.cxx		\
		Modules/lua.cxx			\
		Modules/main.cxx		\
		Modules/modula3.cxx		\
		Modules/module.cxx		\
		Modules/mzscheme.cxx		\
		Modules/nested.cxx		\
		Modules/ocaml.cxx		\
		Modules/octave.cxx		\
		Modules/overload.cxx		\
		Modules/perl5.cxx		\
		Modules/php.cxx			\
		Modules/pike.cxx		\
		Modules/python.cxx		\
		Modules/r.cxx			\
		Modules/ruby.cxx		\
		Modules/s-exp.cxx		\
		Modules/swigmain.cxx		\
		Modules/tcl8.cxx		\
		Modules/typepass.cxx		\
		Modules/uffi.cxx		\
		Modules/utils.cxx		\
		Modules/xml.cxx			\
		Preprocessor/cpp.c		\
		Preprocessor/expr.c		\
		Swig/cwrap.c			\
		Swig/deprecate.c		\
		Swig/error.c			\
		Swig/extend.c			\
		Swig/fragment.c			\
		Swig/getopt.c			\
		Swig/include.c			\
		Swig/misc.c			\
		Swig/naming.c			\
		Swig/parms.c			\
		Swig/scanner.c			\
		Swig/stype.c			\
		Swig/symbol.c			\
		Swig/tree.c			\
		Swig/typeobj.c			\
		Swig/typemap.c			\
		Swig/typesys.c			\
		Swig/wrapfunc.c			

swig.exe: $(swig_SOURCES) $(swig_HEADERS)
	cl /nologo $(swig_CFLAGS) $(swig_INCLUDES) -MP -DWIN32 -D_CONSOLE $(swig_SOURCES) \
	    /link /subsystem:console /out:$@ $(swig_LIBS)

CParse/parser.h: CParse/parser.c

CParse/parser.c: CParse/parser.y
	bison -d -o $@ $<

clean:
	$(RM) *.obj swig.exe swig.ilk *.pdb

.PHONY: clean
