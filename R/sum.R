#' @title Sum of array elements
#' @description Returns the sum of the elements of the first input
#' @param A vector, matrix or array
#' @param dim dimention over which A is to be summed
#' @return The total, row or column sum of A
#' @author Waldir Leoncio
#' @export
#' @examples
setGeneric(
  name = "sum_MATLAB",
  def  = function(A, dim) standardGeneric("sum_MATLAB")
)

#' @describeIn sum Sum elements of A along the first array dimension whose size
#' does not equal 1
setMethod(
  f = "sum_MATLAB",
  signature = c("array", "missing"),
  definition = function(A) {
    first_not1_dim <- base::min(which(base::dim(A) != 1))
    total <- switch(first_not1_dim, colSums(A), rowSums(A))
    return(total)
  }
)

#' @describeIn sum Computes the sum of all elements of A
setMethod(
  f = "sum_MATLAB",
  signature = c("array", "character"),
  definition = function(A, dim) {
    if (dim != "all") stop("Invalid option. Option must be 'all'.")
    return(sum(A))
  }
)

#' @describeIn sum Computes the sum of all elements of A
setMethod(
  f = "sum_MATLAB",
  signature = c("array", "numeric"),
  definition = function(A, dim) {
    if (length(dim) > 1) stop("Vectored dimensions not supported")
    dim <- ifelse(dim <= length(dim(A)), dim, length(dim(A)) + 1)
    return(switch(dim, colSums(A), rowSums(A), A))
  }
)
