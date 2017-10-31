pwcons<-read.table("household_power_consumption.txt", header = TRUE, sep=";", 
                   colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

pwcons07<-subset(pwcons, ((as.Date(Date, '%d/%m/%Y')>=as.Date('01/02/2007', '%d/%m/%Y')) & (as.Date(Date, '%d/%m/%Y')<=as.Date('02/02/2007', '%d/%m/%Y'))))

hist(pwcons07$Global_active_power, xlab = "Global Active Power (killowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")

dev.copy(png, file="plot1.png")

dev.off()