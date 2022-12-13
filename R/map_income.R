globalVariables(c("map_dat","indwage","wave","province", "year"))
#' Function for mapping average income by year and provinces included in the survey
#'
#' Provides the map of annual province wage an inputted base year (1989,1991,1993,1997,2000,2004,2006,2009,2011,2015) for provinces included in the survey.
#'
#' @param year survey year. Find possible years in the  `map_dat` data frame.
#' @return A map with the annual average income mapped on China's map for provinces in the survey. For provinces that are not included in the survey, the color is grey.
#' @examples
#' map_income(2015)
#' real_income(1989)
#' @import dplyr
#' @import leafletCN
#' @export
#'
#'


  map_income <- function (year) {

    # Error Handling

    if (!(year %in% merged_map_dat$wave))
    { stop("Please input a survey year listed in the `map_data` data frame as base year.")}

    if (year == 1989) {df <- filter (merged_map_dat, wave == 1989)}
    if (year == 1991) {df <- filter (merged_map_dat, wave == 1991)}
    if (year == 1993) {df <- filter (merged_map_dat, wave == 1993)}
    if (year == 1997) {df <- filter (merged_map_dat, wave == 1997)}
    if (year == 2000) {df <- filter (merged_map_dat, wave == 2000)}
    if (year == 2004) {df <- filter (merged_map_dat, wave == 2004)}
    if (year == 2006) {df <- filter (merged_map_dat, wave == 2006)}
    if (year == 2009) {df <- filter (merged_map_dat, wave == 2009)}
    if (year == 2011) {df <- filter (merged_map_dat, wave == 2011)}
    if (year == 2015) {df <- filter (merged_map_dat, wave == 2015)}

    # divide average income into categories for mapping
    # df$wage_mean_new = cut(df$wage_mean, c(0, 5000, 10000, 15000, 20000, 30000, 40000))
    # df_new <- data.frame(df)

    map <- geojsonMap(df, "china", namevar = ~name, valuevar = ~wage_mean, palette = topo.colors(3), colorMethod = "factor")

    return(map)
  }



