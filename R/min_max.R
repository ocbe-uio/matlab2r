#' @title Minimum (MATLAB version)
#' @description Finds the minimum value for each column of a matrix, potentially returning the indices instead
#' @param X matrix
#' @param indices return indices?
#' @importFrom methods is
#' @author Waldir Leoncio
#' @return Either a list or a vector
#' @export
#' @examples
#' A <- matrix(c(23, 42, 37, 15, 52))
#' min(A)
#' base::min(A) # for comparison
min <- function(X, indices = TRUE) {
  if (!is(X, "matrix")) X <- as.matrix(X)
  mins <- apply(X, 2, base::min)
  idx <- sapply(seq_len(ncol(X)), function(x) match(mins[x], X[, x]))
  if (indices) {
    return(list(mins = mins, idx = idx))
  } else {
    return(mins)
  }
}

#' @title Maximum (MATLAB version)
#' @description Finds the minimum value for each column of a matrix, potentially returning the indices instead
#' @param X matrix
#' @param indices return indices?
#' @author Waldir Leoncio
#' @return Either a list or a vector
#' @export
#' @examples
#' A <- matrix(c(23, 42, 37, 15, 52))
#' max(A)
#' base::max(A) # for comparison
max <- function(X, indices = TRUE) {
  if (!is(X, "matrix")) X <- as.matrix(X)
  maxs <- apply(X, 2, base::max)
  idx <- sapply(seq_len(ncol(X)), function(x) match(maxs[x], X[, x]))
  if (indices) {
    return(list(maxs = maxs, idx = idx))
  } else {
    return(maxs)
  }
}
