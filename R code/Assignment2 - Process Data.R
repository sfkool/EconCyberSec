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


#####create subsets for each category and related descriptive statistics and boxplots

#0-Day Exploits
zeroday_exploits <- subset(RealDeal_Cybercrimes_Prices,Product=="0-Day exploits")
describe(zeroday_exploits$Dollarprice)
png(file = "C:\\Users\\vbaldew\\Documents\\EconCyberSec\\R code\\boxplots\\zeroday.png")
boxplot(zeroday_exploits$Dollarprice, ylab = "Price ($)", xlab = "0-Day exploits")
dev.off()

#1-Day Exploits
oneday_exploits <- subset(RealDeal_Cybercrimes_Prices, Product=="1Day Private Exploits")
describe(oneday_exploits$Dollarprice)
png(file = "C:\\Users\\vbaldew\\Documents\\EconCyberSec\\R code\\boxplots\\oneday.png")
boxplot(oneday_exploits$Dollarprice, ylab = "Price ($)", xlab = "1Day Private exploits")
dev.off()

#Accounts
accounts <- subset(RealDeal_Cybercrimes_Prices, Product=="Accounts")
describe(accounts$Dollarprice)
png(file = "C:\\Users\\vbaldew\\Documents\\EconCyberSec\\R code\\boxplots\\accounts.png")
boxplot(accounts$Dollarprice, ylab = "Price ($)", xlab = "Accounts")
dev.off()

#Cards
cards <- subset(RealDeal_Cybercrimes_Prices, Product=="Cards")
describe(cards$Dollarprice)
png(file = "C:\\Users\\vbaldew\\Documents\\EconCyberSec\\R code\\boxplots\\cards.png")
boxplot(cards$Dollarprice, ylab = "Price ($)", xlab = "Cards")
dev.off()

#Databases
databases <- subset(RealDeal_Cybercrimes_Prices, Product=="Databases")
describe(databases$Dollarprice)
png(file = "C:\\Users\\vbaldew\\Documents\\EconCyberSec\\R code\\boxplots\\databases.png")
boxplot(databases$Dollarprice, ylab = "Price ($)", xlab = "Databases")
dev.off()

#Hardware
hardware <- subset(RealDeal_Cybercrimes_Prices, Product=="Hardware")
describe(hardware$Dollarprice)
png(file = "C:\\Users\\vbaldew\\Documents\\EconCyberSec\\R code\\boxplots\\hardware.png")
boxplot(hardware$Dollarprice, ylab = "Price ($)", xlab = "Hardware")
dev.off()

#RATs
rats <- subset(RealDeal_Cybercrimes_Prices, Product=="RATs")
describe(rats$Dollarprice)
png(file = "C:\\Users\\vbaldew\\Documents\\EconCyberSec\\R code\\boxplots\\RATs.png")
boxplot(rats$Dollarprice, ylab = "Price ($)", xlab = "RATs")
dev.off()

#Source Code
source_code <- subset(RealDeal_Cybercrimes_Prices, Product=="Source Code")
describe(source_code$Dollarprice)
png(file = "C:\\Users\\vbaldew\\Documents\\EconCyberSec\\R code\\boxplots\\sourcecode.png")
boxplot(source_code$Dollarprice, ylab = "Price ($)", xlab = "Source Code")
dev.off()

#Spam
spam <- subset(RealDeal_Cybercrimes_Prices, Product=="Spam")
describe(spam$Dollarprice)
png(file = "C:\\Users\\vbaldew\\Documents\\EconCyberSec\\R code\\boxplots\\spam.png")
boxplot(spam$Dollarprice, ylab = "Price ($)", xlab = "SPAM")
dev.off()

#FUD-exploits
fud_exploits <- subset(RealDeal_Cybercrimes_Prices, Product=="FUD Exploits")
describe(fud_exploits$Dollarprice)
png(file = "C:\\Users\\vbaldew\\Documents\\EconCyberSec\\R code\\boxplots\\fud-exploits.png")
boxplot(fud_exploits$Dollarprice, ylab = "Price ($)", xlab = "FUD-Exploits")
dev.off()
