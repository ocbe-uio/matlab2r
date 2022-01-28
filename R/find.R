#' @title Find indices and values of nonzero elements
#' @description Emulates behavior of `find`
#' @param x object or logic operation on an object
#' @param sort sort output?
#' @return A vector of indices of x that satisfy the logical test
#' (nonzero, by default).
#' @export
#' @examples
#' X <- matrix(c(1, 0, 2, 0, 1, 1, 0, 0, 4), 3, byrow = TRUE)
#' Y <- seq(1, 19, 2)
#' find(X)
#' find(Y == 13)
find <- function(x, sort = TRUE) {
  if (is.logical(x)) {
    out <- which(x)
  } else {
    out <- which(x > 0)
  }
  if (sort) {
    out <- sort(out)
  }
  return(out)
}
