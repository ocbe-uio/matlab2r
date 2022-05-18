#' @title Display the value of a variable
#' @description \code{disp(X)} displays the value of variable \code{X}
#' without printing the variable name. This is a wrapper around `base::cat()`
#' that includes a breakline in the end.
#' @param X variable
#' @return The value of \code{X}
#' @author Waldir Leoncio
#' @export
#' @examples
#' A <- c(15, 150)
#' S <- 'Hello World.'
#' disp(A)
#' disp(S)
disp <- function(X) cat(X, "\n")
