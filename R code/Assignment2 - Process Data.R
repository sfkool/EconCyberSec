#Process data

library(psych)
library(dplyr)
library(reshape2)

##Read in CVS file
RealDeal_Cybercrimes <- read.csv("C:\\Users\\vbaldew\\Documents\\EconCyberSec\\RealDeal_Cyber_Clean.csv", sep = ",")

##Make barchart with frequency of Cyberattacks and save it immediately
CybercrimesCount <- table(RealDeal_Cybercrimes$Product)
#par(mar=c(9, 4.1, 4.1, 2.1))
#barplot(CybercrimesCount,xlab="Frequency",las=2, horiz = TRUE, col="lightblue")
png(file = "C:\\Users\\vbaldew\\Documents\\EconCyberSec\\R code\\boxplots\\vulnerabilities.png")
qplot(RealDeal_Cybercrimes$Product,ylab="Frequency",xlab="Cybercrime assets",main = "Frequency of Cybercrime assets") +coord_flip()
dev.off()

##Add dollar prices to dataframe
#Read in Bitcoinprices CSV
Bitcoinprices <- read.csv("C:\\Users\\vbaldew\\Documents\\EconCyberSec\\Bitcoinprices.csv")

#Left join Bitcoinprices to dataframe on date
RealDeal_Cybercrimes_Prices <- merge(x = RealDeal_Cybercrimes, y = Bitcoinprices, by = "Date", all.x = TRUE)

#Compute dollarprice from dollar rate and bitcoin price
RealDeal_Cybercrimes_Prices$Dollarprice <- (RealDeal_Cybercrimes_Prices$Price * RealDeal_Cybercrimes_Prices$Close.Price)

#Round dollar price to two digits for easiness
RealDeal_Cybercrimes_Prices$Dollarprice <- round(RealDeal_Cybercrimes_Prices$Dollarprice,digits = 2)

#Check various users and how much they sell
data.frame(summary(RealDeal_Cybercrimes$User))

#Count companies and make a graph out of it
Google <- length(grep("Android",RealDeal_Cybercrimes$Description))
Microsoft <- length(grep("Microsoft",RealDeal_Cybercrimes$Description)) + length(grep("Internet Explorer",RealDeal_Cybercrimes$Description)) + length(grep("Windows",RealDeal_Cybercrimes$Description))
Apple <- length(grep("apple",RealDeal_Cybercrimes$Description))  + length(grep("icloud",RealDeal_Cybercrimes$Description))
Linux <- length(grep("Linux",RealDeal_Cybercrimes$Description))
Wordpress <- length(grep("Wordpress",RealDeal_Cybercrimes$Description))
Mailbird <- length(grep("Mailbird",RealDeal_Cybercrimes$Description))
Adobe <- length(grep("Adobe",RealDeal_Cybercrimes$Description))

CompanyNames <- c("Google","Microsoft","Apple","Linux","Wordpress","Mailbird","Adobe")
Companies <- (c(Google,Microsoft,Apple,Linux,Wordpress,Mailbird,Adobe))
png(file = "C:\\Users\\vbaldew\\Documents\\EconCyberSec\\R code\\boxplots\\companies.png")
par(mar=c(10, 6, 4.1, 2.1))
barplot(as.table(setNames(Companies,CompanyNames)),horiz = TRUE,las=2,col="lightblue",main = "Cybercrime assets per company")
dev.off()


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

##Means dollarprices
zeroday_exploits_mean <- mean(zeroday_exploits$Dollarprice)
oneday_exploits_mean <- mean(oneday_exploits$Dollarprice)
accounts_mean <- mean(accounts$Dollarprice)
cards_mean <- mean(cards$Dollarprice)
databases_mean <- mean(databases$Dollarprice)
hardware_mean <- mean(hardware$Dollarprice)
rats_mean <- mean(rats$Dollarprice)
sourcecode_mean <- mean(source_code$Dollarprice)
fud_exploits_mean <- mean(fud_exploits$Dollarprice)
spam_mean <- mean(spam$Dollarprice)

Cyberassets <- c("0-day exploits","1-day exploits","Accounts","Cards","Databases","Hardware","RATs","Source Code","FUD Exploits","SPAM")
MeanPrice <- (c(zeroday_exploits_mean,oneday_exploits_mean,accounts_mean,cards_mean,databases_mean,hardware_mean,rats_mean,sourcecode_mean,fud_exploits_mean,spam_mean))
png(file = "C:\\Users\\vbaldew\\Documents\\EconCyberSec\\R code\\boxplots\\meanprice.png")
par(mar=c(10, 7, 2, 3))
barplot(as.table(setNames(as.integer(MeanPrice),Cyberassets)),horiz = TRUE,las=2,col="lightblue",main = "Average price per Cybercrime asset",xlab = "Price ($)")
dev.off()
