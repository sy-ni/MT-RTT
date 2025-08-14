library(jsonlite)
library(tidyverse)
library(progress)


# path for the data

path <- "/Users/asf25/Box/MouseTracking/data/"

# JsPsych Experiment ----------------------------

files <- list.files(path, pattern = "*.csv")

all_demo <- data.frame()

for (file in files){
  file <- "EERES-28-07--21--15-B.csv"
  rawdata <- read.csv(paste0(path, "/", file))
  message(paste("\nProcessing:", file))
  
# PARTCICIPANT DATA ==============================================

# Demographics
demog <- rawdata[rawdata$trial_type == "survey-html-form", ]$response |>
  lapply(fromJSON) |> as.data.frame()

demog$jspscyh_id <- unique(rawdata$jspsych_id)[2] 
  
# Theme
demog$theme <- unique(rawdata$theme)[2] 

# Condition
demog$condition_A <- unique(rawdata$condition)[1]

# Rule 1
demog$rule1 <- unique(rawdata$rule1)[2]

# Rule 2
demog$rule2 <- unique(rawdata$rule2)[2]

# Block A only
demog$blockA_only <- unique(rawdata$block2only)[2] # what is 0?

}