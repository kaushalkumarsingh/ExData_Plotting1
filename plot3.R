source("loadData.R")
householdData <- loadHouseholdData()
weekdays <- strptime(paste(householdData$Date,householdData$Time),
                     format='%d/%m/%Y %H:%M:%S')
dataSubMetering1 <- householdData$Sub_metering_1
dataSubMetering2 <- householdData$Sub_metering_2
dataSubMetering3 <- householdData$Sub_metering_3

png("plot3.png")
## draw sub metering 1
plot(weekdays,
     dataSubMetering1,
     xlab="",
     ylab="Energy sub metering",
     type="l",
     col="black",
     ylim=range(c(dataSubMetering1,dataSubMetering2,dataSubMetering3))
     )
## Draw Sub metering 2
lines(weekdays,dataSubMetering2,col="red")
## Draw sub metering 3
lines(weekdays,dataSubMetering3,col="blue")
## legend on top right corner with colours corresponding to each sub metering
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1)
dev.off()


