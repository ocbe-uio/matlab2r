test_that("Vector of evenly-spaced numbers", {
  expect_equal(linspace(-50, 49), seq(-50, 49))
  expect_equal(linspace(-5, 5), seq(-5, 5, length.out = 100))
  expect_equal(linspace(-5, 5, 7), seq(-5, 5, length.out = 7))
  expect_equal(linspace(1 + 2i, 9 + 9i), seq(1 + 2i, 9 + 9i, length.out = 100))
})
