#' @title Reshape array
#' @description Reshapes a matrix according to a certain number of dimensions
#' @param A input matrix
#' @param sz vector containing the dimensions of the output vector
#' @details This function replicates the functionality of the `reshape()`
#' function on Matlab. This function is basically a fancy wrapper for the
#' `array()` function in R, but is useful because it saves the user translation
#' time. Moreover, it introduces validation code that alter the behavior of
#' `array()` and makes it more similar to `replicate()`.
#' @note The Matlab function also accepts as input the dismemberment of sz as
#' scalars.
#' @return the input matrix, reshaped according to the vector sz
#' @export
#' @examples
#' mx <- matrix(1:4, 2)
#' ra <- array(1:12, c(2, 3, 2))
#'
#' mx
#' reshape(mx, c(1, 4))
#'
#' ra
#' reshape(ra, c(3, 2, 2))
reshape <- function(A, sz) {
  # Validation
  if (prod(sz) != prod(dim(A))) {
    stop("To RESHAPE the number of elements must not change.")
  }
  if (length(sz) == 1) {
    stop("Size vector must have at least two elements.")
  }

  # Reshaping A
  A <- array(A, sz)
  return(A)
}
