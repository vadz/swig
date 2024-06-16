/* -----------------------------------------------------------------------------
 * cdata.i
 *
 * SWIG library file containing macros for manipulating raw C data.
 * ----------------------------------------------------------------------------- */

%include <typemaps/cdata_begin.swg>

%insert("cheader") {
typedef struct SWIGCDATA {
    char *data;
    int   len;
} SWIGCDATA;
}

%typemap(ctype) SWIGCDATA "SWIGCDATA"
%typemap(cppouttype) SWIGCDATA "SWIGCDATA"

%typemap(out) SWIGCDATA {
    $result = $1;
}

%typemap(ctype) (const void *indata, int inlen) "const SWIGCDATA*"
%typemap(in) (const void *indata, int inlen) {
    $1 = $input->data;
    $2 = $input->len;
}

%include <typemaps/cdata_end.swg>
