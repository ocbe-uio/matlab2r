test_that("Value in expected range", {
  minVal <- 7
  x <- 26
  expect_silent(assert(minVal < x))
  maxVal <- 13
  expect_error(assert((minVal < x) && (x < maxVal)), "Assertion failed.")
})

test_that("Expected data type", {
  a <- 13
  b <- 42L
  c <- a * b
  expect_error(assert(is(c,"double"), "Product is not double."), "not double.")
  expect_error(assert(is(c,"double"), "Product is %s.", class(c)), "numeric.")
})
