# ---------------------------------------------------------------------------
## install_sqlparse_py():
# Install py-sqlparse (and import it).
# ---------------------------------------------------------------------------

install_sqlparse_py <- function(method = "auto", conda = "auto", envname = NULL, skip_if_available = FALSE) {

  if (skip_if_available &&
       (!is.null(reticulate::py_discover_config(required_module = "sqlparse")$required_module_path))) {

    return(invisible(1))

  }

  tryCatch(reticulate::py_install(c("sqlparse", "numpy"), envname = envname, method = method, conda = conda),

          error = function(e) {message(paste0("\n", e$message))

                    message(paste("-> Make sure you have Python with virtualenv",
                                  " or conda installed (on Windows you need conda).",
                                  "\n-> Try in a fresh R session.",
                                  "\n-> If not successful, use pip or conda outside of the R environment."))

                    return(invisible(1))

                  })

  tryCatch(invisible(reticulate::import("sqlparse")),

                             error = function(e) {message(paste0("\n", e$message))

                               message(paste("Installation successful but loading the sqlparse Python module failed.",
                                             "Try using sqlparseR in a fresh R session."))

                               return(invisible(1))

                             })

  return(invisible(0))

}
