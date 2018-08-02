library(dplyr)
library(ggplot2)
# Reading datasets.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filtering the dataset for Baltimore City, Maryland (fips=="24510") 
NEIBaltimore<-NEI[NEI$fips=="24510",]
NEILosAngles<-NEI[NEI$fips=="06037",]

# filtering the dataset for motor vehicle related sources from 1999 to 2008 
BaltimoreMotorVehicle<-NEIBaltimore[NEIBaltimore$SCC %in% SCC[grep("Motor", SCC$Short.Name),"SCC"],]

LosAnglesMotorVehicle<-NEILosAngles[NEILosAngles$SCC %in%  SCC[grep("Motor", SCC$Short.Name),"SCC"],]

# Finding total PM2.5 emission from coal combustion sources for each of the years 1999, 2002, 2005, and 2008
BaltimoreSumByYear <- BaltimoreMotorVehicle %>% group_by(year) %>% summarise(sumEmissions=sum(Emissions))

LosAnglesSumByYear <- LosAnglesMotorVehicle %>% group_by(year) %>% summarise(sumEmissions=sum(Emissions))


ggplot() + 
  geom_line(data = BaltimoreSumByYear, aes(x = year, y = sumEmissions), color = "red", show.legend = TRUE) +
  geom_line(data = LosAnglesSumByYear, aes(x = year, y = sumEmissions), color = "blue", show.legend = TRUE) +
  xlab('year') +
  ylab('Emmision')+
 # scale_colour_manual("", 
 #                     breaks = c("TempMax", "TempMedia", "TempMin"),
 #                     values = c("red", "green", "blue")) +
  labs(title="B.more-red vs L.Angles-blue")

ggsave("plot6.png", plot = last_plot())
dev.off()

#From the plot I can see that overall Baltimore has a much lower emission in comparison 
# to Los Angles County, California. Baltimore has seen more fluctuation in emission but ended up in similar value as in 1999
#On the other hand Los Angles County has seen greater changes in motor emission over time in motor vehicle.
#