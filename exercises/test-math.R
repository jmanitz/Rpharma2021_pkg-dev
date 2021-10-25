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

