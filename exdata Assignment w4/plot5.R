library(dplyr)
library(ggplot2)
# Reading datasets.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filtering the dataset for motor vehicle related sources from 1999 to 2008 
motorVehicle<-NEI[NEI$SCC %in% SCC[grep("Motor", SCC$Short.Name),"SCC"],]

# Finding total PM2.5 emission from coal combustion sources for each of the years 1999, 2002, 2005, and 2008
SumByYear <- motorVehicle %>% group_by(year) %>% summarise(sumEmissions=sum(Emissions))

ggplot(SumByYear, aes(x=year, y=sumEmissions, fill=year))  + 
  geom_line()+
  labs(x="year")+
  labs(y="Emission")+
  labs(title="Emission across years for Motor vehicles soures.")

ggsave("plot5.png", plot = last_plot())
dev.off()

# We can see from the plot that the emission from motor vehicles has increased from 199 to 2008.