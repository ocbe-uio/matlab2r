#' @title Assert if condition is true
#' @description Throw error if condition false
#' @param cond Logical test
#' @param msg Error message to be displayed if \code{cond == FALSE}
#' @param A values to format \code{msg} if the latter contains C-style
#' formatting commands.
#' formatted as parsable
#' @return The error message if \code{cond == FALSE}, nothing otherwise
#' @author Waldir Leoncio
#' @export
#' @examples
#' minVal <- 7
#' x <- 26
#' assert(minVal < x) # should return nothing
#' maxVal <- 13
#' \dontrun{
#'   assert((minVal < x) && (x < maxVal))
#'   assert(x == "a", "x is %s", class(x))
#' }
assert <- function(cond, msg = "Assertion failed.", A = NULL) {
  if (!cond) {
    if (!is.null(A)) {
      msg <- sprintf(msg, A)
    }
    stop(msg)
  }
}
