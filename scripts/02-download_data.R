#### Preamble ####
# Purpose: Downloads and saves the data from Spotify Developer API
# Author: Aakash Vaithyanathan, Kevin Cai 
# Date: October 10, 2024
# Contact: aakash.vaithyanathan@mail.utoronto.ca, kevin.cai@mail.utoronto.ca
# License: MIT
# Pre-requisites: 1) Login in Spotify Developer API and make an app. 2) Save your client ID and secret key into environment file
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(devtools)
library(spotifyr)
library(rvest)

#### Download Coldplay artist spotify data ####
coldplay <- get_artist_audio_features("coldplay")

# Save the data
saveRDS(coldplay, "data/raw_data/coldplay.rds")

         
