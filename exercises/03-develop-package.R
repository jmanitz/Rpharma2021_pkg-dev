# --- Part II ------------------------------------------------------------------

#install.packages(c("devtools", "roxygen2", "usethis","fs"))
require(usethis)
require(roxygen2)
require(devtools)

# --- Preparation --------------------------------------------------------------

create_package("../../myutils", open = TRUE)

edit_file("DESCRIPTION")

# --- I have a package structure, now what? ------------------------------------

# --- Write R code -------------------------------------------------------------

# define some basic functions
add <- function(x, y){ x + y }
plusone <- function(x){ x + 1 }

# test your source code
add(10, 1)
plusone(4)

# create and open R file, shortcut to open R files, ctrl + .
use_r("math")

# --- Example Data -------------------------------------------------------------

# prepare some example data
dat <- data.frame(id=1:10, x=rpois(10, 5), y=rpois(10, 5))

# examples
add(dat$x, dat$y)
plusone(dat$y)

# Save data in the package
use_data(dat)

# --- Example Data -------------------------------------------------------------

# \name{add}
# \alias{add}
# \title{Add together two numbers}
# \usage{ add(x, y) }
# \arguments{
#   \item{x}{A number}
#   \item{y}{A number}
# }
# \value{
#   The sum of \code{x} and \code{y}
# }
# \description{ Add together two numbers }
# \examples{
#   add(1, 1)
#   add(10, 1)
#
#   data(dat)
#   add(dat$x, dat$y)
# }


## roxygen2

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
add <- function(x, y) {
  x + y
}

# Convert roxygen comments
roxygenize()
# Preview documentation
?add

### NAMESPACE

# Add `@export` to roxygen comments
#' @export

# Compile documentation
roxygenize()

# View namespace
edit_file("NAMESPACE")

# --- Unit Testing -------------------------------------------------------------

use_test("math")

require(testthat)

test_check("myutils")


# --- Tools to manage your DESCRIPTION and NAMESPACE ---------------------------
use_package("dplyr")
use_package("here", type = "Suggests")
use_pipe()
use_tibble()

# --- I have a package with functions, now what? -------------------------------

# largely from `devtools`
check()    # cmd + shift + e
test()     # cmd + shift + t
document() # cmd + shift + d
# load_all, unlike source, functions/data are not dumped to your global environment
load_all() # cmd + shift + L
install()
# install.packages("path/to/package/folder", repos = NULL, type = "source")
