source("load_data.R")

png(filename = "plot4.png", width = 480, height = 480, units = "px")

#plots
par(mfrow=c(2,2))

# Top left
plot(df$DateTime, df$Global_active_power,
     ylab='Global Active Power', xlab='', type='l')

# Top right
plot(df$DateTime, df$Voltage,
     xlab='datetime', ylab='Voltage', type='l')

# Bottom left
plot(df$DateTime, df$Sub_metering_1, type='l',
     xlab='', ylab='Energy sub metering')

lines(df$DateTime, df$Sub_metering_2, col='red')

lines(df$DateTime, df$Sub_metering_3, col='blue')

cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols, bty="n")


# Bottom right
plot(df$DateTime, df$Global_reactive_power,
     xlab='datetime', ylab='Global_reactive_power', type='l')


dev.off()