#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(spotifyr)

#### Clean data ####
raw_data <- readRDS("data/raw_data/coldplay.rds")

cleaned_data <-
  raw_data |>
  janitor::clean_names()

cleaned_data$duration_min <- cleaned_data$duration_ms / 60000

cleaned_data <- 
  cleaned_data |>
    select(album_release_year, liveness, energy, valence, tempo, duration_min, key_mode)

cleaned_data <- 
  cleaned_data |> drop_na()
  

#### Save data ####
saveRDS(cleaned_data, "data/analysis_data/coldplay_cleaned_data.rds")
