library(dplyr)
library(ggplot2)
# Reading datasets.
NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")


# filtering the dataset for Baltimore City, Maryland (fips=="24510") 
NEIBaltimore<-NEI[NEI$fips=="24510",]
# Finding total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008
SumByTypeYear <- NEI[NEI$fips=="24510",] %>% group_by(type, year) %>% summarise(sumEmissions=sum(Emissions))

#g <- ggplot(SumByTypeYear, aes(year, type, sumEmissions))
## Add layers
ggplot(SumByTypeYear, aes(x=year, y=sumEmissions, group=type, fill=year, color=type))  + 
geom_line()+
  labs(x="year")+
  labs(y="Emission")+
  labs(title="Emission across years per type")

ggsave("plot3.png", plot = last_plot())
dev.off()
#plotting it 
#png(file="plot2.png")
#with(BaltimoreEmission, plot(year,Emissions))
#title(main = "PM2.5 1999, 2002, 2005, 2008")
#dev.off()

#From the plot we can see that PM2.5 emission in Baltimore has differred across sources.
# Emission in 'Non-Road' source has seen a decrease from 1999 to 2008.
# Emission in 'Non-Point' source has seen a decrease from 1999 to 2008
# Emission in 'Point' source has seen an increase from 1999 to 2008
# Emission in 'On Road' source has seen a decrease from 1999 to 2008
