globalVariables(c("map_dat_clean","indwage","wave","province", "year", "wage_mean_cat"))
#' Function for mapping average income by year and provinces included in the survey
#'
#' Provides the map of annual province wage an inputted base year (1989,1991,1993,1997,2000,2004,2006,2009,2011,2015) for provinces included in the survey.
#'
#' @param year survey year. Find possible years in the  `map_dat_clean` data frame.
#' @return A map with the annual average income mapped on China's map for provinces in the survey. For provinces that are not included in the survey, the color is grey.
#' @import dplyr
#' @import leaflet
#' @import leafletCN
#' @export
#'
#'

  map_income <- function (year) {

    # Error Handling

    if (!(year %in% map_dat_clean$wave))
    { stop("Please input a survey year listed in the `map_data` data frame as base year.")}

    # filter by the input year
    df <- filter(map_dat_clean, wave == year)

    # map the data
    map <- geojsonMap(df, "china", namevar = ~name, valuevar = ~wage_mean_cat, colorMethod = "factor")
    return(map)
  }




