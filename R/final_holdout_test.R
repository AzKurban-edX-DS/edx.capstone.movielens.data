#' `final_holdout_test` Dataset
#'
#' Final Hold-out Test Dataset for edX HarvardX PH125.9x Data Science Capstone project
#'
#' @format Object of class \code{data.frame} with 999999 obs. of  6 variables:
#'
#' \describe{
#'   \item{userId}{Unique Identifier for the  user (integer value).}
#'   \item{movieId}{Unique Identifier for the movie (integer value).}
#'   \item{rating}{A rating between 0 and 5 for the movie (numeric value).}
#'   \item{timestamp}{Date and time the rating was given (integer value).}
#'   \item{title}{Movie title (not unique, character string).}
#'   \item{genres}{Genres associated with the movie (character string).}
#' }
#'
#' @docType data
#'
#' @usage final_holdout_test
#'
#' @keywords dataset
#'
#' @references
#' F. Maxwell Harper and Joseph A. Konstan. 2015. The MovieLens Datasets: History and Context. ACM Transactions on Interactive Intelligent Systems (TiiS) 5, 4, Article 19 (December 2015), 19 pages. DOI=https://dx.doi.org/10.1145/2827872
#'
#' @source <https://files.grouplens.org/datasets/movielens/ml-10m.zip>
#'
#' @examples
#' str(final_holdout_test)
#'
#' head(final_holdout_test)
"final_holdout_test"
