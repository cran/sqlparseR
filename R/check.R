# ---------------------------------------------------------------------------
## .check_sqlparse_py():
# Check availability of py-sqlparse and, if not available, throw an error and
# lead the user to install_sqlparse_py(). Initializing Python is avoided
# because reticulate (1.13) cannot change the Python environment
# once a Python version is initialized; this can be necessary for
# install_sqlparse_py() to import the module after installation.
# ---------------------------------------------------------------------------

.check_sqlparse_py <- function() {

  # is a Python version already initialized?
  if (reticulate::py_available(initialize = FALSE)) {

    # sqlparse available in the initialized Python env?
    if (reticulate::py_module_available("sqlparse")) {

      return()

    } else {

      # sqlparse available on system? (in any env)
      if (!is.null(reticulate::py_discover_config(required_module = "sqlparse")$required_module_path)) {

        stop(paste("The sqlparse Python module is not available in the currently initialized Python environment",
             "but was found on the system. Try reload sqlparseR in a fresh R session."),
             call. = FALSE)

      } else {

        stop(paste("The sqlparse Python module is not available on your system.",
                   "Use install_sqlparse_py() to install it.",
                   "Additional note: A version of Python is currently initialized.",
                   "Therefore, it is advisable to start a fresh R session before installation."),
             call. = FALSE)

      }

    }

  # sqlparse available on system? (in any env)
  } else if (!is.null(reticulate::py_discover_config(required_module = "sqlparse")$required_module_path)) {

    return()

  } else {

    stop("The sqlparse Python module is not available on your system. Use install_sqlparse_py() to install it.",
         call. = FALSE)

  }

}
