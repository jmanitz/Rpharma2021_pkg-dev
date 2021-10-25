x <- 1:10

class(x)

inherits(x, "integer")
inherits(x, "numeric")


class(x) <- c("blah", class(x))
class(x)
inherits(x, "blah")
inherits(x, "integer")


# Pro tip

addClass <- function(x, class) {
  new_class <- unique(c(class, class(x)))
  structure(x, class = new_class)
}

y <- letters[1:10]
class(y)

y <- addClass(y, "blah")
class(y)
