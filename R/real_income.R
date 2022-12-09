globalVariables(c("indinc_10_clean","indwage","wave","CPI_baseyear", "CPI_1989", "CPI_1991","CPI_1993","CPI_1997", "CPI_2000","CPI_2004","CPI_2006","CPI_2009","CPI_2011","CPI_2015","IDind","annual_wage_CPI","base"))
#' Function for deflating or inflating annual income to an inputted base year
#'
#' Provides the annual wage of an individual deflating or inflating annual income to an inputted base year (1989,1991,1993,1997,2000,2004,2006,2009,2011,2015)
#'
#' @param base_year survey year. Find possible base years in the  `indinc_10` data set.
#' @return A data frame with the inflated or deflated individual annual income for a selected year.
#' @examples
#' real_income(2015)
#' real_income(1989)
#' @import dplyr
#' @export

real_income <- function (base_year) {

  # Error Handling

  if (!(base_year %in% indinc_10_clean$wave))
  { stop("Please input a survey year listed in the `ever_married_women` dataset as base year.")}


  df <- indinc_10_clean  %>%
    mutate(CPI_1989 = 39.24,
           CPI_1991 = 41.88,
           CPI_1993 = 51.05,
           CPI_1997 = 82.47,
           CPI_2000 = 80.97,
           CPI_2004 = 85.00,
           CPI_2006 = 87.94,
           CPI_2009 = 96.92,
           CPI_2011 = 105.55,
           CPI_2015 = 114.92) %>%
    mutate(CPI_baseyear = ifelse(base_year == 1989, 39.24,
                          ifelse(base_year == 1991, 41.88,
                          ifelse(base_year == 1993, 51.05,
                          ifelse(base_year == 1997, 82.47,
                          ifelse(base_year == 2000, 80.97,
                          ifelse(base_year == 2004, 85.00,
                          ifelse(base_year == 2006, 87.94,
                          ifelse(base_year == 2009, 96.92,
                          ifelse(base_year == 2011, 105.55, 114.92)))))))))) %>%
    mutate(annual_wage_CPI = ifelse(wave == 1989, indwage *(CPI_baseyear/CPI_1989),
                             ifelse(wave == 1991, indwage *(CPI_baseyear/CPI_1991),
                             ifelse(wave == 1993, indwage *(CPI_baseyear/CPI_1993),
                             ifelse(wave == 1997, indwage *(CPI_baseyear/CPI_1997),
                             ifelse(wave == 2000, indwage *(CPI_baseyear/CPI_2000),
                             ifelse(wave == 2004, indwage *(CPI_baseyear/CPI_2004),
                             ifelse(wave == 2006, indwage *(CPI_baseyear/CPI_2006),
                             ifelse(wave == 2009, indwage *(CPI_baseyear/CPI_2009),
                             ifelse(wave == 2011, indwage *(CPI_baseyear/CPI_2011), indwage *(CPI_baseyear/CPI_2015)))))))))))


  df2 <- df %>%
    mutate(base = base_year) %>%
    select (IDind, wave, indwage, annual_wage_CPI, base)

  return(df2)
}





