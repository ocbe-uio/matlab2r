#' @title Checks if a list contains a field
#' @description This function tries to replicate the behavior of the `isfield`
#' function in Matlab
#' @param x list
#' @param field name of field
#' @references https://se.mathworks.com/help/matlab/ref/isfield.html
#' @return A logical vector determining if \code{field} is within \code{names(x)}
#' @export
#' @examples
#' S <- list(
#'   x = rnorm(100),
#'   title = "x"
#' )
#' isfield(S, "title")
#' isfield(S, "z")
isfield <- function(x, field) {
  sapply(field, function(f) f %in% names(x))
}
