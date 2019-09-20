\name{install_sqlparse_py}
\alias{install_sqlparse_py}
\title{
Install sqlparse Python package
}
\description{
Install the \emph{sqlparse} Python package into a virtual environment or conda environment.
}
\usage{
install_sqlparse_py(method = "auto", conda = "auto",
                    envname = NULL, skip_if_available = FALSE)
}
\arguments{
  \item{method}{
Installation method passed to \code{\link[reticulate]{py_install}}. Options: "auto", "virtualenv", and "conda". Default: "auto"
}
  \item{conda}{
Path to conda executable passed to \code{\link[reticulate]{py_install}}. Alternatively, "auto" to find conda using the PATH and other conventional install locations. Default: "auto"
}
  \item{envname}{
The name, or full path, of the environment in which the \emph{sqlparse} Python package is to be installed. Alternatively, \code{NULL} to use the active environment as set by the \code{RETICULATE_PYTHON_ENV} variable or, if that is unset, the r-reticulate environment. Default: \code{NULL}
}
  \item{skip_if_available}{
Boolean; if \code{TRUE} the installation is skipped in case the \emph{sqlparse} Python module can be found on the system (search not limited to \code{envname}). Default: \code{FALSE}
}
}
\value{
0 on successful installation or 1 in case an error was raised
}
\examples{
\dontrun{
install_sqlparse_py()
}
}
