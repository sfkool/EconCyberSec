#install.packages('psych')
library(psych)

RealDeal <- read.csv("C:\\Users\\vbaldew\\Python\\EconCybSec\\therealdeal_2016_04_20_17_21_45.csv")

colnames(RealDeal) <- c('Date','Product','URL','Price','User','Reviews','Product')

describe(RealDeal)
summary(RealDeal)
