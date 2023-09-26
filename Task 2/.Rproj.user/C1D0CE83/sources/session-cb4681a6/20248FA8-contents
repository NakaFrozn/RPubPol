############################
# R for Public Policy
# Assignment - Task 2
# Zhonghan Xie
# U-M ID: 83866049
# Date: 09/26/2023
############################

# Load the dataset
load("~/Desktop/R for Public Policy/Assignment/Task 2/PubPol477577Task2F23.Rdata")

# Load the haven package
library(haven)

# Practicing Importing Data in Different File Types
## Stata .dta
df_bes_dta <- read_stata("./2010BESprepost.dta")
str(df_bes_dta)

## .csv
df_csv <- readr::read_csv("./TitanicSurvival.csv")
str(df_csv)

## SPSS .sav
df_bes_sav <- read_spss("./2010BESPreandPost.sav")
str(df_bes_sav)

## Excel .xlsx
### I have made some changes to the structure of the .xlsx file to make sure it
### can fit in the R.
### PS: I really hate the data structure of OECD Database, though its visualization
### is not bad.
### OECD database uses ".." to denote NA value.
df_xlsx <- readxl::read_excel("./oecdecondata1.xlsx",range="A5:M923",na="..")
str(df_xlsx)
df_xlsx <- df_xlsx[,c(-2,-4)] # to delete the NA columns
dim(df_xlsx)

## Delim .txt
df_delim <- read.delim("./oecdecondata.txt")
str(df_delim)

# Checking imports
str(df_bes_dta)
str(df_bes_sav)
head(df_bes_dta,5)
head(df_bes_sav,5)
## The column names of dta dataframe and csv dataframe are slightly different.
## The column names in csv dataframe are all in upper case.
## But in the dta dataframe, they are all in lower case.

dim(df_bes_dta)
dim(df_bes_sav)
## The dimension of both tibbles are 3512*1301


