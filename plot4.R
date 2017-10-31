pwcons<-read.table("../household_power_consumption.txt", header = TRUE, sep=";", 
                   colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

pwcons07<-subset(pwcons, ((as.Date(Date, '%d/%m/%Y')>=as.Date('01/02/2007', '%d/%m/%Y')) & (as.Date(Date, '%d/%m/%Y')<=as.Date('02/02/2007', '%d/%m/%Y'))))

strptime(paste(pwcons07$Date, pwcons07$Time),  "%d/%m/%Y %H:%M:%S")

pwcons07$datetime<-as.list(strptime(paste(pwcons07$Date, pwcons07$Time),  "%d/%m/%Y %H:%M:%S"))

png(filename="plot4.png", width=480, height=480, bg="white")

par(mfrow=c(2,2))

with(pwcons07, plot(datetime , Global_active_power,type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

with(pwcons07, plot(datetime , Voltage ,type = "l", xlab = "datetime", ylab = "Voltage"))

with(pwcons07, plot(datetime , Sub_metering_1  ,type = "l", xlab = "", ylab = "Energy sub metering" ))

lines(pwcons07$datetime,pwcons07$Sub_metering_2, type = "l", lty=1, col="red")
lines(pwcons07$datetime,pwcons07$Sub_metering_3, type = "l", lty=1, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"))

with(pwcons07, plot(datetime , Global_reactive_power ,type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

#dev.copy(png, file="ExData_Plotting1/plot4.png")

dev.off()