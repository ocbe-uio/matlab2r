#' @title Numeric to string
#' @description Converts a numeric value to character. This is essentially a
#' wrapper over [base::as.character()].
#' @param A numeric object
#' @param format either a number or a string (see `fmt` argument of
#' [base::sprintf()]).
#' @return `A`, with its format possibly reshaped by `format`
#' @author Waldir Leoncio
#' @export
#' @examples
#' X <- rnorm(10)
#' num2str(X)
#' num2str(X, 2)
#' A <- matrix(runif(4), 2)
#' num2str(A)
#' num2str(A, 3)
#' num2str(pi * 10, "%e")
#' @rdname num2str
setGeneric(
  name = "num2str",
  def  = function(A, format) standardGeneric("num2str")
)

#' @rdname num2str
setMethod(
  f          = "num2str",
  signature  = c("numeric", "missing"),
  definition = function(A) as.character(A)
)

#' @rdname num2str
setMethod(
  f          = "num2str",
  signature  = c("array", "missing"),
  definition = function(A) matrix(as.character(A), nrow(A))
)

#' @rdname num2str
setMethod(
  f          = "num2str",
  signature  = c("numeric", "numeric"),
  definition = function(A, format) {
    format <- base::max(abs(format), 1)
    return(as.character(round(A, format)))
  }
)

#' @rdname num2str
setMethod(
  f          = "num2str",
  signature  = c("array", "numeric"),
  definition = function(A, format) {
    matrix(as.character(round(A, format)), nrow(A))
  }
)

#' @rdname num2str
setMethod(
  f          = "num2str",
  signature  = c("numeric", "character"),
  definition = function(A, format) sprintf(format, A)
)

#' @rdname num2str
setMethod(
  f          = "num2str",
  signature  = c("array", "character"),
  definition = function(A, format) sprintf(format, A)
)
