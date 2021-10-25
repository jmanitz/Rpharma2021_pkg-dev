# --- Part II ------------------------------------------------------------------

#install.packages(c("devtools", "roxygen2", "usethis","fs"))
require(usethis)
require(roxygen2)
require(devtools)

# --- Preparation --------------------------------------------------------------

create_package("../../myutils", open = TRUE)

# Edit package Description
edit_file("DESCRIPTION")

# Adds license
use_gpl3_license()

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

# Create test file for math functions
use_test("math")

### testthat.R
# library(testthat)
# library(myutils)
#
# test_check("myutils")

### Adding tests: functions in math.R are correct ###

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

# --- I have a package with functions, now what? -------------------------------

# simulate installing and reloading your package
load_all() # cmd + shift + L

# update documentation, file collation and NAMESPACE.
document() # cmd + shift + d

# run most of the documentation checking components of R CMD check
check_man()

# make sure all examples work.
run_examples()

# reloads your code, then runs all testthat tests.
test()     # cmd + shift + t

# update the documentation, then builds and checks the package
check()    # cmd + shift + e

# build the package from package sources (only one R version)
build()

install() # install.packages("path/to/package/folder", repos = NULL, type = "source")
