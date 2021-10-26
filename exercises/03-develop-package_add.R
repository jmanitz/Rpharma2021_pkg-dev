
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

# ---------------------------------------

#' Example Dataset
#'
#' A datset containing example toy data
#'
#' @format A data frame with 257 observations and 29 variables:
#' \describe{
#'   \item{id}{integer, unique identifier}
#'   \item{x}{character, random number}
#'   \item{y}{character, random number}
#' }
#'
#' @author Juliane Manitz
#' @examples
#' data(dat)
"dat"

# ---------------------------------------

### testing that functions in math.R are correct ###

test_that("simple tests", {
  expect_equal(add(10, 1), 11)
  expect_equal(plusone(4), 5)
})

test_that("tests using data frames", {
  dat$z <- dat$x + dat$y
  expect_equal(add(dat$x, dat$y), dat$z)
  expect_equal(add(dat$y, 1), plusone(dat$y))
})

test_that("error handling", {
  expect_error(add("a",5))
  expect_error(plusone("a"))
})



