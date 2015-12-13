# Read the file into R

power_consumption <- read.csv2("household_power_consumption.txt", dec = ".", na.strings = "?")
pc_date <- power_consumption$Date
power_consumption$Date <- as.Date(pc_date, format = "%d/%m/%Y")
pc_time <- power_consumption$Time
power_consumption$Time <- strptime(pc_time, format = "%T")

dateTime <- paste(pc_date, pc_time)


# Format the date/time and subset to include only the pertinent dates

dateTime_2 <-strptime(dateTime, format = "%d/%m/%Y %H:%M:%S")
pc_new <- cbind(dateTime_2, power_consumption)

pc_specified_dates <- subset(pc_new, dateTime_2 >= "2007-02-01" & dateTime_2 < "2007-02-03", select = c(-Date, -Time))


# Code for the second exploratory plot

with(pc_specified_dates, plot(dateTime_2, Global_active_power,
                              xlab = "",
                              ylab = "Global Active Power (kilowatts)",
                              type = "l"))
dev.copy(png, file = "plot2.png")
dev.off()

