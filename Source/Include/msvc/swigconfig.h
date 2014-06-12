/* Source/Include/swigconfig.h.in.  Generated from configure.in by autoheader.  */

/* Define to 1 if the system has the type `bool'. */
#define HAVE_BOOL 1

/* define if the Boost library is available */
#define HAVE_BOOST 

/* Define to 1 if you have the <inttypes.h> header file. */
#undef HAVE_INTTYPES_H

/* Define to 1 if you have the `dl' library (-ldl). */
#undef HAVE_LIBDL

/* Define to 1 if you have the `dld' library (-ldld). */
#undef HAVE_LIBDLD

/* Define to 1 if you have the <memory.h> header file. */
#undef HAVE_MEMORY_H

/* Define if you have PCRE library */
#define HAVE_PCRE 1

/* Define if popen is available */
#undef HAVE_POPEN

/* Define to 1 if you have the <stdint.h> header file. */
#undef HAVE_STDINT_H

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the <strings.h> header file. */
#undef HAVE_STRINGS_H

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#undef HAVE_SYS_TYPES_H

/* Define to 1 if you have the <unistd.h> header file. */
#undef HAVE_UNISTD_H

/* Define to 1 if your C compiler doesn't accept -c and -o together. */
#undef NO_MINUS_C_MINUS_O

/* Name of package */
#define PACKAGE "swig"

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT "http://www.swig.org"

/* Define to the full name of this package. */
#define PACKAGE_NAME "swig"

/* Define to the full name and version of this package. */
#define PACKAGE_STRING "swig 3.0.3"

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "swig"

/* Define to the version of this package. */
#define PACKAGE_VERSION "3.0.3"

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

#define SWIG_STRINGIZE2(x) #x
#define SWIG_STRINGIZE(x) SWIG_STRINGIZE2(x)

/* Compiler that built SWIG */
#define SWIG_CXX "MSVC " SWIG_STRINGIZE(_MSC_VER)

/* Directory for SWIG system-independent libraries */
#define SWIG_LIB ""

/* Directory for SWIG system-independent libraries (Unix install on native
   Windows) */
#define SWIG_LIB_WIN_UNIX ""

/* Platform that SWIG is built for */
#define SWIG_PLATFORM "Win32"

/* Version number of package */
#define VERSION "3.0.3"


/* Default language */
#define SWIG_LANG               "-tcl"

/* Deal with Microsofts attempt at deprecating C standard runtime functions */
#if defined(_MSC_VER)
# define _CRT_SECURE_NO_DEPRECATE
#endif


