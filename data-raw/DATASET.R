## code to prepare `emw_12_clean`, `indinc_10_clean`, and `map_dat_clean` dataset goes here

## clean indinc_10

library(tidyverse)
library(haven)
library(janitor)

# `indinc_10_clean` data set is use in the function `real_income ()`
indinc_10 <-read_sas("/Users/dd/Desktop/270/CHNS/data-raw/indinc_10.sas7bdat")
indinc_10_clean <- indinc_10 %>%
  select(IDind, wave, indwage)%>%
  mutate(indwage = ifelse(indwage < 0 , NA, indwage))

usethis::use_data(indinc_10_clean, overwrite = TRUE)


# Clean emw_12 dataset
library(tidyverse)
library(haven)
library(janitor)

# emw_12 dataset for funtion `num_of_children( )`
emw_12 <-read_sas("/Users/dd/Desktop/270/CHNS/data-raw/emw_12.sas7bdat")
emw_12_clean <- emw_12 %>%
  # This data set contains 60 variables but we are only going to use 4 in our package: IDind, wave, S47, S47A
  select(IDind, wave, S47, S47A) %>%
  mutate(S47 = ifelse(S47 < 0 | is.na(S47) == TRUE, 0, S47)) %>%
  mutate(S47A = ifelse(S47A <0 | is.na(S47A) == TRUE, 0, S47A)) %>%
  rename(
    child_died = S47,
    child_births = S47A
  )
usethis::use_data(emw_12_clean, overwrite = TRUE)


# map_dat
library(tidyverse)
library(haven)
library(leafletCN)
map_dat <- indinc_10 %>%
  select(wave, indwage, t1)%>%
  rename(province = t1) %>%
  mutate(province_en = case_when(
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
    province == 55 ~ "chongqing"))%>%
  mutate(indwage = ifelse(indwage < 0 , NA, indwage))%>%
  na.omit(indwage)%>%
  group_by(province_en, wave)%>%
  summarize(wage_mean = mean(indwage))

# merge this data set with the map name data set
province_name <- data.frame (regionNames("china"))%>%
  rename(name = regionNames..china..)

# add the chinese names to the data set so that the province names match that in package leafletCN.
province_name <- province_name%>%
  mutate(province_en = case_when (
    name == "北京市"~ "beijing",
    name == "辽宁省"~ "liaoning",
    name == "黑龙江省"~ "heilongjiang",
    name == "上海市"~ "shanghai",
    name == "江苏省"~ "jiangsu",
    name == "山东省"~ "shandong",
    name == "河南省"~ "henan",
    name == "湖北省"~ "hubei",
    name == "湖南省"~ "hunan",
    name == "广西省"~ "guangxi",
    name == "贵州省"~ "guizhou",
    name == "重庆市"~ "chongqing",
  ))%>%
  na.omit(name)

# merge the dataset with the province names in leafletCN
map_dat_merge <- merge(map_dat,province_name,by="province_en")

# Divide wage_mean by 1000 so that wage has unit 1000.
map_dat_clean <- map_dat_merge %>%
  mutate(wage_mean_k = wage_mean/1000)
  # create categories
map_dat_clean$wage_mean_cat = cut(map_dat_clean$wage_mean_k, c(0, 1, 2.5, 5, 10, 20, 30, 50, 80, 100))

usethis::use_data(map_dat_clean, overwrite = TRUE)





