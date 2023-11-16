
#http://www.sthda.com/english/wiki/ggplot2-histogram-plot-quick-start-guide-r-software-and-data-visualization
setwd("C:/Users/2808v/Desktop/R_2023/Module_1")
library(tidyverse)
library(ggplot2)
#Analyze Quantitative Data LifeExpRegion.txt
Ldata <- read.csv('LifeExpDataComplete.csv', header=TRUE)
head(Ldata)
str(Ldata)
dim(Ldata)
class(Ldata)
typeof(Ldata)
###########
library(mice)
any (is.na(Ldata))
any (is.na(Ldata$LifeExp))
any (is.na(Ldata$GDP))
w <-which(is.na(Ldata$GDP))
print(w)
mice(Ldata) #Multivariate imputation by chained equations 
dim(Ldata)
md.pattern(Ldata)
print(p)
require(dplyr)
LEAP <-Ldata %>% 
  select(Country,Region,LifeExp,GDP,HIV) %>% 
  filter(Region=="EAP") %>% 
  na.omit() %>% 
 mean(LEAP$GDP)
    plot(LEAP$GDP)

ggplot(LEAP,aes_auto())


# Load the mice library
dat <- read.csv(url("http://goo.gl/19NKXV"), 
                header=TRUE, sep=",")
head(dat)
length(dat)
nrow(dat)
sapply(dat, function(x) sum(is.na(x)))
original <- dat
#Add NA to few rows
set.seed(10)
dat[sample(1:nrow(dat), 20), "Cholesterol"] <- NA
dat[sample(1:nrow(dat), 20), "Smoking"] <- NA
dat[sample(1:nrow(dat), 20), "Education"] <- NA
dat[sample(1:nrow(dat), 5), "Age"] <- NA
dat[sample(1:nrow(dat), 5), "BMI"] <- NA
#Confirm the presence of missings in the dataset.
sapply(dat, function(x) sum(is.na(x)))
# Transform varibles
library(dplyr) 
dat <- dat %>%
  mutate(Smoking = as.factor(Smoking)) %>% 
  mutate(Education = as.factor(Education)) %>% 
  mutate(Cholesterol = as.numeric(Cholesterol))
#Look the dataset structure.
str(dat)
#Everything looks OK, so lets proceed with imputation.
library(mice)
init = mice(dat, maxit=0) 
meth = init$method
predM = init$predictorMatrix
# Predictor
predM[c("BMI")]=0
meth[c("Age")]=""
# Now let specify the methods for imputing the missing value
meth[c("Cholesterol")]="norm" 
meth[c("Smoking")]="logreg" 
meth[c("Education")]="polyreg"
#Run m=5 imputation
set.seed(103)
imputed = mice(dat, method=meth, predictorMatrix=predM, m=5)
imputed <- complete(imputed)
sapply(imputed, function(x) sum(is.na(x)))
#Accuracy
# Cholesterol
actual <- original$Cholesterol[is.na(dat$Cholesterol)]
predicted <- imputed$Cholesterol[is.na(dat$Cholesterol)]
mean(actual)
## [1] 231.07
mean(predicted)
## [1] 231.3564

# Smoking
actual <- original$Smoking[is.na(dat$Smoking)] 
predicted <- imputed$Smoking[is.na(dat$Smoking)] 
table(actuals)
## actual
##  No Yes
##  11   9
table(predicted)
## predicted
##  No Yes
##  14   6

########clear console############################

      # Clear environment
      rm(list = ls())
      # Clear console
      cat("\014")# ctrl+L
      #Clear plot
      dev.off()    # Close plots ###############
      
######## Clear mind :) #########################
      
      