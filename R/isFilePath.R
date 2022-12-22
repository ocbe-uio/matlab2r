#' @title Check if an input is a valid path
#' @description A simple check if an input corresponds to a valid path to a file
#' @param x input
#' @return \code{TRUE} if \code{x} is a valid path, \code{FALSE} otherwise
#' @author Waldir Leoncio
isFilePath <- function(x) {
  isFP <- FALSE
  try(
    expr = {
      normalizePath(x, mustWork = TRUE)
      isFP <- TRUE
    },
    silent = TRUE
  )
  return(isFP)
}
