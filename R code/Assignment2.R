#install.packages('psych')
library(psych)

##Read in CSV file
RealDeal <- read.csv("C:\\Users\\vbaldew\\Python\\EconCybSec\\therealdeal_2016_04_20_17_21_45.csv")

##Add columnnames
colnames(RealDeal) <- c('Date','Description','URL','Price','User','Reviews','Product')

##Get insight into the data
summary(RealDeal)

##Remove rows with no 'BTC' for price
#Text to select on
currency <- "BTC "

#Clean dataframe based on rows that conain prices that start with "BTC"
RealDeal_Clean <- RealDeal[grep(currency,RealDeal$Price),]

Unique_Products <- unique(RealDeal_Clean$Product)


