# ---------------------------------------------------------------------------
# ------------------------------- sqlparseR ---------------------------------
# ---------------------------------------------------------------------------

.onLoad <- function(libname, pkgname) {

  # try() because if a Python version is already initialized
  # delay_load will be ignored causing an error if sqlparse is missing

  try(

    assign(".sqlparse",
           reticulate::import("sqlparse", delay_load = TRUE),
           envir = parent.env(environment())),

    silent = TRUE

    )

  }
