## ---------------------------
##
## Script name: Week 1a Exercise.R
##
## Purpose of script:
##
## Author: Lauren Rackley
##
## Date Created: 2024-03-26
##

# set working directory
setwd("/Users/laurenrackley/Desktop/R Guru")

# Step 1 - Read DM Specs from Excel
library(readxl)
dm_specs <- read_excel("/Users/laurenrackley/Desktop/R Guru/DM_Specs.xlsx")
dm_specs

# Step 3 - Create dm dataframe from CSV
dm <- read.csv("/Users/laurenrackley/Desktop/R Guru/input.csv") 
dm

# Step 4 - Export CSV file from dm dataframe
write.csv(dm, "/Users/laurenrackley/Desktop/R Guru/dm.csv", row.names=FALSE)

# Step 5 - Export Excel file from dm dataframe
install.packages("writexl")
library(writexl)

write_xlsx(dm, "/Users/laurenrackley/Desktop/R Guru/dm.xlsx")

# Step 6 - Create ADSL dataframe from ADSL.sas7bdat
install.packages("haven")
require(haven)
adsl <- read_sas("/Users/laurenrackley/Desktop/R Guru/adsl.sas7bdat")
head(adsl)

# Step 7 - Write ADSL dataframe as ADSL2.sas7bdat
write_sas(adsl, "adsl2.sas7bdat")

ls()

tg <- ToothGrowth # save sample data frame to tg data frame
attributes(tg) # display tg attributes, names (tg) is alternative to display variable names
summary(tg) # display stats object of continuous variables

# display records 3 and 4 in tg dataframe
tg[3:4,]