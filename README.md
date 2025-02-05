
<!-- README.md is generated from README.Rmd. Please edit that file -->

# edx.capstone.movielens.data

<!-- badges: start -->
<!-- badges: end -->

The goal of `edx.capstone.movielens.data` is to provide the following
datasets derived from the [10M version of the MovieLens
Dataset](http://grouplens.org/datasets/movielens/10m/) to use in the
***MovieLens*** project of the [edX HarvardX PH125.9x Data Science
Capstone
Course](https://learning.edx.org/course/course-v1:HarvardX+PH125.9x+3T2024/home)
for building a *Movie Recommendation System* according to the course
requirements: \* **edx:** use it to develop and train your algorithms;
\* **final_holdout_test:** As per the course instructions, use it
exclusively to evaluate the ***RMSE*** of your final algorithm.

## Installation

You can install the development version of edx.capstone.movielens.data
from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("AzKurban-edX-DS/edx.capstone.movielens.data")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(edx.capstone.movielens.data)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
