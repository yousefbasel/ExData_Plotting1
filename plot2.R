pwcons<-read.table("../household_power_consumption.txt", header = TRUE, sep=";", 
                   colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

pwcons07<-subset(pwcons, ((as.Date(Date, '%d/%m/%Y')>=as.Date('01/02/2007', '%d/%m/%Y')) & (as.Date(Date, '%d/%m/%Y')<=as.Date('02/02/2007', '%d/%m/%Y'))))

strptime(paste(pwcons07$Date, pwcons07$Time),  "%d/%m/%Y %H:%M:%S")

pwcons07$datetime<-as.list(strptime(paste(pwcons07$Date, pwcons07$Time),  "%d/%m/%Y %H:%M:%S"))

png(filename="plot2.png", width=480, height=480, bg="white")

par(mfrow=c(1,1))

with(pwcons07, plot(datetime , Global_active_power,type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

#dev.copy(png, file="plot2.png")

dev.off()