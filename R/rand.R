#' @title Generate matrix with U(0, 1) trials
#' @description Imitates the behavior of `rand()` on Matlab
#' @param r number of rows of output matrix
#' @param c number of columns of output matrix
#' @importFrom stats runif
#' @return \eqn{r \times c} matrix with random trials from a standard uniform distribution.
#' @export
#' @examples
#' rand()
#' rand(3, 2)
rand <- function(r = 1, c = 1) {
  matrix(runif(r * c), r, c)
}
