#' @title Vector creation
#' @description Simulates the function `colon()` and its equivalent `:`
#' operator from Matlab, which have a similar but not quite equivalent behavior
#' when compared to `seq()` and `:` in R.
#' @param a initial number
#' @param b final number
#' @return A vector containing a sequence of integers going from a to b
#' @export
#' @examples
#' colon(1, 4)
#' colon(4, 8)
colon <- function(a, b) {
  if (a <= b) {
    return(a:b)
  } else {
    return(vector(mode = "numeric"))
  }
}
