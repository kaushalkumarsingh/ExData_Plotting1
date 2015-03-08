source("loadData.R")
householdData <- loadHouseholdData()
weekdays <- strptime(paste(householdData$Date,householdData$Time),
                     format='%d/%m/%Y %H:%M:%S')


png("plot4.png")
par(mfrow=c(2,2))

## draw 1st graph
graph1 <- plot(weekdays,
               householdData$Global_active_power,
               xlab="",
               ylab="Global Active Power",
               type ="l"
)

## draw 2nd graph
graph2 <- plot(weekdays,
               householdData$Voltage,
               xlab="datetime",
               ylab="Voltage",
               type ="l"
)

## draw 3rd graph
dataSubMetering1 <- householdData$Sub_metering_1
dataSubMetering2 <- householdData$Sub_metering_2
dataSubMetering3 <- householdData$Sub_metering_3
graph3 <- plot(weekdays,
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
       bty="n",
       lty=1)

## draw 4th graph
graph4 <- plot(weekdays,
               householdData$Global_reactive_power,
               xlab="datetime",
               ylab="Global_reactive_power",
               type ="l"
)

dev.off()