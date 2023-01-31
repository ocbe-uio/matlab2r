#' @title Array elements that are members of set array
#' @description Checks which members of one entity are in another
#' @param A a vector, matrix or dataframe
#' @param B another vector, matrix or dataframe
#' @param rows if \code{TRUE}, each row of A and each row of B are treated as
#' single entities
#' @param indices if \code{TRUE}, outputs the lowest B index for each match in A
#' @return a binary vector telling if the corresponding A indices are in B. If
#' \code{indices = TRUE}, also prints the index in B where the match first
#' occurs.
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
setGeneric(
  name = "ismember",
  def  = function(A, B, rows = FALSE, indices = FALSE) {
    if (rows) {
      A <- as.data.frame(A)
      B <- as.data.frame(B)
      return(ismember(A, B, rows, indices))
    }
    matches <- match(A, B, nomatch = 0L, incomparables = NaN)
    out <- as.integer(matches != 0L)
    if (is(A, "matrix")) out <- matrix(out, nrow = nrow(A))
    if(indices) out <- list("presence" = out, "locations" = matches)
    return(out)
  }
)
setMethod(
  f = "ismember",
  signature = c("data.frame", "data.frame"),
  definition = function(A, B, rows, indices) {
    out <- vector("integer", length = nrow(A))
    matches <- vector("integer", length = nrow(A))
    for (a in seq_len(nrow(A))) {
      for (b in seq_len(nrow(B))) {
        if (all(A[a, ] == B[b, ])) {
          out[a] <- 1L
          matches[a] <- ifelse(matches[a] == 0, b, base::min(b, matches[a]))
        }
      }
    }
    if(indices) out <- list("presence" = out, "locations" = matches)
    return(out)
  }
)

ismembertol <- function(A, B, rows = FALSE, indices = TRUE) {
  A <- round(A, digits = 10L)
  B <- round(B, digits = 10L)
  ismember(A, B)
}
