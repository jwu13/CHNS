
<!-- README.md is generated from README.Rmd. Please edit that file -->

# CHNS

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/surveyjanitor)](https://CRAN.R-project.org/package=surveyjanitor)
[![R-CMD-check](https://github.com/jwu13/CHNS/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jwu13/CHNS/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## Purpose

We wanted to create a package that helps researchers explore China
Health and Nutrition Survey (CHNS) with just a basic R understanding.
The package `surveyjanitor` allows easy access to a wide variety of
information regarding effects of the health, nutrition, and family
planning policies on the health and nutritional status of its
population. CHNS data has both inconsistencies in variable units and
ways of recording N/A values, as well as general inconvenience caused by
panel data. This package aims to provide a clearer and more efficient
way of exploring CHNS Data.

## Target audience

This package can be used by researchers and students who are interested
in using data from China Health and Nutrition Survey (CHNS).
Additionally, anyone who’s interested in using CHNS data and wish to
simplify the data cleaning process are welcomed to use this package as a
data cleaning aid tool.

## Installation

You can install the development version of surveyjanitor like so:

``` r
devtools::install_github("jwu13/CHNS")
```

## Load

You can load it by:

``` r
library(chns)
```

## Example 1: Get Real Income with selected base year.

This is a basic example for `real_income()` that returns a tibble with
income weighted over inflation for the selected base year.

``` r
real_income(base_year=1989) 
#> # A tibble: 88,166 × 5
#>           IDind  wave indwage annual_wage_CPI  base
#>           <dbl> <dbl>   <dbl>           <dbl> <dbl>
#>  1 211103001001  1989   1140.           1140.  1989
#>  2 211103001002  1989    940.            940.  1989
#>  3 211103002001  1989   1590.           1590.  1989
#>  4 211103002002  1989    229.            229.  1989
#>  5 211103003003  1989    784.            784.  1989
#>  6 211103003004  1989    784.            784.  1989
#>  7 211103004003  1989    940.            940.  1989
#>  8 211103004004  1989    784.            784.  1989
#>  9 211103005001  1989   1140.           1140.  1989
#> 10 211103005002  1989    784.            784.  1989
#> # … with 88,156 more rows
```

## Example 2: Get Number of Children a women has up to an inputted year.

``` r
num_of_children(year = 2006) 
#> # A tibble: 385 × 5
#>           IDind  wave child_died child_births num_children
#>           <dbl> <dbl>      <dbl>        <dbl>        <dbl>
#>  1 211101015002  1993          1            2            1
#>  2 211101015002  2000          1            2            1
#>  3 211101015002  2004          1            2            1
#>  4 211101019002  1993          2            3            1
#>  5 211208006001  2000          3            6            3
#>  6 212201003002  1993          1            3            2
#>  7 212202002002  1993          1            4            3
#>  8 212202002002  2000          1            4            3
#>  9 212202005002  1993          1            4            3
#> 10 212202006002  1993          1            5            4
#> # … with 375 more rows
```

## Example 3: Get a map with province mean income by an input year

Income is divided into categories with a unit of 1k.

## Project Proposal

We would like to build an R package that makes importing data, tidying
data and data analysis more user friendly for social science data sets,
specifically, we’ll be creating the following functions for The China
Health and Nutrition Survey (CHNS) data. CHNS contains panel data over
two decades and we would like to reduce repetitive data-tidying work for
researchers.

We will be creating the following functions for this project, serving
both data wrangling and data visualization purposes on CHNS data.

### Data Wrangling:

1)  `real_income(base_year)`: This function calculates the
    deflated/inflated real income based on the selected survey year.

2)  `num_of_children(base_year)`: This function returns the number of
    children a woman had up to an inputted year.

### Data Visualization:

3)  `map_income(year)`: This function would potentially map the average
    income by province on the map for the selected year.

## Group Members

-   Junru Wu
-   Betty Pu
