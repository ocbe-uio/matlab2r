#' @title Round toward zero
#' @description Rounds each element of input to the nearest integer towards
#' zero. Basically the same as trunc()
#' @param X input element
#' @author Waldir Leoncio
#' @return The values of \code{trunc(X)}.
#' @export
#' @examples
#' X <- matrix(c(-1.9, -3.4, 1.6, 2.5, -4.5, 4.5), 3, byrow = TRUE)
#' Y <- matrix(c(-1, -3, 1, 2, -4, 4), 3, byrow = TRUE)
#' fix(X)
#' fix(Y)
fix <- function(X) trunc(X)
