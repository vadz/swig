clargs <- commandArgs(trailing=TRUE)
source(file.path(clargs[1], "unittest.R"))

dyn.load(paste("li_typemaps", .Platform$dynlib.ext, sep=""))
source("li_typemaps.R")

# A reference cannot be bound to a null pointer, so NULL is rejected rather than dereferenced in the call.
# The proxy coerces with as.integer(), turning NULL into integer(0), so call the wrapper directly instead.
check_nullref_rejected <- function(wrapper, name) {
  tryCatch({
      .Call(wrapper, NULL, FALSE, PACKAGE = "li_typemaps")
      # force an error if the previous line doesn't raise an exception
      stop("Test Failure")
    }, error = function(e) {
      if (e$message == "Test Failure") {
        stop(paste(name, "accepted NULL for a reference"))
      }
    }
  )
}

check_nullref_rejected("R_swig_inr_int", "inr_int")
check_nullref_rejected("R_swig_inoutr_int", "inoutr_int")

# The in_int_multi/out_int_multi/inout_int_multi tests other languages have are missing here as R cannot call them:
# INPUT and INOUT reject a plain value and OUTPUT fails in SET_VECTOR_ELT, both of which predate this test.
