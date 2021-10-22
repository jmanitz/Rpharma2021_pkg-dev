
# ---------------------------------------

\name{add}
\alias{add}
\title{Add together two numbers}
\usage{ add(x, y) }
\arguments{
  \item{x}{A number}
  \item{y}{A number}
}
\value{
  The sum of \code{x} and \code{y}
}
\description{ Add together two numbers }
\examples{
  add(1, 1)
  add(10, 1)

  data(dat)
  add(dat$x, dat$y)
}

# ---------------------------------------

# define some basic functions

#' Add together two numbers.
#'
#' @param x A number.
#' @param y A number.
#' @return The sum of \code{x} and \code{y}.
#' @examples
#'   add(1, 1)
#'   add(10, 1)
#'
#'   data(dat)
#'   add(dat$x, dat$y)
#' @export
add <- function(x, y) {
  x + y
}

#' Add 1 to a number
#'
#' @param x A number
#' @return The sum of \code{x + 1}
#' @examples
#' plusone(13)
#'
#' data(dat)
#' plusone(dat$y)
plusone <- function(x){
  x + 1
}
