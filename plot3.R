## Getting full dataset
data_hpc <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_hpc$Date <- as.Date(data_hpc$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(data_hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_hpc)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 3 to be created by histogram
with(data, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving plot3 to png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()