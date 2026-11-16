test_that("group_summary works!", {

  #Check if diversedata has been installed and if it hasn't, load it for the following tests.
  testthat::skip_if_not_installed("diversedata")
  data("wildfire", package = "diversedata")

  #Test 1: Try to pass a numerical column as categorical_col
  expect_error(group_summary(wildfire, current_size, latitude),"categorical_col must be class factor or class character")

  #Test 2: Try to pass a categorical column as a numerical column
  expect_error(group_summary(wildfire, fire_type, fire_origin), "mean_metric column must be class numeric")

  #Test 3: Try to pass no argument for mean_metric
  expect_error(group_summary(wildfire, fire_type),"missing required argument")

  #Test 4: Try to pass no argument for categorical_col
  expect_error(group_summary(wildfire, current_size),"missing required argument")
})

