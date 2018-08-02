#Q.1 
# 1- Usually the first step in exploratory data analysis we try to formulate a quesion 
# in this case we have the quesiton/s formulated for us
# 2- Read in our data using the two commands 

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# I usually rewrite the names of the columns to remove any spaces but in this case
# there are no spaces.
#names(SCC)<-make.names(names(SCC))

#3- Check the packaging
nrow(NEI) # 6497651
ncol(NEI) # 6

nrow(SCC) # 11717
ncol(SCC) # 15

# 4- Run str()

str(NEI)
str(SCC)

# you can capture the output in a variable:
strNEI<-capture.output(str(NEI))
strSCC<-capture.output(str(SCC))

# 5- Look at the top and bottom of the data
head(NEI)
tail(NEI)

head(SCC)
tail(SCC)

# 6- Check your "n"s
#The number of observations/rows was not given in the question so it is hard to tell.
# However, by looking at the column SCC$Last.Inventory.Year, I noticed the following 
# values : 1999, 2002, 2005, 2008 which are the values given in the quesion.
# One thing to notice here is that there are only very few observations from the year 2008 in SCC.

table(SCC$Last.Inventory.Year)

# However, in NEI dataset the number of observations between the 4 years doesn't seem
# to differ much.
table(NEI$year)
# To get the number of unique rows in the SCC$SCC columns, I use the following command.
library(dplyr)
select(SCC,SCC) %>% unique %>% nrow

# 7- Validate with at least one external data source.
#looking online it seems that there are 3242 counties in US. However, in this dataset
# The number of counties in NEI$fips seems to be 3263, not sure why
select(NEI, fips) %>% unique %>% nrow
# by checking the summary of NEI$Emissions
summary(NEI$Emissions)
# I found that the maximum Emissions value is quite high but in general the bulk of distribution is 
# below 5  (the mean is 3.4)
# To get a bit more detail about the distribution by looking at deciles of the data.
# Note decile is defined as: "each of ten equal groups into which a population can be 
#divided according to the distribution of values of a particular variable."
quantile(NEI$Emissions, seq(0,1,0.1))


# Finding total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008
EmissionAcrossYears<-aggregate(Emissions ~ year, sum, data=NEI)

#plotting it 
png(file="plot1")
with(EmissionAcrossYears, plot(year,Emissions))
title(main = "PM2.5 1999, 2002, 2005, 2008")
dev.off()
