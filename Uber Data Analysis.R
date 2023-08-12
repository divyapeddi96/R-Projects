# Adding Libraries
library(ggplot2)
library(ggthemes)
library(lubridate)
library(dplyr)
library(tidyr)
library(DT)
library(scales)

# Read the data for each month separately 
apr <- read.csv("C:/Users/divya/OneDrive/Desktop/DIVYA- PERSONAL/Projects/Uber-dataset/New folder/uber-raw-data-apr14.csv")
may <- read.csv("C:/Users/divya/OneDrive/Desktop/DIVYA- PERSONAL/Projects/Uber-dataset/New folder/uber-raw-data-may14.csv")
june <- read.csv("C:/Users/divya/OneDrive/Desktop/DIVYA- PERSONAL/Projects/Uber-dataset/New folder/uber-raw-data-jun14.csv")
july <- read.csv("C:/Users/divya/OneDrive/Desktop/DIVYA- PERSONAL/Projects/Uber-dataset/New folder/uber-raw-data-jul14.csv")
aug <- read.csv("C:/Users/divya/OneDrive/Desktop/DIVYA- PERSONAL/Projects/Uber-dataset/New folder/uber-raw-data-aug14.csv")
sept <- read.csv("C:/Users/divya/OneDrive/Desktop/DIVYA- PERSONAL/Projects/Uber-dataset/New folder/uber-raw-data-sep14.csv")

# Combine data
data <- rbind(apr, may, june, july, aug, sept)
cat("The dimensions of the data are",dim(data))

# Print first 6 rows
head(data)