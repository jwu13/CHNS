## code to prepare `emw_12` and `indinc_10` dataset goes here

## clean indinc_10

library(tidyverse)
library(haven)
library(janitor)

indinc_10 <-read_sas("/Users/junruwu/Desktop/Fall 2022/SDS 270/chns/data-raw/indinc_10.sas7bdat")
indinc_10_clean <- indinc_10 %>%
  select(IDind, wave, indwage)%>%
  mutate(indwage = ifelse(indwage < 0 , NA, indwage))

usethis::use_data(indinc_10_clean, overwrite = TRUE)


# Clean emw_12 dataset
library(tidyverse)
library(haven)
library(janitor)

# ever_married_women
emw_12 <-read_sas("/Users/junruwu/Desktop/Fall 2022/SDS 270/chns/data-raw/emw_12.sas7bdat")
emw_12_clean <- emw_12 %>%
  # This data set contains 60 variables but we are only going to use 4 in our package: IDind, wave, S47, S47A
  select(IDind, wave, S47, S47A) %>%
  mutate(S47 = ifelse(S47 < 0 | is.na(S47) == TRUE , 0, S47)) %>%
  mutate(S47A = ifelse(S47A < 0 , NA, S47A)) %>%
  rename(
    child_died = S47,
    child_births = S47A
  )
usethis::use_data(emw_12_clean, overwrite = TRUE)


# map_dat
indinc_10 <-read_sas("/Users/junruwu/Desktop/Fall 2022/SDS 270/chns/data-raw/indinc_10.sas7bdat")
map_dat <- indinc_10 %>%
  select(wave, indwage, t1)%>%
  mutate(indwage = ifelse(indwage < 0 , NA, indwage))%>%
  na.omit(indwage)%>%
  group_by(t1, wave)%>%
  summarize(wage_mean = mean(indwage)) %>%
  rename(province = t1) %>%
  mutate(province = case_when(
    province == 11 ~ "beijing",
    province == 21 ~ "liaoning",
    province == 23 ~ "heilongjiang",
    province == 31 ~ "shanghai",
    province == 32 ~ "jiangsu",
    province == 37 ~ "shandong",
    province == 41 ~ "henan",
    province == 42 ~ "hubei",
    province == 43 ~ "hunan",
    province == 45 ~ "guangxi",
    province == 52 ~ "guizhou",
    province == 55 ~ "chongqing"))

