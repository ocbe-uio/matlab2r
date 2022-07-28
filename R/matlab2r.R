#' @title Convert Matlab function to R
#' @description Performs basic syntax conversion from a Matlab function file to
#' R
#' @param filename name of the file
#' @param output can be "asis", "clean", "save" or "diff"
#' @param improve_formatting if `TRUE` (default), makes minor changes
#' to conform to best-practice formatting conventions
#' @param change_assignment if `TRUE` (default), uses `<-` as the assignment
#' operator
#' @param append if `FALSE` (default), overwrites file; otherwise, append
#' output to input
#' @param restyle if `TRUE`, will restyle the output with styler
#' (only for \code{output = "save"})
#' @param skip_lines vector of lines to be skipped. These will be commented out
#' and tagged as TODO, instead.
#' @author Waldir Leoncio
#' @importFrom utils write.table
#' @importFrom styler style_file
#' @note This function is intended to expedite the process of converting a
#' Matlab function to R by making common replacements. It does not have the
#' immediate goal of outputting a ready-to-use function. In other words,
#' after using this function you should go back to it and make minor changes.
#'
#' It is also advised to do a dry-run with `output = "clean"` and only switching
#' to `output = "save"` when you are confident that no important code will be
#' lost (for shorter functions, a careful visual inspection should suffice).
#' @return text converted to R, printed to screen or replacing input file
#' @export
#' @examples
#' matlab_script <- system.file("extdata", "matlabDemo.m", package = "matlab2r")
#' matlab2r(matlab_script)
#' matlab2r(matlab_script, output = "clean")
matlab2r <- function(
  filename, output = "diff", improve_formatting = TRUE,
  change_assignment = TRUE, append = FALSE, restyle = !improve_formatting,
  skip_lines = NULL
) {
  # (say, by rule and/or section)
  # ======================================================== #
  # Verification                                             #
  # ======================================================== #
  if (!file.exists(filename)) stop("File not found")

  # ======================================================== #
  # Reading file into R                                      #
  # ======================================================== #
  txt <- readLines(filename)
  original <- txt

  # ======================================================== #
  # Replacing text                                           #
  # ======================================================== #

  # Uncommenting ------------------------------------------- #
  txt <- gsub("^#\\s?(.+)", "\\1", txt)

  # Commenting out skipped lines ---------------------------- #
  if (!is.null(skip_lines)) {
    txt[skip_lines] <- gsub("(.+)", "# TODO: \\1", txt[skip_lines])
  }

  # Output variable ------------------------------------ ---- #
  out <- gsub(
    pattern     = "\\t*function ((\\S|\\,\\s)+)\\s?=\\s?(\\w+)\\((.+)\\)",
    replacement = "\\1",
    x           = txt[1]
  )
  if (substring(out, 1, 1) == "[") {
    out <- strsplit(out, "(\\,|\\[|\\]|\\s)")[[1]]
    out <- out[which(out != "")]
    out <- vapply(
      X   = seq_along(out),
      FUN = function(x) paste(out[x], "=", out[x]),
      FUN.VALUE = vector("character", 1)
    )
    out <- paste0("list(", paste(out, collapse = ", "), ")")
  }

  # Function header ---------------------------------------- #
  txt <- gsub(
    pattern     = "\\t*function (.+)\\s*=\\s*(.+)\\((.+)\\)",
    replacement = "\\2 <- function(\\3) {",
    x           = txt
  )
  txt <- gsub(
    pattern     = "function (.+)\\((.+)\\)",
    replacement = "\\1 <- function(\\2) {",
    x           = txt
  )

  # Function body ------------------------------------------ #
  txt <- gsub("(.+)\\.\\.\\.", "\\1", txt)
  txt <- gsub(";", "", txt)

  # Loops and if-statements
  txt <- gsub("for (\\S+)\\s?=\\s?(\\S+)", "for (\\1 in \\2) {", txt)
  txt <- gsub("end$", "}", txt)
  txt <- gsub("if (.+)", "if (\\1) {", txt)
  txt <- gsub("else$", "} else {", txt)
  txt <- gsub("elseif", "} else if", txt)
  txt <- gsub("while (.+)", "while (\\1) {", txt)

  # MATLAB-equivalent functions in R
  txt <- gsub("gamma_ln", "log_gamma", txt)
  txt <- gsub("nchoosek", "choose", txt)
  txt <- gsub("isempty", "is.null", txt)

  # Commenting out global variables ------------------------ #
  txt <- gsub("global", "# global", txt)

  # Subsets ------------------------------------------------ #
  ass_op <- ifelse(change_assignment, "<-", "=")
  txt <- gsub(
    pattern = "([^(]+)\\(([^\\(]+)\\)[^=]=(.+)",
    replacement = paste0("\\1[\\2] ", ass_op, "\\3"),
    x = txt
  )
  txt <- gsub("\\(:,\\s?([^)]+)\\)", "[, \\1]", txt)
  txt <- gsub("(.+)(\\[|\\():,end(\\]|\\()", "\\1[, ncol()]", txt)

  # Empty vectors ------------------------------------------ #
  txt <- gsub("= \\[\\]", paste(ass_op, "vector()"), txt)

  # Formatting --------------------------------------------- #
  if (improve_formatting) {
    txt <- gsub("(.),(\\S)", "\\1, \\2", txt)
    # Math operators
    txt <- gsub("(\\S)\\s?\\+\\s?(\\S)", "\\1 + \\2", txt)
    txt <- gsub("([^e\\s])\\s?\\-\\s?(\\S)", "\\1 - \\2", txt)
    txt <- gsub("(\\S)\\s?\\*\\s?(\\S)", "\\1 * \\2", txt)
    txt <- gsub("(\\S)\\\\s?/\\s?(\\S)", "\\1 / \\2", txt)
    # Logic operators
    txt <- gsub("~", "!", txt)
    txt <- gsub("(\\S)\\s?>=\\s?(\\S)", "\\1 >= \\2", txt)
    txt <- gsub("(\\S)\\s?<=\\s?(\\S)", "\\1 <= \\2", txt)
    txt <- gsub("(\\S)\\s?>\\s?(\\S)", "\\1 > \\2", txt)
    txt <- gsub("(\\S)\\s?<\\s?(\\S)", "\\1 < \\2", txt)
    txt <- gsub("(\\S)\\s?==\\s?(\\S)", "\\1 == \\2", txt)
    # Assignment
    txt <- gsub(
      pattern = "(\\w)\\s=\\s(\\w)",
      replacement = paste("\\1", ass_op, "\\2"),
      x = txt
    )
    txt <- gsub(" < - ", " <- ", txt) # undoes improper formatting of ass_op
  }

  # Comments ----------------------------------------------- #
  txt <- gsub("[^']%(\\s?)(\\w)", "# \\2", txt) # excludes fprintf('%s')
  txt <- gsub("^\\s*%(.+)", "# \\1", txt)  # commented-out code

  # Adding output and end-of-file brace -------------------- #
  txt <- append(txt, paste0("\treturn(", out, ")\n}"))

  # Returning converted code ------------------------------- #
  warning(
    "Please pay special attention to parentheses. MATLAB uses them for both ",
    "argument-passing and object-subsetting. ",
    "The latter cases should be replaced by squared brackets."
  )
  if (output == "asis") {
    return(txt)
  } else if (output == "clean") {
    return(cat(txt, sep = "\n"))
  } else if (output == "save") {
    write.table(
      x         = txt,
      file      = filename,
      quote     = FALSE,
      row.names = FALSE,
      col.names = FALSE,
      append    = append
    )
    if (restyle) {
      readline("Fix any syntax errors and press enter to restyle file")
      style_file(filename)
    }
  } else if (output == "diff") {
    diff_text <- vector(mode = "character", length = (2 * length(original) + 1))
    for (i in seq_along(txt)) {
      new_i <- (2 * i) + i - 2
      diff_text[new_i] <- paste(
        "-----------------------", "line", i, "-----------------------"
      )
      diff_text[new_i + 1] <- original[i]
      diff_text[new_i + 2] <- txt[i]
    }
    message("Displaying line number, original content and modified content")
    return(cat(diff_text, sep = "\n"))
  } else {
    stop("Invalid output argument")
  }
}
