\name{sql_parse}
\alias{sql_parse}
\title{
Parse SQL Statements
}
\description{
Parse one or several SQL statements (non-validating).
}
\usage{
sql_parse(sql, encoding = NULL)
}
\arguments{
  \item{sql}{
Character string containing one or more SQL statements to be formatted.
}
  \item{encoding}{
Character string specifying the input encoding. Default: \code{NULL} (assumes UTF-8 or latin-1)
}
}
\details{
This function is a wrapper to the \emph{sqlparse.parse()} function from the \emph{\href{https://github.com/andialbrecht/sqlparse}{sqlparse}} Python module, which is a non-validating SQL parser.
}
\value{
List with \emph{reference class} objects which are converted instances of the custom Python class \emph{Statement}. These tree-ish representations of the parsed statements can be analyzed with a set of reference class methods (accessed via $). See the documentation of the corresponding Python methods: \url{https://sqlparse.readthedocs.io/en/stable/analyzing/}.
}
\seealso{
\code{\link{sql_format}}, \code{\link{sql_split}}
}
\examples{
  if (reticulate::py_module_available("sqlparse")) {

    library("sqlparseR")

    raw <- "select*from foo; select*from bar;"

    parsed <- sql_parse(raw)

    ## Analyzing the parsed statements
    # e.g., get name of identifier in second statement
    n <- parsed[[2]]$get_name()
    print(n)

    # e.g., get a (Python) generator yielding ungrouped tokens of the first statement
    token_it <- parsed[[1]]$flatten()
    for (t in reticulate::iterate(token_it)) {
      print(t)
    }
  }
}
\keyword{SQL}
