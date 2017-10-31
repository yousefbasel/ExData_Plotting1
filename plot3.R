pwcons<-read.table("household_power_consumption.txt", header = TRUE, sep=";", 
                   colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

pwcons07<-subset(pwcons, ((as.Date(Date, '%d/%m/%Y')>=as.Date('01/02/2007', '%d/%m/%Y')) & (as.Date(Date, '%d/%m/%Y')<=as.Date('02/02/2007', '%d/%m/%Y'))))

strptime(paste(pwcons07$Date, pwcons07$Time),  "%d/%m/%Y %H:%M:%S")

pwcons07$datetime<-as.list(strptime(paste(pwcons07$Date, pwcons07$Time),  "%d/%m/%Y %H:%M:%S"))

with(pwcons07, plot(datetime , Sub_metering_1  ,type = "l", xlab = "", ylab = "Energy sub meterin"))

with(pwcons07, plot(datetime , Sub_metering_1  ,type = "l", xlab = "", ylab = "Energy sub metering" ))

lines(pwcons07$datetime,pwcons07$Sub_metering_2, type = "l", lty=1, col="red")
lines(pwcons07$datetime,pwcons07$Sub_metering_3, type = "l", lty=1, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"))

  #plot(datetime , Sub_metering_2  ,type = "l", xlab = "", ylab = "Energy sub meterin", col="red")
  #plot(datetime , Sub_metering_3  ,type = "l", xlab = "", ylab = "Energy sub meterin", col="blue")})

dev.copy(png, file="plot3.png")

dev.off()