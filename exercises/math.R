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
#' @export
plusone <- function(x){
  x + 1
}
