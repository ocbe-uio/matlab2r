test_that("Values that are members of set and indices", {
  A <- c(5, 3, 4, 2)
  B <- c(2, 4, 4, 4, 6, 8)
  expect_equal(ismember(A, B), c(0, 0, 1, 1))
  expect_equal(
    ismember(A, B, indices = TRUE),
    list("presence" = c(0, 0, 1, 1), "locations" = c(0, 0, 2, 1))
  )
})

test_that("Table rows found in another table", {
  A <- data.frame(
  "V1" = 1:5, "V2" = LETTERS[1:5], "V3" = as.logical(c(0, 1, 0, 1, 0))
  )
  B <- data.frame(
  "V1" = seq(1, 9, 2), "V2" = LETTERS[seq(1, 9, 2)], "V3" = as.logical(rep(0, 5))
  )
  expect_equal(ismember(A, B), c(1, 0, 1, 0, 1))
})

test_that("Rows of another table and their location", {
  A <- data.frame(
    "Gender" = c("M", "M", "F", "M", "F"),
    "Age" = c(27, 52, 31, 46, 35),
    "Height" = c(74, 68, 64, 61, 64),
    row.names = c("Ted", "Fred", "Betty", "Bob", "Judy")
  )
  B <- data.frame(
    "Gender" = c("M", "F", "F", "F"),
    "Age" = c(47, 31, 35, 23),
    "Height" = c(68, 64, 62, 58),
    row.names = c("Joe", "Meg", "Beth", "Amy")
  )
  expect_equal(ismember(A, B), c(0, 0, 1, 0, 0))
  expect_equal(
    ismember(A, B, indices = TRUE),
    list("presence" = c(0, 0, 1, 0, 0), "locations" = c(0, 0, 2, 0, 0))
  )
})

test_that("Set members in presence of numerical error", {
  x <- t(1:6) * pi
  y <- 10 ^ log10(x)
  expect_true(all.equal(x, y))
  expect_false(identical(x, y))
  # MATLAB shows 1 on index 4 due to floating point differences.
  # Such differences are OS-dependent
  match_matrix <- switch(Sys.info()[["sysname"]],
    "Linux"   = t(c(0, 1, 1, 0, 1, 0)),
    "Darwin"  = t(c(1, 1, 1, 0, 1, 0)),
    "Windows" = t(c(1, 1, 1, 0, 1, 0))

  )
  expect_equal(ismember(x, y), match_matrix)
  expect_equal(ismembertol(x, y), t(c(1, 1, 1, 1, 1, 1)))
})

test_that("Rows that bwelong to a set", {
  A <- matrix(c(1, 2, 3, 4, 5, 6, 6, 8), nrow = 2)
  B <- matrix(c(2, 1, 2, 4, 3, 4, 6, 5, 6, 8, 7, 8), nrow = 3)
  expect_equal(ismember(A, B), matrix(rep(1, 8), nrow = nrow(A)))
  expect_equal(ismember(A, B, rows = TRUE), c(0, 1))
  expect_equal(
    ismember(A, B, rows = TRUE, indices = TRUE),
    list("presence" = c(0, 1), "locations" = c(0, 1))
  )
})

test_that("Members of set containing NaN values", {
  A <- B <- c(5, NaN, NaN)
  expect_equal(ismember(A, B), c(1, 0, 0))
  expect_equal(
    ismember(A, B, indices = TRUE),
    list("presence" = c(1, 0, 0), "locations" = c(1, 0, 0))
  )
})

test_that("Cell array of character vectors with trailing white space", {
  A <- c('dog','cat','fish','horse')
  B <- c('dog ','cat','fish ','horse')
  expect_equal(ismember(A, B), c(0, 1, 0, 1))
  expect_equal(
    ismember(A, B, indices = TRUE),
    list("presence" = c(0, 1, 0, 1), "locations" = c(0, 2, 0, 4))
  )
})

test_that("Members of char and cell array of character vectors", {
  A <- c('cat', 'dog', 'fox', 'pig')
  B <- c('dog','cat','fish','horse')
  expect_equal(ismember(A, B), c(1, 1, 0, 0))
  expect_equal(
    ismember(A, B, indices = TRUE),
    list("presence" = c(1, 1, 0, 0), "locations" = c(2, 1, 0, 0))
  )
})
