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
  y <- x + 1
  addClass(y, "plusone")
}

#' @noRd
#' @export
print.plusone <- function(y) {
  cat(paste("x + 1 = ", y))
  invisible(y)
}

#' Add a class to object
#'
#' Utility to add (prepend) a class(es) to existing objects.
#'
#' @param x The object to receive new class(es).
#' @param class Character. The new class to add.
#' @return An object with new classes.
#' @author Stu Field
#' @seealso [class()], [typeof()]
#' @examples
#' class(iris)
#' addClass(iris, "something_new") %>% class()
#' addClass(iris, c("cl_A", "cl_B")) %>% class()  # 2 classes
#' addClass(iris, c("A", "A")) %>% class()        # no duplicates
#' @export
addClass <- function(x, class) {
  new_class <- unique(c(class, class(x)))
  structure(x, class = new_class)
}
