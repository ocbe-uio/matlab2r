# This file contains miscellaneous functions that are not to be used by a
# package user.

#' @title Prints welcome message on package load
#' @description Prints package version number and welcome message on package
#' load
#' @param libname library location. See `?base::.onAttach` for details
#' @param pkgname package name. See `?base::.onAttach` for details
.onAttach <- function(libname, pkgname) {
  version <- read.dcf(
    file   = system.file("DESCRIPTION", package = pkgname),
    fields = "Version"
  )
  packageStartupMessage(
    "This is ", paste(pkgname, version), "\n\n",
    "Please notice that some of this package functions (listed below) have ",
    "homonymous functions on other packages. Therefore, you should consider ",
    "making explicit calls to them in the form 'package::function()' to avoid ",
    "ambiguous calls."
  )
}
