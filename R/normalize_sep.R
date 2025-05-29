#' Normalize Separators in a Character Vector
#'
#' This function replaces multiple specified separator characters within a
#' character vector with a single, common separator. It's useful for
#' standardizing name formats before splitting them.
#'
#' @param names A character vector containing names to be normalized.
#' @param sep_chars A regular expression defining the separator characters to
#'   be replaced (default: `"[;\\s]+"`, matching semicolons and whitespace).
#' @param common_sep The single character to use as the common separator
#'   (default: `","`).
#' @return A character vector with normalized separators.
#' @export
#' @examples
#' normalize_sep(c("gene1; gene2", "gene3 gene4", "gene5,gene6"))
#' normalize_sep(c("alpha.beta", "gamma-delta"), sep_chars="[.-]", common_sep="_")
normalize_sep <- function(names, sep_chars = "[;\\s]+", common_sep = ",") {
  n <- gsub(sep_chars, common_sep, names, perl = TRUE)
  return(n)
}
