## code to prepare `init-movielens-data` dataset goes here

# Create or load from file input datasets

# Note: this process could take a couple of minutes
if(!require(tidyverse)) install.packages("tidyverse", repos = "http://cran.us.r-project.org")
if(!require(caret)) install.packages("caret", repos = "http://cran.us.r-project.org")

library(tidyverse)
library(caret)

options(timeout = 300)

# Initial dataset: MovieLens 10M dataset:
# https://grouplens.org/datasets/movielens/10m/
# http://files.grouplens.org/datasets/movielens/ml-10m.zip

# Prepare shared auxiliary functions -------------------------------------------
start_date <- function(){
  print(date())
  Sys.time()
}
end_date <- function(start){
  print(date())
  Sys.time() - start
}

# Function for the `edx` and `final_holdout_test` sets creation: ---------------
make_movielens_datasets <- function(){
  ##########################################################
  # Create `edx` and `final_holdout_test` sets
  ##########################################################
  init_data_path <- "data-raw"
  dl <- file.path(init_data_path, "ml-10M100K.zip")

  if(!file.exists(dl)){
    print("Downloading archived data...")
    start <- start_date()
    download.file("https://files.grouplens.org/datasets/movielens/ml-10m.zip", dl)
    end_date(start)
  }

  zipped_ratings_file <- "ml-10M100K/ratings.dat"
  ratings_file <- file.path(init_data_path, zipped_ratings_file)

  if(!file.exists(ratings_file)){
    print("Unpacking initial ratings data file...")
    start <- start_date()
    unzip(dl, zipped_ratings_file, exdir = init_data_path)
    end_date(start)
  }

  zipped_movies_file <- "ml-10M100K/movies.dat"
  movies_file <- file.path(init_data_path, zipped_movies_file)

  if(!file.exists(movies_file)){
    print("Unpacking movies data file...")
    start <- start_date()
    unzip(dl, zipped_movies_file, exdir = init_data_path)
    end_date(start)
  }

  print("Reading ratings data from file...")
  start <- start_date()
  ratings <- as.data.frame(str_split(read_lines(ratings_file), fixed("::"), simplify = TRUE),
                           stringsAsFactors = FALSE)
  end_date(start)

  colnames(ratings) <- c("userId", "movieId", "rating", "timestamp")
  ratings <- ratings %>%
    mutate(userId = as.integer(userId),
           movieId = as.integer(movieId),
           rating = as.numeric(rating),
           timestamp = as.integer(timestamp))

  print("Reading movies data from file...")
  start <- start_date()
  movies <- as.data.frame(str_split(read_lines(movies_file), fixed("::"), simplify = TRUE),
                          stringsAsFactors = FALSE)
  end_date(start)

  colnames(movies) <- c("movieId", "title", "genres")
  movies <- movies %>%
    mutate(movieId = as.integer(movieId))

  movielens <- left_join(ratings, movies, by = "movieId")

  # Final hold-out test set will be 10% of MovieLens data
  set.seed(1, sample.kind="Rounding") # if using R 3.6 or later
  # set.seed(1) # if using R 3.5 or earlier
  test_index <- createDataPartition(y = movielens$rating, times = 1, p = 0.1, list = FALSE)
  edx <- movielens[-test_index,]
  temp <- movielens[test_index,]
  #-----------------------------------------------------------------------

  # Make sure userId and movieId in final hold-out test set are also in edx set
  final_holdout_test <- temp %>%
    semi_join(edx, by = "movieId") %>%
    semi_join(edx, by = "userId")

  # Add rows removed from final hold-out test set back into edx set
  removed <- anti_join(temp, final_holdout_test)
  edx <- rbind(edx, removed)

  print("Removing temporary objects from the working environment...")
  start <- start_date()
  rm(dl, ratings, movies, test_index, temp, movielens, removed)
  end_date(start)

  list(edx = edx, final_holdout_test = final_holdout_test)
}

#------------------------------------------

print("Creating MovieLens datasets...")
start <- start_date()
movielens_datasets <- make_movielens_datasets()
end_date(start)

edx <- movielens_datasets$edx
final_holdout_test <- movielens_datasets$final_holdout_test

#> Ensure that both datasets have been successfully created:
str(edx)
str(final_holdout_test)

print("Saving newly created MovieLens datasets...")
start <- start_date()

usethis::use_data(edx, overwrite = TRUE, compress = "xz")
usethis::use_data(final_holdout_test, overwrite = TRUE, compress = "xz")
rm(edx, final_holdout_test, movielens_datasets)
end_date(start)
print("Finished initializing MovieLens datasets.")
