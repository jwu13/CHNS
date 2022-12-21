#' Annual Income from CHNS survey from 1989 to 2011
#'
#' @format A data frame with 62,029 rows and 32 columns.
#' \describe{
#'   \item{IDind}{The IDind is a twelve-digit numeric variable that uniquely identified for all participants. Each participant will have the same ID in all datasets and in all survey years. }
#'   \item{wave}{survey year}
#'   \item{indwage}{nominal annual income}
#' }
#' @source <https://www.cpc.unc.edu/projects/china>
"indinc_10_clean"
#'
#' Number of Children Data
#' A dataset that includes number of children for ever-married-women.
#' @format A data frame with 26,616 rows and 60 columns.
#' \describe{
#'   \item{IDind}{The IDind is a twelve-digit numeric variable that uniquely identified for all participants. Each participant will have the same ID in all datasets and in all survey years. }
#'   \item{wave}{survey year}
#'   \item{child_died}{Total number of Children who died}
#'   \item{child_births}{Total number of Children given births to}
#'   ...
#' }
#' @source <https://www.cpc.unc.edu/projects/china>
"emw_12_clean"
#'
#'
#' Province-level average income data
#' Data set with annual average wage for the provinces and years included in the survey.
#' @format A data frame that could map the average income by selected province and year.
#' \describe{
#'   \item{province_en}{province names in English}
#'   \item{wave}{survey year}
#'   \item{wage_mean}{Annual average wage in unit of ¥1}
#'   \item{name}{province names in Chinese}
#'   \item{wage_mean_k}{Annual average income in unit of ¥1,000}
#'   \item{wage_mean_cat}{Annual average income in unit of ¥1,000 divided into categories for mapping.}
#' }
#' @source <https://www.cpc.unc.edu/projects/china>
"map_dat_clean"


