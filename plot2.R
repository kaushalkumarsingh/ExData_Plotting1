source("loadData.R")
householdData <- loadHouseholdData()
weekdays <- strptime(paste(householdData$Date,householdData$Time),
                     format='%d/%m/%Y %H:%M:%S')
png("plot2.png")
plot(weekdays,
     householdData$Global_active_power,
     xlab = "",
     ylab="Global Active Power(kilowatts)",
     type = "l"
     )
dev.off()