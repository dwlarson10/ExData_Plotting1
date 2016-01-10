#Set Directory and import data
df <- "household_power_consumption.txt"

data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

final <- subset(data,Date =='1/2/2007'|Date =='2/2/2007')

#Modify Data
datetime <- strptime(paste(final$Date, final$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(final$Global_active_power)

#Build Chart
png("plot2.png", width=480, height=480)
plot(datetime,GAP, type="l",col="black",xlab="", ylab="Global Active Power")
dev.off()