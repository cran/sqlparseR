# ---------------------------------------------------------------------------
## sql_format()
# function wrapping sqlparse.format() Python function imported via reticulate
# ---------------------------------------------------------------------------

sql_format <- function(sql,
                       keyword_case               = NULL,
                       identifier_case            = NULL,
                       strip_comments             = TRUE,
                       reindent                   = FALSE,
                       indent_width               = 2,
                       indent_tabs                = FALSE,
                       indent_after_first         = FALSE,
                       indent_columns             = FALSE,
                       reindent_aligned           = FALSE,
                       use_space_around_operators = FALSE,
                       wrap_after                 = NULL,
                       comma_first                = FALSE,
                       truncate_strings           = NULL,
                       truncate_char              = "[...]",
                       encoding                   = NULL) {

  .check_sqlparse_py()

  arguments <- mget(names(formals()))

  arguments[sapply(arguments, is.null)] <- NULL

  return(do.call(.sqlparse$format, arguments))

}

# ---------------------------------------------------------------------------
## sql_parse()
# function wrapping sqlparse.parse() Python function imported via reticulate
# ---------------------------------------------------------------------------

sql_parse <- function(sql, encoding = NULL) {

  .check_sqlparse_py()

  return(.sqlparse$parse(sql, encoding))

}

# ---------------------------------------------------------------------------
## sql_split()
# function wrapping sqlparse.split() python function imported via reticulate
# ---------------------------------------------------------------------------

sql_split <-  function(sql, encoding = NULL) {

  .check_sqlparse_py()

  return(.sqlparse$split(sql, encoding))

}
