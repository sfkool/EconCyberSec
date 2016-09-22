


##Read in CSV file
SilkRoad2 <- read.csv("/media/stephan/CORSAIR64GB/Data/SEPAM/WM0824TU Economics of Cyber Security/GitRepo/econcybersec/silkroad2_2016_04_20_17_16_26.csv", sep="\t", header=FALSE, nrows=312200)

##Add columnnames
colnames(SilkRoad2) <- c('Date','Description','URL','Price','User','Reviews','Product')

##Get insight into the data
summary(SilkRoad2)

