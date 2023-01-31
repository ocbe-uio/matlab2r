#' @title Remainder after division½
#' @description Rreturns the remainder after division of \code{a} by \code{b},
#' where \code{a} is the dividend and \code{b} is the divisor. This function is
#' often called the remainder operation. The \code{rem} function follows the
#' convention that \code{rem(a,0)} is \code{NaN}.
#' @param a the dividend
#' @param b the divisor
#' @return The remainder
#' @author Waldir Leoncio
#' @export
#' @examples
#' rem(23, 5)
#' rem(1:5, 3)
#' rem(c(-4, -1, 7, 9), 3)  #FIXME
#' rem(c(0, 3.5, 5.9, 6.2, 9, 4 * pi), 2 * pi)
rem <- function(a, b) {
  if(b == 0) {
    return(NaN)
  } else {
    remainder <- vapply(
      X   = a,
      FUN = function(a, b) if(a < 0) (-a %% b) * -1 else a %% b,
      FUN.VALUE = 0,
      b = b
    )
    return(remainder)
  }
}
