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
  select(IDind, wave, S47, S47A) %>%
  mutate(S47 = ifelse(S47 < 0 , NA, S47)) %>%
  mutate(S47A = ifelse(S47A < 0 , NA, S47A)) %>%
  rename(
    child_died = S47,
    child_births = S47A
  )
usethis::use_data(emw_12_clean, overwrite = TRUE)


