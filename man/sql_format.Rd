\name{sql_format}
\alias{sql_format}
\title{
Format SQL Statements
}
\description{
Beautifies SQL statements according to numerous formatting settings.
}
\usage{
sql_format(sql, keyword_case = NULL, identifier_case = NULL,
           strip_comments = TRUE, reindent = FALSE, indent_width = 2,
           indent_tabs = FALSE, indent_after_first = FALSE,
           indent_columns = FALSE, reindent_aligned = FALSE,
           use_space_around_operators = FALSE, wrap_after = NULL,
           comma_first = FALSE, truncate_strings = NULL,
           truncate_char = "[...]", encoding = NULL)
}
\arguments{
  \item{sql}{
Character string containing one or more SQL statements to be formatted.
}
  \item{keyword_case}{
Character string specifying how keywords are formatted. Options: \code{"upper"}, \code{"lower"}", and \code{"capitalize"}. Default: \code{NULL}
}
  \item{identifier_case}{
Character string specifying how identifiers are formatted. Options: \code{"upper"}, \code{"lower"}", and \code{"capitalize"}. Default: \code{NULL}
}
  \item{strip_comments}{
Boolean; if \code{TRUE} comments are removed from the SQL statements. Default: \code{TRUE}
}
  \item{reindent}{
Boolean; if \code{TRUE} the indentations of the statements are changed. Default: \code{FALSE}
}
  \item{indent_width}{
Positive integer specifying the width of the indentation. Default: \code{2}
}
  \item{indent_tabs}{
Boolean; if \code{TRUE} tabs instead of spaces are used for indentation. Default: \code{FALSE}
}
  \item{indent_after_first}{
Boolean; if \code{TRUE} second line of statement is indented (e.g. after SELECT). Default: \code{FALSE}
}
  \item{indent_columns}{
Boolean; if \code{TRUE} all columns are indented by \code{indent_width} instead of keyword length. Default: \code{FALSE}
}
  \item{reindent_aligned}{
Boolean; if \code{TRUE} the statements are reindented to aligned format. Default: \code{FALSE}
}
  \item{use_space_around_operators}{
Boolean; if \code{TRUE} spaces are placed around mathematical operators. Default: \code{FALSE}
}
  \item{wrap_after}{
Positive integer specifying the column limit (in characters) for wrapping comma-separated lists. If \code{NULL}, every item is put on its own line. Default: \code{NULL}
}
  \item{comma_first}{
Boolean; if \code{TRUE} a linebreak is inserted before comma. Default: \code{FALSE}
}
  \item{truncate_strings}{
Positive integer; string literals longer than the given value are truncated. Default: \code{NULL}
}
  \item{truncate_char}{
Character string appended if long string literals are truncated. Default: \code{"[...]"}
}
  \item{encoding}{
Character string specifying the input encoding. Default: \code{NULL} (assumes UTF-8 or latin-1)
}
}
\details{
This function is a wrapper to the \emph{sqlparse.format()} function from the \emph{\href{https://github.com/andialbrecht/sqlparse}{sqlparse}} Python module, which is a non-validating SQL parser.
}
\value{
Character string containing the formatted SQL statements.
}
\seealso{
\code{\link{sql_split}}, \code{\link{sql_parse}}
}
\examples{
  if (reticulate::py_module_available("sqlparse")) {

    library("sqlparseR")

    raw <- "SELECT * FROM FOO WHERE BAR > 4500;"

    formatted <- sql_format(raw,
                            keyword_case = "capitalize",
                            identifier_case = "lower",
                            reindent = TRUE,
                            indent_after_first = TRUE)
    cat(formatted)
  }
}
\keyword{SQL}
