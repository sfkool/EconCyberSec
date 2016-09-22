#install.packages('psych')
library(psych)
library(ggplot2)

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
Unique_Products

##Create dataframe with only Cybercrimes as product
#State which products are cybercrime
Cyber <- c(": 1Day Private Exploits",": Source Code",": 0-Day exploits",": Accounts")

#Paste the products together in order to be used in the 'grep' function
Cyber<- paste(Cyber,collapse="|")

RealDeal_Cyber <- RealDeal_Clean[grep(Cyber,RealDeal_Clean$Product),]

##Create barplot
## Code beneath is as a test, will be explained soon
#Data <- table(RealDeal_Cyber$Product)

#barplot(Data) 

#write.table(RealDeal_Cyber, file = "C:\\Users\\vbaldew\\Documents\\EconCyberSec\\test.csv")

#testDF <- read.csv("C:\\Users\\vbaldew\\Documents\\EconCyberSec\\test.csv", sep = ",")

#Data2 <- table(testDF$Product)
#barplot(Data2)
