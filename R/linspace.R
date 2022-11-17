#' @title Generate linearly-spaced vector
#' @description This is a soft wrap around the [base::seq()] function.
#' @param x1 start point
#' @param x2 end point
#' @param n length of output
#' @return A numeric vector of \code{n} numbers between \code{x1} and \code{x2}.
#' @author Waldir Leoncio
#' @export
#' @examples
#' linspace(-5, 4)
#' linspace(1 + 2i, 9 + 9i, 5)
linspace <- function(x1, x2, n = 100L) {
  y <- seq(x1, x2, length.out = n)
  return(y)
}
