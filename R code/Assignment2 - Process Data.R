#Process data
RealDeal_Cyber2 <- read.csv("C:\\Users\\vbaldew\\Documents\\EconCyberSec\\test.csv", sep = " ")

Data2 <- table(RealDeal_Cyber2$Product)
barplot(Data2)