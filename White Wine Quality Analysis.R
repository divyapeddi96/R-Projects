# White Wine Quality Analysis

library(datarium)
library(ggplot2)
library(outliers)
library(car)
library(olsrr)
library(tidyverse)
require(caTools)
library(Metrics)
library(MASS)
library(corrplot)
library(caret)
library(plyr)
library(tidyverse)
library(MASS)
library(psych)

# Reading dataset
WhiteWine = read.csv("whitewines.csv")

# Summary of data
head(WhiteWine)
summary(WhiteWine)

# Plotting correlation within the variables
corrplot(cor(WhiteWine))

attach(WhiteWine)

