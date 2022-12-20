library(testthat)
library(dplyr)

num_of_children_test <- num_of_children(year = 2006)

testthat::test_that("The number of distinct women in the 2006 dataset equals our expectation", {
  expect_equal(ncol(num_of_children_test), 5)
  expect_equal(nrow(num_of_children_test), 17983)
})
