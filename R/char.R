#' @title Convert an array to a character array
#' @description A character array is a sequence of characters, just as a
#' numeric array is a sequence of numbers. A typical use is to store a short
#' piece of text as a row of characters in a character vector.
#' @param A a vector or array (not yet supported)
#' @return `A` converted to characters
#' @author Waldir Leoncio
#' @export
#' @examples
#' char("Hi!")
#' char(matrix(letters, 2))
setGeneric(
  name = "char",
  def  = function(A) standardGeneric("char")
)

#' @describeIn char Converting a character vector
setMethod(
  f          = "char",
  signature  = "character",
  definition = function(A) as.character(A)
)

#' @describeIn char Converting a character array
setMethod(
  f          = "char",
  signature  = "array",
  definition = function(A) {
    if (typeof(A) %in% c("integer", "double")) {
      stop("Numeric arrays not yet supported")
    }
    array(A, dim = c(nrow(A), 1, ncol(A)))
  }
)
