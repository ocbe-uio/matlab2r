#' @title Base 2 logarithm
#' @description Base 2 logarithm and floating-point number dissection
#' @param X a scalar or vector of numbers
#' @param dissect if \code{TRUE}, returns the mantissa and exponent.
#' @return either a vector or a list of mantissas and exponents such that
#' mantissa * 2 ^ exponent equals X
#' @export
log2 <- function(X, dissect = TRUE) {
  if (!dissect) return(base::log2(X))
  me <- data.frame(row.names = X)
  for (x in X) {
    if (x == 0) {
      me[row.names(me) == x, "mantissa"] <- 0
      me[row.names(me) == x, "exponent"] <- 0
    } else {
      E <- ifelse(x == 0, 0, floor(base::log2(abs(x))) + 1)
      F <- x / 2 ^ E
      me[row.names(me) == x, "mantissa"] <- F
      me[row.names(me) == x, "exponent"] <- E
    }
  }
  return(as.list(me))
}
