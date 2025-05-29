#' Match Rows Across Multiple Columns in Two Data Frames
#'
#' This function performs a multi-column matching operation between two data
#' frames (`x` and `y`). It normalizes and flattens specified columns from
#' both data frames and then finds the *first* matching row in `y` for each
#' row in `x` based on the normalized names.
#'
#' @param x The "left" data frame (the data frame to be matched from).
#' @param xcols A character vector of column names in `x` to use for matching.
#' @param y The "right" data frame (the data frame to be matched against).
#' @param ycols A character vector of column names in `y` to use for matching.
#' @return A numeric vector of row indices from `y` that correspond to the
#'   first match for each row in `x`. If no match is found for a row in `x`,
#'   the corresponding element in the returned vector will be `NA`.
#' @export
#' @examples
#' \dontrun{
#' # Assuming 'df1' and 'df2' are your data frames
#' # and 'df1_gene_cols', 'df2_gene_cols' are the relevant column names
#' # match_indices <- multicolumn_match(df1, df1_gene_cols, df2, df2_gene_cols)
#' }
multicolumn_match <- function(x, xcols, y, ycols) {
  xfn <- flatten_names(xcols, x)
  yfn <- flatten_names(ycols, y)

  x_flat <- unlist(xfn)
  y_flat <- unlist(yfn)

  x_idx <- rep(seq_along(xfn), lengths(xfn))
  y_idx <- rep(seq_along(yfn), lengths(yfn))

  match_index <- match(x_flat, y_flat)
  y_adjidx <- y_idx[match_index]

  match_adjidx <- unname(split(y_adjidx, x_idx))
  match_adjidx <- sapply(match_adjidx, function(val) {
    if (length(val) > 0) {
      val[!is.na(val)][1]
    } else {
      NA
    }
  })
  return(match_adjidx)
}
