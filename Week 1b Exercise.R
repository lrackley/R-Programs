## ---------------------------
##
## Script name: Week 1b Exercise.R
##
## Purpose of script: Complete Week 1b exercises
##
## Author: Lauren Rackley
##
## Date Created: 2024-03-26
##

# Create variable exercises 
# Create gender variable
install.packages("lubridate") # install lubridate package
library(lubridate) # load lubridate
# 1
gender <- c("male","female")

# 2 
gender1 <- c("male",NA)

# 3 
age <- c(50,60)

# 4
myresults <- c(TRUE,TRUE)

# 5
mean(age) # display mean of age variable

# 6 
gender <- as.factor(gender)  # assign gender as factor

# 7 
mydate <- as.Date("2020-12-11") # create date variable for Dec 11, 2020
mydate <- mydate %m+% months(1) # add 1 month to date
mydate

# Creating dataframe exercises
# 1 
mydataframe <- data.frame(gender,gender1,age,myresults) # create data frame with these 4 vars
#2 
str(mydataframe) # display variable types and values


# Data Management Operations Exercises
mydata1 = subset(mydataframe, select = -c(gender1)) # drop gender1
print(mydata1) # checking if gender1 was dropped

mydata2 = mydataframe[c("age","gender")] # keep age and gender
print(mydata2) # checking we kept only age and gender

install.packages('tidyverse')
library(tidyverse) # load popular data management package
library(dplyr) # load common data management and SQL package
# create new variable for above or below 50 in age
# either use cut or ifelse function in R 
mydata2b = mutate(mydataframe, newvar = cut(age,c(0,50,100),labels=c("50 or Below","Above 50")))
print(mydata2b)

mydata2b <- mydataframe %>%
  mutate(newvar = ifelse(age < 51 & !is.na(mydataframe$age), "50 or Below", "Above 50"))
print(mydata2b)

colnames(mydataframe)[colnames(mydataframe) == 'gender'] <- 'sex' #rename gender to sex in mydataframe
attributes(mydataframe)

mydataframe[is.na(mydataframe)] <- 0 # replace NA values with zeros
str(mydataframe)

mydataframe = mutate(mydataframe, age1 = as.character(age)) # convert numeric age to char age
str(mydataframe)

mydataframe = mutate(mydataframe, gender1 = paste("Hi",gender)) # concatenate Hi with gender
str(mydataframe)

# recode male to "Male" and female to "Female" 
mydataframe$gender <- recode(gender, "male" = "Male", "female" = "Female")
print(mydataframe)

# subset for male
mydata3 <- subset(mydataframe, gender == 'Male') # Select males
print(mydata3)

# subset for not male
mydata3 <- subset(mydataframe, gender != 'Male') # select not males
print(mydata3)

mydata4 <- mtcars[order(mtcars$cyl, mtcars$mpg),] # sort by cyl, mpg
print(mydata4)

mydata5 <- mtcars[!duplicated(mtcars$mpg),!duplicated(mtcars$cyl), ] #remove duplicate values of cyl and mpg
print(mydata5) 