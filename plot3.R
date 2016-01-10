#Set Directory and import data
df <- "household_power_consumption.txt"

data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")



final <- subset(data,Date =='1/2/2007'|Date =='2/2/2007')

#Modify Data
datetime <- strptime(paste(final$Date, final$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
SM1 <- as.numeric(final$Sub_metering_1)
SM2 <- as.numeric(final$Sub_metering_2)
SM3 <- as.numeric(final$Sub_metering_3)



#Build Chart
png("plot3.png", width=480, height=480)
plot(datetime,SM1, type="l",col="black",xlab="", ylab="Energy Sub Metering")
lines(datetime, SM2, type="l", col="red")
lines(datetime, SM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
