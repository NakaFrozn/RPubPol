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
### PS: I really hate the data structure of OECD Database, though its visualization
### is not bad.
### Due to the merged cells in the .xlsx file, we use openxlsx::read.xlsx to deal with it.
# install.packages("openxlsx")  To check if the package has been installed
df_xlsx <- openxlsx::read.xlsx("./oecdecondata1.xlsx",rows=c(5:923),cols=c(1:13),fillMergedCells = T, na.strings="..")
# Options: rows and columns specify the range of data we load into R
# fillMergedCells=T specify we need to fill the merged cells with the data.
# OECD database uses ".." to denote NA value. So we specify it in na.strings
df_xlsx <- df_xlsx[,-4] # delete the fourth column due to it is na
df_xlsx_2003 <- subset(df_xlsx,df_xlsx$Time==2003)
oecd_countrylist <- c(df_xlsx_2003[1:36,1]) # to get the names of OECD countries
# print(oecd_countrylist)
for (i in c(1:nrow(df_xlsx))){
  if (df_xlsx[i,1] %in% oecd_countrylist){
    df_xlsx[i,1] <- "OECD Economies"
  }
} # The for loop above labels all the OECD economies
vec_colnames <- c("Category","Country","Time",
                  "Current account balance as a percentage of GDP",
                  "Real effective exchange rate, constant trade weights",
                  "Ratio of potential to actual real GDP of the total economy",
                  "Consumer price index",
                  "Consumer price index, harmonised",
                  "Gross domestic product, market prices, deflator",
                  "Labour productivity, total economy",
                  "Unemployment rate",
                  "Long-term interest rate on government bonds")
names(df_xlsx) <- vec_colnames # Rename the variables
str(df_xlsx) # Check again the structure of the data.frame

## Delim .txt
df_delim <- read.delim("./oecdecondata.txt")
str(df_delim)

# Checking imports
str(df_bes_dta)
str(df_bes_sav)
head(df_bes_dta)
head(df_bes_sav)
## The column names of dta dataframe and csv dataframe are slightly different.
## The column names in csv dataframe are all in upper case.
## But in the dta dataframe, they are all in lower case.

dim(df_bes_dta)
dim(df_bes_sav)
## The dimension of both tibbles are 3512*1301


