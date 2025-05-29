#' Perform a Left Join Based on Multi-Column Matching
#'
#' This function performs a left join operation on two data frames (`x` and `y`)
#' based on multi-column matching. It first uses `multicolumn_match()` to
#' identify corresponding rows and then joins the data frames using a temporary
#' index column.
#'
#' @param x The "left" data frame (the data frame to which `y` will be joined).
#' @param xcols A character vector of column names in `x` to use for matching.
#' @param y The "right" data frame (the data frame from which columns will be
#'   joined).
#' @param ycols A character vector of column names in `y` to use for matching.
#' @return A new data frame resulting from the left join of `x` and `y`.
#'   Rows in `x` that do not have a match in `y` will have `NA` values for
#'   columns originating from `y`.
#' @importFrom dplyr left_join
#' @importFrom dplyr join_by
#' @examples
#' \dontrun{
#' # Assuming 'df1' and 'df2' are your data frames
#' # and 'df1_gene_cols', 'df2_gene_cols' are the relevant column names
#' # joined_df <- multicolumn_join(df1, df1_gene_cols, df2, df2_gene_cols)
#' }
multicolumn_join <- function(x, xcols, y, ycols) {
  idx <- multicolumn_match(x, xcols, y, ycols)
  x$tmp_y_idx <- idx
  y$tmp_y_idx <- 1:nrow(y)
  lj <- left_join(x, y, by = join_by("tmp_y_idx"))
  
  # Clean up the temporary column
  lj$tmp_y_idx <- NULL
  return(lj)
}