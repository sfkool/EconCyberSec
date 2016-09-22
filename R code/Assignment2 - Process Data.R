#Process data

library(psych)
library(dplyr)

##Read in CVS file
RealDeal_Cybercrimes <- read.csv("C:\\Users\\vbaldew\\Documents\\EconCyberSec\\RealDeal_Cyber_Clean.csv", sep = ",")

##Make barchart with frequency of Cyberattacks
CybercrimesCount <- table(RealDeal_Cybercrimes$Product)
par(mar=c(9, 4.1, 4.1, 2.1))
barplot(CybercrimesCount,ylab="Frequency",las=2)

##Add dollar prices to dataframe
#Read in Bitcoinprices CSV
Bitcoinprices <- read.csv("C:\\Users\\vbaldew\\Documents\\EconCyberSec\\Bitcoinprices.csv")

#Left join Bitcoinprices to dataframe on date
RealDeal_Cybercrimes_Prices <- merge(x = RealDeal_Cybercrimes, y = Bitcoinprices, by = "Date", all.x = TRUE)

#Compute dollarprice from dollar rate and bitcoin price
RealDeal_Cybercrimes_Prices$Dollarprice <- (RealDeal_Cybercrimes_Prices$Price * RealDeal_Cybercrimes_Prices$Close.Price)

#Round dollar price to two digits for easiness
RealDeal_Cybercrimes_Prices$Dollarprice <- round(RealDeal_Cybercrimes_Prices$Dollarprice,digits = 2)


##Create plots from products
#First check how many products there are for eacht category

#create subsets for each category
zeroday_exploits <- subset(RealDeal_Cybercrimes_Prices,Product=="0-Day exploits")
oneday_exploits <- subset(RealDeal_Cybercrimes_Prices, Product=="1Day Private Exploits")
accounts <- subset(RealDeal_Cybercrimes_Prices, Product=="Accounts")
cards <- subset(RealDeal_Cybercrimes_Prices, Product=="Cards")
databases <- subset(RealDeal_Cybercrimes_Prices, Product=="Databases")
hardware <- subset(RealDeal_Cybercrimes_Prices, Product=="Hardware")
rats <- subset(RealDeal_Cybercrimes_Prices, Product=="RATs")
source_code <- subset(RealDeal_Cybercrimes_Prices, Product=="Source Code")
spam <- subset(RealDeal_Cybercrimes_Prices, Product=="Spam")
fud_exploits <- subset(RealDeal_Cybercrimes_Prices, Product=="FUD Exploits")

#create plot
describe(zeroday_exploits$Dollarprice)
boxplot(zeroday_exploits$Dollarprice, label = "0-Day Exploits")

describe(spam$Dollarprice)
boxplot(spam$Dollarprice)
