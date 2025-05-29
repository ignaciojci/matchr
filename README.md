# matchr <img src="man/figures/logo.png" align="right" />

[![R-CMD-check](https://github.com/your_github_username/matchr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/your_github_username/matchr/actions/workflows/R-CMD-check.yaml)
The `matchr` R package provides a suite of utility functions designed for **gene name normalization and robust multi-column matching** across different biological datasets. It helps researchers integrate data where gene or protein identifiers might be inconsistent due to varying delimiters, suffixes, or case sensitivity.

## Features

* **Flexible Name Normalization:** Clean gene/protein names by standardizing delimiters, removing common suffixes, and adjusting case.
* **Multi-Column Flattening:** Consolidate multiple identifier columns (e.g., "Gene Name", "Synonyms", "Primary ID") into a unified set of searchable names per entry.
* **Intelligent Matching:** Perform efficient matching between datasets using a comprehensive, normalized set of names from multiple columns.
* **Convenient Joining:** Facilitate `dplyr::left_join` operations based on these sophisticated multi-column matches.

## Installation

You can install the development version of `matchr` directly from GitHub using the `devtools` package:

```R
# If you don't have devtools installed:
# install.packages("devtools")

devtools::install_github("ignaciojci/matchr")
