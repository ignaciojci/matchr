#' Clean and Normalize Gene Names
#'
#' This function cleans and normalizes a character vector of names by performing
#' substitutions, optionally removing specified suffixes, and converting the
#' case of the names.
#'
#' @param names A character vector of names to be normalized.
#' @param to_sub A regular expression specifying characters to be replaced
#'   (default: `"[-.]"`, matching hyphens and periods).
#' @param sub_with The character to substitute for `to_sub` (default: `"_"`).
#' @param rm_suffix A logical value indicating whether to remove specified
#'   suffixes (default: `FALSE`).
#' @param suffixes A character vector of regular expressions defining suffixes
#'   to be removed if `rm_suffix` is `TRUE` (default: `c("_frag$","-[0-9]$")`).
#' @param case_fun A character string specifying a case conversion function
#'   (e.g., `"toupper"`, `"tolower"`) to apply to the names. Use `NA` to skip
#'   case conversion (default: `"toupper"`).
#' @return A character vector of normalized names.
#' @export
#' @examples
#' normalize_names(c("Pe-Pe_frag", "nene.ne-2-0"))
#' normalize_names(c("GeneA", "GeneB_frag"), rm_suffix=TRUE)
#' normalize_names(c("GeneC", "GeneD"), case_fun="tolower")
normalize_names <- function(names, to_sub = "[-.]", sub_with = "_", rm_suffix = FALSE,
                            suffixes = c("_frag$", "-[0-9]$"), case_fun = "toupper") {
  if (rm_suffix) {
    for (suffix in suffixes) {
      names <- gsub(suffix, "", names)
    }
  }

  n <- gsub(to_sub, sub_with, names)

  if (is.na(case_fun)) {
    return(n)
  }

  f <- get(case_fun)
  n <- f(n)

  return(n)
}
