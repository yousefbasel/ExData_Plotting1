# Reading datasets.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filtering the dataset for Baltimore City, Maryland (fips=="24510") 
NEIBaltimore<-NEI[NEI$fips=="24510",]
# Finding total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008
BaltimoreEmission<-aggregate(Emissions ~ year, sum, data=NEIBaltimore)

#plotting it 
png(file="plot2.png")
with(BaltimoreEmission, plot(year,Emissions))
title(main = "PM2.5 1999, 2002, 2005, 2008")
dev.off()

#From the plot we can see that PM2.5 emission in Baltimore has fluctuated but overall it 
#has decreased throughout the given years.