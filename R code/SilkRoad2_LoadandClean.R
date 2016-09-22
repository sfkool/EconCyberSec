#Silkroad2 Dataset


##Read in CSV file
SilkRoad2 <- read.csv("C:\\Users\\vbaldew\\Documents\\EconCyberSec\\silkroad2_2016_04_20_17_16_26.csv", sep="\t", header=FALSE, nrows=312200)

#Remove column
SilkRoad2 <- subset(SilkRoad2,select=-V6)

##Add columnnames
colnames(SilkRoad2) <- c('Date','Description','URL','Price','User','Product')

##Get insight into the data
summary(SilkRoad2)

##Remove rows with no /items for URL
#Text to select on
URL_start <- "/items"

#Clean dataframe based on URLs that don't start with /items
SilkRoad2_Clean <- SilkRoad2[grep(URL_start,SilkRoad2$URL),]

#Get unique products and show them
SilkRoad2_Unique_Products <- unique(SilkRoad2$Product)
SilkRoad2_Unique_Products
