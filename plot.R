df <- "household_power_consumption.txt"

data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
final <- subset(data,Date =='1/2/2007'|Date =='2/2/2007')

#str(subSetData)
GAP <- as.numeric(final$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()