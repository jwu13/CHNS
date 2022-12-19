#' Annual Income from CHNS survey from 1989 to 2011
#'
#' @format ## `indinc_10_clean`
#' A data frame with 62,029 rows and 32 columns:
#' \describe{
#'   \item{IDind}{individual identification number}
#'   \item{wave}{survey year}
#'   \item{indwage}{annual wage, bonus, and other income}
#' }
#' @source <https://www.cpc.unc.edu/projects/china>
"indinc_10_clean"
#'
#'
#' Number of ever married women and number of children
#' @format ## `emw_12_clean`
#' A data frame with 26,616 rows and 60 columns:
#' \describe{
#'   \item{IDind}{individual identification number}
#'   \item{wave}{survey year}
#'   \item{child_died}{Number of Children who died}
#'   \item{child_births}{Total number of Children given births to}
#'   ...
#' }
#' @source <https://www.cpc.unc.edu/projects/china>
"emw_12_clean"
#'
#'
#' Data set for mapping average income on China's map
#' @format ## `map_dat_clean`
#' A data frame that could map the average income by selected province and year:
#' \describe{
#'   \item{province_en}{province names in english}
#'   \item{wave}{survey year}
#'   \item{wage_mean}{intial wage in unit of 1}
#'   \item{name}{name of provinces in chinese}
#'   \item{wage_mean_k}{wage in unit of 1000}
#'   \item{wage_mean_cat}{mean wage in unit of 1000 divided into categories for mapping}
#' }
#' @source <https://www.cpc.unc.edu/projects/china>
"map_dat_clean"


