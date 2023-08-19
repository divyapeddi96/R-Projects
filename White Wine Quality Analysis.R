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
WhiteWine = read.csv("C:\\Users\\divya\\OneDrive\\Desktop\\Projects\\winequality-white.csv", sep = ";")

# Summary of data
head(WhiteWine)
summary(WhiteWine)

# Plotting correlation within the variables
corrplot(cor(WhiteWine))

attach(WhiteWine)

# Bar Plot for overall quality of each variable 
par(mfrow=c(2,2), oma = c(1,1,0,0) + 0.1, mar = c(3,3,1,1) + 0.1)
barplot((table(quality)), col=c("slateblue4", "slategray", "slategray1", "slategray2", "slategray3", "skyblue4"))
mtext("Quality", side=1, outer=F, line=2, cex=0.8)

# Histogram for fixed.acidity
truehist(fixed.acidity, h = 0.5, col="slategray3")
mtext("Fixed Acidity", side=1, outer=F, line=2, cex=0.8)

# Histogram for fixed.acidity
truehist(volatile.acidity, h = 0.05, col="slategray3")
mtext("Volatile Acidity", side=1, outer=F, line=2, cex=0.8)

# Histogram for fixed.acidity
truehist(citric.acid, h = 0.1, col="slategray3")
mtext("Citric Acid", side=1, outer=F, line=2, cex=0.8)

# Boxplot for variables
par(mfrow=c(1,5), oma = c(1,1,0,0) + 0.1,  mar = c(3,3,1,1) + 0.1)
boxplot(fixed.acidity, col="slategray2", pch=19)
mtext("Fixed Acidity", cex=0.8, side=1, line=2)

boxplot(volatile.acidity, col="slategray2", pch=19)
mtext("Volatile Acidity", cex=0.8, side=1, line=2)

boxplot(citric.acid, col="slategray2", pch=19)
mtext("Citric Acid", cex=0.8, side=1, line=2)

boxplot(residual.sugar, col="slategray2", pch=19)
mtext("Residual Sugar", cex=0.8, side=1, line=2)

boxplot(chlorides, col="slategray2", pch=19)
mtext("Chlorides", cex=0.8, side=1, line=2)


