library(testthat)
library(dplyr)


real_income_test <- real_income(base_year=1989)
testthat::test_that("The real income calculated based on the input base year is correct", {
  expect_equal(as.numeric(unlist(real_income_test[88162,4])), 12292.37731)
})

