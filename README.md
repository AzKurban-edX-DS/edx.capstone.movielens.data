
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
requirements:

- **edx:** use it to develop and train your algorithms;
- **final_holdout_test:** according to the requirements of the course,
  use it exclusively to evaluate the ***RMSE*** of your final algorithm.

## Installation

You can install the development version of edx.capstone.movielens.data
from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("AzKurban-edX-DS/edx.capstone.movielens.data")
```

## Example

This is a basic example that shows you how to get an idea of the
structure of the datasets included in the package:

``` r
library(edx.capstone.movielens.data)
str(edx)
#> 'data.frame':    9000055 obs. of  6 variables:
#>  $ userId   : int  1 1 1 1 1 1 1 1 1 1 ...
#>  $ movieId  : int  122 185 292 316 329 355 356 362 364 370 ...
#>  $ rating   : num  5 5 5 5 5 5 5 5 5 5 ...
#>  $ timestamp: int  838985046 838983525 838983421 838983392 838983392 838984474 838983653 838984885 838983707 838984596 ...
#>  $ title    : chr  "Boomerang (1992)" "Net, The (1995)" "Outbreak (1995)" "Stargate (1994)" ...
#>  $ genres   : chr  "Comedy|Romance" "Action|Crime|Thriller" "Action|Drama|Sci-Fi|Thriller" "Action|Adventure|Sci-Fi" ...
head(edx)
#>   userId movieId rating timestamp                         title
#> 1      1     122      5 838985046              Boomerang (1992)
#> 2      1     185      5 838983525               Net, The (1995)
#> 4      1     292      5 838983421               Outbreak (1995)
#> 5      1     316      5 838983392               Stargate (1994)
#> 6      1     329      5 838983392 Star Trek: Generations (1994)
#> 7      1     355      5 838984474       Flintstones, The (1994)
#>                          genres
#> 1                Comedy|Romance
#> 2         Action|Crime|Thriller
#> 4  Action|Drama|Sci-Fi|Thriller
#> 5       Action|Adventure|Sci-Fi
#> 6 Action|Adventure|Drama|Sci-Fi
#> 7       Children|Comedy|Fantasy

str(final_holdout_test)
#> 'data.frame':    999999 obs. of  6 variables:
#>  $ userId   : int  1 1 1 2 2 2 3 3 4 4 ...
#>  $ movieId  : int  231 480 586 151 858 1544 590 4995 34 432 ...
#>  $ rating   : num  5 5 5 3 2 3 3.5 4.5 5 3 ...
#>  $ timestamp: int  838983392 838983653 838984068 868246450 868245645 868245920 1136075494 1133571200 844416936 844417070 ...
#>  $ title    : chr  "Dumb & Dumber (1994)" "Jurassic Park (1993)" "Home Alone (1990)" "Rob Roy (1995)" ...
#>  $ genres   : chr  "Comedy" "Action|Adventure|Sci-Fi|Thriller" "Children|Comedy" "Action|Drama|Romance|War" ...
head(final_holdout_test)
#>   userId movieId rating timestamp
#> 1      1     231      5 838983392
#> 2      1     480      5 838983653
#> 3      1     586      5 838984068
#> 4      2     151      3 868246450
#> 5      2     858      2 868245645
#> 6      2    1544      3 868245920
#>                                                     title
#> 1                                    Dumb & Dumber (1994)
#> 2                                    Jurassic Park (1993)
#> 3                                       Home Alone (1990)
#> 4                                          Rob Roy (1995)
#> 5                                   Godfather, The (1972)
#> 6 Lost World: Jurassic Park, The (Jurassic Park 2) (1997)
#>                                    genres
#> 1                                  Comedy
#> 2        Action|Adventure|Sci-Fi|Thriller
#> 3                         Children|Comedy
#> 4                Action|Drama|Romance|War
#> 5                             Crime|Drama
#> 6 Action|Adventure|Horror|Sci-Fi|Thriller
```
