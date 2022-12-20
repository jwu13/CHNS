
<!-- README.md is generated from README.Rmd. Please edit that file -->

# CHNS R package <img src='data-raw/hex.png' align="right" height="139"/>

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/surveyjanitor)](https://CRAN.R-project.org/package=surveyjanitor)
[![R-CMD-check](https://github.com/jwu13/CHNS/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jwu13/CHNS/actions/workflows/R-CMD-check.yaml)

<!-- badges: end -->

## Summary

Our package helps researchers explore [China Health and Nutrition
Survey](https://www.cpc.unc.edu/projects/china/data) With just a basic
knowledge of R, the users can access a wide variety of information
regarding effects of the health, nutrition, and family planning policies
on the health and nutritional status of its population.  

The package includes two data set that includes individual-level survey
data of 10 specific years over the period of 1989 - 2015.  

There are currently three functions inside the package:  

-   `real_income`: takes in a numeric year value and returns a data
    frame with real income adjusted for inflation.  

-   `num_of_children`: takes in a numeric year value and returns a data
    frame with child births, child deaths, and total children up to the
    input year.  

-   `map_income`: takes in a numeric year value and returns a map of
    China with province-level average annual income mapped on the
    surveyed provinces.  

This package would be a useful tool for social science researchers
interested in policy analysis in China. Additionally, it is also an easy
tool for data analysis and visualization for anyone interested in CHNS.

## Installation

You can install the development version of CHNS from \[Github\]
(<https://github.com/jwu13/CHNS>) with:

``` r
# install.packages("devtools")
devtools::install_github("jwu13/CHNS")
#> Downloading GitHub repo jwu13/CHNS@HEAD
#> cli     (3.4.1 -> 3.5.0) [CRAN]
#> isoband (0.2.6 -> 0.2.7) [CRAN]
#> Installing 2 packages: cli, isoband
#> 
#>   There are binary versions available but the source versions are later:
#>         binary source needs_compilation
#> cli      3.4.1  3.5.0              TRUE
#> isoband  0.2.6  0.2.7              TRUE
#> installing the source packages 'cli', 'isoband'
#>      checking for file ‘/private/var/folders/1h/35wbm1092xnchvv0w4lq5t2h0000gn/T/Rtmpv8sN6K/remotesb9d148f9dc0a/jwu13-CHNS-de22a14/DESCRIPTION’ ...  ✔  checking for file ‘/private/var/folders/1h/35wbm1092xnchvv0w4lq5t2h0000gn/T/Rtmpv8sN6K/remotesb9d148f9dc0a/jwu13-CHNS-de22a14/DESCRIPTION’
#>   ─  preparing ‘chns’:
#>    checking DESCRIPTION meta-information ...  ✔  checking DESCRIPTION meta-information
#>   ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#>   ─  building ‘chns_0.0.0.9000.tar.gz’
#>      
#> 
```

You can load this package by

``` r
library(chns)
```

For `map_income()` function in the package, you also need to install and
load the package leafletCN.

``` r
install.packages("leafletCN")
library(leafletCN)
```

## Data Sets Included

-   `indinc_10_clean`: A data set that includes 88166 survey data
    entries from 1989 - 2015 with Individual ID, survey year, and
    nominal individual income.
-   `emw_12_clean`: A data set that includes 26616 survey data entries
    from 1989 - 2015 with Individual ID, survey year, number of child
    died and number of child births for women.
-   `map_dat_clean`: A simple data set with province-level average
    annual income, survey year, province names in both English and
    Chinese, and categories of income that is used for mapping.

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
#> # A tibble: 17,948 × 5
#>           IDind  wave child_died child_births num_children
#>           <dbl> <dbl>      <dbl>        <dbl>        <dbl>
#>  1 211101001002  1991          0            0            0
#>  2 211101001002  1993          0            0            0
#>  3 211101001002  2000          0            1            1
#>  4 211101002002  1991          0            0            0
#>  5 211101002002  1993          0            1            1
#>  6 211101003002  1991          0            0            0
#>  7 211101003002  1993          0            1            1
#>  8 211101003002  2000          0            1            1
#>  9 211101003101  2006          0            1            1
#> 10 211101004001  1991          0            0            0
#> # … with 17,938 more rows
```

### Data Visualization

-   Example 3: Get a map to get an overview of province-level average
    income.

![a visualization demo](data-raw/viz_demo.png)

``` r
map_income(year = 2011)
```

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
