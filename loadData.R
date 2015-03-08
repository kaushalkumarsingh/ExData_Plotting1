## Load only the relevant data considering the size
loadHouseholdData <- function() {
        options(gsubfn.engine = "R")
        library(sqldf)
        householdData <- read.csv2.sql("./household_power_consumption.txt", sql="select * from file where Date ='1/2/2007' OR Date = '2/2/2007'")
}

