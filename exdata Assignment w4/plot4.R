library(dplyr)
library(ggplot2)
# Reading datasets.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filtering the dataset for coal combustion-related sources from 1999 to 2008 
CoalComp<-NEI[NEI$SCC %in% SCC[grep("Coal", SCC$EI.Sector),"SCC"],]

# Finding total PM2.5 emission from coal combustion sources for each of the years 1999, 2002, 2005, and 2008
SumByYear <- CoalComp %>% group_by(year) %>% summarise(sumEmissions=sum(Emissions))


ggplot(SumByYear, aes(x=year, y=sumEmissions, fill=year))  + 
  geom_line()+
  labs(x="year")+
  labs(y="Emission")+
  labs(title="Emission across years for coal combustion soures.")

ggsave("plot4.png", plot = last_plot())
dev.off()

#From the plot we can see that the  emissions from coal combustion-related sources 
# has decreased from the year 1999 to 2008.