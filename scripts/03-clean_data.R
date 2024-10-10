#### Preamble ####
# Purpose: Cleans the raw data for ColdPlay Artist
# Author: Aakash Vaithyanathan, Kevin Cai, Bolin Shen  
# Date: October 10, 2024
# Contact: aakash.vaithyanathan@mail.utoronto.ca, kevin.cai@mail.utoronto.ca, bolin.shen@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

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
