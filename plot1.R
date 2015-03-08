source("loadData.R")
householdData <- loadHouseholdData()
png("plot1.png")
hist(householdData$Global_active_power, 
     col = 'red' , 
     xlab = "Global Active Power(kilowatts)",
     ylab = "Frequency", 
     main= "Global Active Power")
dev.off()