##########################
# R for Public Policy
# Assignment - Task 3
# Zhonghan Xie
# U-M ID: 83866049
# Date: Sep 30, 2023
##########################

load("PubPol477477Task3F23.Rdata")
library(tidyverse)

## AIRBAGS
# Examine the AIRBAGS data
dim(AIRBAGS)
names(AIRBAGS)
str(AIRBAGS)

#create variable "carage"
AIRBAGS <- AIRBAGS %>%
            mutate(carage = yearacc - yearVeh)

#create variable seatbeltmand
AIRBAGS$seatbeltmand <- NA
AIRBAGS$seatbeltmand[AIRBAGS$yearVeh>1973] <- 1
AIRBAGS$seatbeltmand[AIRBAGS$yearVeh<=1973] <- 0

#create variable airbagmand
AIRBAGS$airbagmand <- NA
AIRBAGS$airbagmand[AIRBAGS$yearVeh > 1998] <- 1
AIRBAGS$airbagmand[AIRBAGS$yearVeh <= 1998] <- 0

#separate variable "caseid" 
AIRBAGS <- AIRBAGS %>% 
  separate(caseid, sep=":",
          into=c("sample","case","vehiclenumber"))

## FUELECON
# generate comb
FUELECON <- FUELECON %>%
            mutate(comb = 0.55*cty+0.45*hwy)

#generate classavghwy and classavgcty
FUELECON <- FUELECON %>%
            group_by(year,class) %>%
            mutate(classavghwy = mean(hwy, na.rm=T)) %>%
            mutate(classavgcty = mean(cty, na.rm=T)) %>%
            ungroup()

#generate combavg
FUELECON <- FUELECON %>%
            group_by(year) %>%
            mutate(combavg = mean(comb)) %>%
            ungroup()

## WAGES
# generate L_LWAGE
WAGES <- WAGES %>%
          group_by(ID) %>%
          mutate(L_LWAGE = lag(LWAGE))

# generate TOTEARN
# Because we group_by(ID) in previous codes, so we don't need to group_by()
# in this step.
WAGES <- WAGES %>%
          mutate(TOTEARN = cumsum(WKS*LWAGE)) 



# generate LWAGE_DIF, which is the difference between LWAGE and L_LWAGE
# i.e., LWAGE_DIF = LWAGE - L_LWAGE
WAGES <- WAGES %>%
        ungroup() %>%
        mutate(LWAGE_DIF = LWAGE - L_LWAGE)


