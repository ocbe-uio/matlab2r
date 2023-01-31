#' @title Array elements that are members of set array
#' @description Checks which members of one entity are in another
#' @param A a vector, matrix or dataframe
#' @param B another vector, matrix or dataframe
#' @param rows if \code{TRUE}, each row of A and each row of B are treated as
#' single entities
#' @param indices if \code{TRUE}, outputs the lowest B index for each match in A
#' @return
#' @author Waldir Leoncio
#' @export
#' @examples
#' # Values that are members of set
#' A <- c(5, 3, 4, 2)
#' B <- c(2, 4, 4, 4, 6, 8)
#' ismember(A, B)
#'
#' # Members of set and indices to values
#' ismember(A, B, indices = TRUE)
#'
#' # Table rows found in another table
#' A <- data.frame(
#'  "V1" = 1:5, "V2" = LETTERS[1:5], "V3" = as.logical(c(0, 1, 0, 1, 0))
#' )
#' B <- data.frame(
#'  "V1" = seq(1, 9, 2), "V2" = LETTERS[seq(1, 9, 2)], "V3" = as.logical(rep(0, 5))
#' )
#' ismember(A, B)
#'
ismember <- function(A, B, rows = FALSE, indices = FALSE) {
  if (is(A, "numeric") && is(B, "numeric")) {
    matches <- match(A, B)
    out <- as.numeric(!is.na(matches))
    matches[is.na(matches)] <- 0
    if(indices) out <- list("presence" = out, "locations" = matches)
  }
  return(out)
}
