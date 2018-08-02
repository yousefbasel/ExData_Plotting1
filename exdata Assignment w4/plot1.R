# Reading datasets.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Finding total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008
EmissionAcrossYears<-aggregate(Emissions ~ year, sum, data=NEI)


#plotting it 
png(file="plot1.png")
with(EmissionAcrossYears, plot(year,Emissions))
title(main = "PM2.5 1999, 2002, 2005, 2008")
dev.off()

#From the plot we can see that PM2.5 has decreased throughout the given years.