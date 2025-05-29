#' @title Flatten and Normalize Names from Multiple Columns
#' @description
#' This helper function takes a list of column names and a data frame, then
#' normalizes and flattens the entries within those columns into a list of
#' unique, non-missing names for each row. It combines the `normalize_names`,
#' `normalize_sep`, and `split_names` functions to prepare data for matching.
#' @param colnames A character vector of column names within `data_frame` to process.
#' @param data_frame A data frame (or similar tibble-like object) from which
#'   the columns will be extracted.
#' @return A list of character vectors. Each element of the list corresponds
#'   to a row in the input `data_frame`, containing a unique set of normalized
#'   names extracted from the specified columns for that row. If no valid
#'   names are found for a row, `NA` is returned for that element.
#' @export
#' @importFrom dplyr pull
#' @importFrom purrr map
#' @importFrom stats na.omit
#' @keywords internal
flatten_names <- function(colnames, data_frame) {
  n1 <- lapply(colnames, function(colname) {
    n0 <- pull(data_frame, colname)
    n0 <- normalize_names(n0)
    n0 <- normalize_sep(n0)
    n0 <- split_names(n0)
  })

  lapply(seq_along(n1[[1]]), function(i) {
    x <- as.vector(na.omit(unique(unlist(map(n1, i)))))
    if (length(x) > 0) {
      x
    } else {
      NA
    }
  })
}
