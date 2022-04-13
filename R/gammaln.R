#' @title Logarithm of gamma function
#' @description Calculates the natural logarithm of the gamma function
#' @param A a non-negative, real matrix, vector or scalar
#' @return An element-by-element \code{ln(gamma())}-transformed A
#' @note For MATLAB output reproduction, non-positive values will be
#' @author Waldir Leoncio
#' @export
#' @examples
#' gammaln(8)
#' gammaln(0)
#' gammaln(matrix(1:9, 3))
#' gammaln(-4:10)
gammaln <- function(A) {
  A[A <= 0] <- Inf
  return(log(gamma(A)))
}
