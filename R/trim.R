#' Trim leading and trailing white spaces from lines in a character vector
#'
#' This function takes a character vector as input, removes leading and trailing
#' whitespaces, and drops empty lines.
#'
#' @param lines A character vector containing the lines to be processed.
#' @return A character vector with lines trimmed of leading and trailing whitespaces
#'   and empty lines removed.
#' @examples
#' \dontrun{
#' input_lines <- c("test1", " test2 ", "", "test3", " test4 ")
#' result <- trim(input_lines)
#' print(result)
#' }
#'
#' @export
trim <- function(lines) {
  # Remove leading and trailing white spaces and drop empty lines
  cleaned_lines <- base::grep("\\S", base::trimws(lines), value = TRUE)

  return(cleaned_lines)
}
