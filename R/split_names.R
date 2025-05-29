#' Split Names by a Common Separator
#'
#' This function splits a character vector of names into a list of character
#' vectors based on a common separator. It is typically used after
#' `normalize_sep()` to break down a string containing multiple names
#' into individual components.
#'
#' @param names A character vector where each element may contain multiple
#'   names separated by `common_sep`.
#' @param common_sep The character used to split the names (default: `","`).
#' @return A list of character vectors, where each element corresponds to an
#'   original string split by the common separator.
#' @export
#' @importFrom stringr str_split
#' @examples
#' split_names(c("gene1,gene2", "gene3,gene4"))
#' split_names(c("alpha_beta", "gamma_delta"), common_sep="_")
split_names <- function(names, common_sep = ",") {
  str_split(names, common_sep)
}
