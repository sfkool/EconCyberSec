##Clean data and get Cybercrimes out

library(psych)
library(ggplot2)

##Read in CSV file
RealDeal <- read.csv("C:\\Users\\vbaldew\\Python\\EconCybSec\\therealdeal_2016_04_20_17_21_45.csv",quote="")

##Add columnnames
colnames(RealDeal) <- c('Date','Description','URL','Price','User','Reviews','Product')

##Get insight into the data
summary(RealDeal)

##Remove rows with no 'BTC' for price
#Text to select on
URL_start <- "http"

#Clean dataframe based on rows that conain prices that start with "BTC"
RealDeal_Clean <- RealDeal[grep(URL_start,RealDeal$URL),]

#Get unique products and show them
RealDeal_Unique_Products <- unique(RealDeal_Clean$Product)
RealDeal_Unique_Products

##Create dataframe with only Cybercrimes as product
#State which products are cybercrime
Cyber <- c(": 1Day Private Exploits",": Source Code",": 0-Day exploits",": Accounts",": Information ",": RATs",": Databases",": Cards",": Hardware",": Spam",": FUD Exploits")

#Paste the products together in order to be used in the 'grep' function
Cyber<- paste(Cyber,collapse="|")

RealDeal_Cyber <- RealDeal_Clean[grep(Cyber,RealDeal_Clean$Product),]

##Write DataFrame to CSV
write.table(RealDeal_Cyber, file = "C:\\Users\\vbaldew\\Documents\\EconCyberSec\\RealDeal_Cybercrimes.csv",row.names=FALSE)
