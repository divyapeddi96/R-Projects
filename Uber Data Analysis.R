# UBER DATA ANALYSIS IN R

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

# Create a POSIXct object for a specific date and time
data$Date.Time <- as.POSIXct(data$Date.Time, format ="%m/%d/%Y %H:%M:%OS")

# Extract Components
data$date <- as.Date(data$Date.Time)
data$month <- format(data$date,"%m")
data$time <- format(data$Date.Time, format = "%H:%M:%S")
data$time <- hms(data$time) # Convert character time to hms format
data$hour = hour(data$time) # Extract hour numerically

# Assign levels for time levels as parts of day
data$time_level <- cut(data$hour,breaks =c(0,12,17,24),labels = c("Morning","Afternoon","Evening"),include.lowest = T)
tail(data)

# Plotting which part of the day has most bookings
ggplot(data, aes(x = time_level, fill = "#B19CD9"))+         
  geom_bar(stat = "count", position = "dodge") +
scale_fill_identity()

# Calculate the total number of pick ups
monthly_pickups <- data %>%
  group_by(month) %>%
  summarise(total_pickups = n()) %>%
  arrange(month)

# Convert the monthly_pickups (char) into numeric 
# This is used later for line plot as it can't join char points 
monthly_pickups$month <- as.numeric(monthly_pickups$month)

# Create a trend line plot showing pickup trends by month
ggplot(monthly_pickups, aes(x = month, y = total_pickups)) +
  geom_point(color = "blue") +
geom_line(color = "red")+
  labs(title = "Trend of Monthly Pickups",
       x = "Month",
       y = "Total Pickups")+
  xlim(4, 9)































