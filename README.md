
<!-- README.md is generated from README.Rmd. Please edit that file -->

# assignmentB2GraceGould Package

This is a minimal working example of my assignmentB2GraceGould package.

## Installation

``` r
# install.packages("devtools")
'devtools::install_github("UBC-STAT545-F2026/assignmentB2GraceGould")'
#> [1] "devtools::install_github(\"UBC-STAT545-F2026/assignmentB2GraceGould\")"
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(diversedata)
library(tidyverse)
#> Warning: package 'tidyverse' was built under R version 4.4.3
#> Warning: package 'tidyr' was built under R version 4.4.1
#> Warning: package 'readr' was built under R version 4.4.1
#> Warning: package 'purrr' was built under R version 4.4.1
#> Warning: package 'stringr' was built under R version 4.4.1
#> Warning: package 'forcats' was built under R version 4.4.1
#> Warning: package 'lubridate' was built under R version 4.4.3
#> ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
#> ✔ dplyr     1.1.4     ✔ readr     2.1.5
#> ✔ forcats   1.0.0     ✔ stringr   1.5.1
#> ✔ ggplot2   3.5.1     ✔ tibble    3.2.1
#> ✔ lubridate 1.9.5     ✔ tidyr     1.3.1
#> ✔ purrr     1.0.2     
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
#> ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
library(assignmentB2GraceGould)

#Example 1: Using function with categorical_col of class character and mean_metric of class numeric
group_summary(wildfire, fire_type, current_size)
#> # A tibble: 4 × 2
#>   fire_type      mean
#>   <chr>         <dbl>
#> 1 Crown     2669.    
#> 2 Ground     160.    
#> 3 Surface    164.    
#> 4 Unknown      0.0242
```

``` r

#Example 2: Using function with categorical_col that is of type numeric. Use as factor to change column class. Then use group_summary() function.
wildfire$year <- as.factor(wildfire$year)
group_summary(wildfire, year, temperature)
#> # A tibble: 19 × 2
#>    year   mean
#>    <fct> <dbl>
#>  1 2006   18.9
#>  2 2007   17.1
#>  3 2008   17.8
#>  4 2009   16.3
#>  5 2010   17.8
#>  6 2011   15.2
#>  7 2012   18.4
#>  8 2013   18.8
#>  9 2014   18.3
#> 10 2015   18.2
#> 11 2016   18.6
#> 12 2017   18.9
#> 13 2018   19.8
#> 14 2019   15.8
#> 15 2020   16.5
#> 16 2021   18.5
#> 17 2022   17.7
#> 18 2023   18.0
#> 19 2024   18.4

#Example 3: Can use function with columns with many NAs
#colSums(is.na(wildfire)) #Looked for column with many NAs
group_summary(wildfire, fire_type, wind_speed)#wind_speed had 2880 NA entries. Passing it as mean_metric variable.
#> # A tibble: 4 × 2
#>   fire_type  mean
#>   <chr>     <dbl>
#> 1 Crown     11.1 
#> 2 Ground     8.46
#> 3 Surface    8.84
#> 4 Unknown   10.3
```
