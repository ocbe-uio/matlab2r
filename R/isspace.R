#' @title Determine space characters
#' @description Determine which characters are space characters
#' @param A a character array or a string scalar
#' @note Recognized whitespace characters are ` ` and `\\t`.
#' @author Waldir Leoncio
#' @return a vector TF such that the elements of TF are logical 1 (true) where
#' corresponding characters in A are space characters, and logical 0 (false)
#' elsewhere.
#' @export
#' @examples
#' chr <- "123 Main St."
#' X <- "\t a b\tcde f"
#' isspace(chr)
#' isspace(X)
isspace <- function(A) {
  A_split <- unlist(strsplit(A, ""))
  TF <- A_split %in% c(" ", "\t")
  return(as.numeric(TF))
}
