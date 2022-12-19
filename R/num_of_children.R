globalVariables(c("IDind", "wave", "num_children", "year", "child_died", "child_births", "emw_12_clean"))
#' Function for returning the number of children a woman had up to an inputted year.
#'
#' Provides the number of children a woman had up to an inputted year (1989,1991,1993,1997,2000,2004,2006,2009,2011,2015)
#'
#' @param year survey year. Find possible base years in the  `emw_12` data set.
#' @return A data frame with the number of children a woman had up to an inputted year.
#' @examples
#' num_of_children(2015)
#' num_of_children(2006)
#' @import dplyr
#' @export

num_of_children <- function (year) {

  # Error Handling

  if (!(year %in% emw_12_clean$wave))
  { stop("Please input a survey year listed in the `emw_12_clean` dataset as base year.")}

  if (year == 1989) {df <- filter(emw_12_clean, wave == 1989)}
  if (year == 1991) {df <- filter(emw_12_clean, wave == 1989 | wave == 1991)}
  if (year == 1993) {df <- filter(emw_12_clean, wave == 1989 | wave == 1991 | wave == 1993)}
  if (year == 1997) {df <- filter(emw_12_clean, wave == 1989 | wave == 1991 | wave == 1993 | wave == 1997)}
  if (year == 2000) {df <- filter(emw_12_clean, wave == 1989 | wave == 1991 | wave == 1993 | wave == 1997 | wave == 2000)}
  if (year == 2004) {df <- filter(emw_12_clean, wave == 1989 | wave == 1991 | wave == 1993 | wave == 1997 | wave == 2000 | wave == 2004)}
  if (year == 2006) {df <- filter(emw_12_clean, wave == 1989 | wave == 1991 | wave == 1993 | wave == 1997 | wave == 2000 | wave == 2004 | wave == 2006)}
  if (year == 2009) {df <- filter(emw_12_clean, wave == 1989 | wave == 1991 | wave == 1993 | wave == 1997 | wave == 2000 | wave == 2004 | wave == 2006 | wave == 2009)}
  if (year == 2011) {df <- filter(emw_12_clean, wave == 1989 | wave == 1991 | wave == 1993 | wave == 1997 | wave == 2000 | wave == 2004 | wave == 2006 | wave == 2009 | wave == 2011)}
  if (year == 2015) {df <- emw_12_clean}

  df <- df %>%
    mutate(num_children = child_births - child_died) %>%
    filter(child_died > 0 & child_births > 0 & num_children >0)

  return(df)
}


