#' @title Is Array Empty?
#' @description Determine whether array is empty. An empty array, table, or timetable has at least one dimension with length 0, such as 0-by-0 or 0-by-5.
#' @details Emulates the behavior of the `isempty` function on Matlab
#' @param x array
#' @return A logical value determining if x is empty
#' @export
#' @examples
#' isempty(array(dim = c(0, 2, 2)))
#' isempty(matrix(rep(NA, 4), 2))
#' isempty(matrix(rep(0, 4), 2))
#' isempty(as.factor(c(NA, NA)))
#' isempty(factor())
#' isempty(matrix(rep("", 3)))
isempty <- function(x) {
  if (class(x)[1] %in% c("array", "matrix")) {
    dim_mat_x <- dim(x)
  } else {
    dim_mat_x <- dim(matrix(x))
  }
  return(any(dim_mat_x == 0) | is.null(dim_mat_x))
}
