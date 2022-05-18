#' @title Display the value of a variable
#' @description \code{disp(X)} displays the value of variable \code{X}
#' without printing the variable name. This is a paper-thin wrapper around
#' \code{print}
#' @param X variable
#' @return The value of \code{X}
#' @author Waldir Leoncio
#' @export
#' @examples
#' A <- c(15, 150)
#' S <- 'Hello World.'
#' disp(A)
#' disp(S)
disp <- function(X) print(X)
