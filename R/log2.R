#' @title Base 2 logarithm
#' @description Base 2 logarithm and floating-point number dissection
#' @param X a scalar or vector of numbers
#' @param tol a tolerance level for numerical calculation of the log
#' @note User, beware: this is ridiculously slow and written in a hurry. If you
#' simply want to compute the base 2 logarithm of a number, use \code{log2()}
#' from \code{base}.
#' @return a list of mantissas and exponents such that mantissa * 2 ^ exponent
#' equals X
#' @export
log2 <- function(X, tol = 1e-4) {
  me <- data.frame(row.names = X)
  for (x in X) {
    if (x == 0) {
      me[row.names(me) == x, "mantissa"] <- 0
      me[row.names(me) == x, "exponent"] <- 0
    } else {
      for (mantissa in seq(-1, 1, .00001)) {
        for (exponent in seq(-100, 100)) {
          operation <- mantissa * 2 ^ exponent
          diff <- abs(operation - x)
          if (diff <= tol) {
            me[row.names(me) == x, "mantissa"] <- mantissa
            me[row.names(me) == x, "exponent"] <- exponent
          }
        }
      }
    }
  }
  return(as.list(me))
}
