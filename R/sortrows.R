#' @title Sort rows of matrix or table
#' @description Emulates the behavior of the `sortrows` function on Matlab
#' @param A matrix
#' @param column ordering column
#' @examples
#' mx <- matrix(c(3, 2, 2, 1, 1, 10, 0, pi), 4)
#' mx
#' sortrows(mx)
#' @export
#' @return The A matrix sorted by the first row, then the second
sortrows <- function(A, column = 1) {
  if (length(column) == 1) {
    new_row_order <- order(A[, column])
  } else if (length(column) == 2) {
    new_row_order <- order(A[, column[1]], A[, column[2]])
  } else {
    stop("Not yet implemented for 2+ tie-breakers")
  }
  A_reordered <- A[new_row_order, ]
  return(A_reordered)
}
