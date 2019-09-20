\name{sql_split}
\alias{sql_split}
\title{
Split SQL to Single Statements
}
\description{
Split a string with (one or) several SQL statements into single statements.
}
\usage{
sql_split(sql, encoding = NULL)
}
\arguments{
  \item{sql}{
Character string containing (one or) several SQL statements
}
  \item{encoding}{
Character string specifying the input encoding. Default: \code{NULL} (assumes UTF-8 or latin-1)
}
}
\details{
This function is a wrapper to the \emph{sqlparse.split()} function from the \emph{\href{https://github.com/andialbrecht/sqlparse}{sqlparse}} python module, which is a non-validating SQL parser.
}
\value{
Character vector with the single SQL statements.
}
\seealso{
\code{\link{sql_format}}, \code{\link{sql_parse}}
}
\examples{
  if (reticulate::py_module_available("sqlparse")) {

    library("sqlparseR")

    raw <- "select*from foo; select*from bar;"

    statements <- sql_split(raw)

    print(statements)

  }
}
\keyword{SQL}
