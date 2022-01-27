#' @title Number of function input arguments
#' @description Returns the number of arguments passed to the parent function
#' @author Waldir Leoncio
#' @note This function only makes sense inside another function
#' @references https://stackoverflow.com/q/64422780/1169233
#' @return An integer indicating how many input arguments a function received.
#' @export
#' @examples
#' f <- function(x, y, z) return(nargin())
#' f(pi)
#' f(y = 6, z = 5)
#' f(letters)
#' f(letters, LETTERS, pi)
nargin <- function() {
  if (sys.nframe() < 2) stop("must be called from inside a function")
  length(as.list(sys.call(-1))) - 1
}
