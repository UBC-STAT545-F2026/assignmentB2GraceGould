
#title: Function for Assignment B1
#author: Grace Gould
#date: 2026-11-13


#load libraries
library(tibble)
library(diversedata)
library(tidyverse)
library(testthat)

## Exercise 1 and 2
##Function to group and plot by column name
# In MDA2, I noticed that I wanted to summarize the mean of different metrics by fire type. I can make this into a function by using a grouping name.

#' @title Get mean by category
#' @description: Calculates mean of numeric column by categorical variable and outputs a summary table with calculated mean metrics
#' @param data a data frame containing the numeric column and categorical column for calculation
#' @param categorical_col the name of the categorical column of class factor or character that the data will be grouped by
#' @param mean_metric the name of the numeric column that the means will be calculated on for each category
#' @return a table containing the mean from mean_metric column for each category from categorical_col. Output table will be a tibble if a tibble is input and a data frame if a data frame is input
#' @examples
#' group_summary(wildfire, fire_type, current_size) #Example 1: Using function with categorical_col of class character and mean_metric of class numeric
#' wildfire$year <- as.factor(wildfire$year)
#' group_summary(wildfire, year, temperature) #' #Example 2: Using function with categorical_col that is of type numeric. Use as factor to change column class. Then use group_summary() function.
#' @export


group_summary <- function(data, categorical_col, mean_metric){

  #Check all required variables have been passed and throw error if needed
  if (missing(categorical_col)||missing(mean_metric)) {stop("missing required argument")}

  #Check to see if the class for the mean column is numeric so we can calculate the mean.
  stopifnot("mean_metric column must be class numeric" = is.numeric(na.omit(data %>% pull({{ mean_metric }}))))

  #Check to make sure that the categorical column is of type character or type factor as a numeric column will likely not be a categorical type
  stopifnot("categorical_col must be class factor or class character" = is.factor(na.omit(data %>% pull({{ categorical_col }})))||is.character(na.omit(data %>% pull({{ categorical_col }}))))

  data %>%
    drop_na({{ categorical_col }},{{ mean_metric }}) %>% #drop the NAs specifically from the columns of interest. I didn't use just drop_na() here because I didn't want entire rows being removed from other columns that were not of interest to this function.
    group_by({{categorical_col}}) %>%
    summarise(mean = mean({{mean_metric}}))
}

## Exercise 4

#Test 1: Try to pass a numerical column as categorical_col
expect_error(group_summary(wildfire, current_size, latitude),"categorical_col must be class factor or class character")

#Test 2: Try to pass a categorical column as a numerical column
expect_error(group_summary(wildfire, fire_type, fire_origin), "mean_metric column must be class numeric")

#Test 3: Try to pass no argument for mean_metric
expect_error(group_summary(wildfire, fire_type),"missing required argument")

#Test 4: Try to pass no argument for categorical_col
expect_error(group_summary(wildfire, current_size),"missing required argument")


