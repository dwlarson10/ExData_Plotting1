#Set Directory and import data
df <- "household_power_consumption.txt"

data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")



final <- subset(data,Date =='1/2/2007'|Date =='2/2/2007')

#Modify Data
datetime <- strptime(paste(final$Date, final$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(final$Global_active_power)
VOLT <- as.numeric(final$Voltage)
GRP <- as.numeric(final$Global_reactive_power)

SM1 <- as.numeric(final$Sub_metering_1)
SM2 <- as.numeric(final$Sub_metering_2)
SM3 <- as.numeric(final$Sub_metering_3)



#Build Chart
png("plot4.png", width=480, height=480)
par(mfcol = c(2,2))
plot(datetime,GAP, type="l",col="black",xlab="", ylab="Global Active Power")
plot(datetime,SM1, type="l",col="black",xlab="", ylab="Energy Sub Metering")
lines(datetime, SM2, type="l", col="red")
lines(datetime, SM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(datetime,VOLT, type="l",col="black",xlab="", ylab="Voltage")
plot(datetime,GRP, type="l",col="black",xlab="", ylab="Global Reactive Power")
dev.off()