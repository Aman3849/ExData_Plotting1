library(tidyverse)
library(data.table)
library(lubridate)


power_consumption<-fread("household_power_consumption.txt")
power_consumption<-power_consumption %>% mutate(date_time = dmy_hms(paste(Date,Time)),Date = dmy(Date), Time = hms(Time))%>%
    mutate_if(is.character,as.numeric)%>% subset(Date == '2007-02-01' | Date =="2007-02-02")

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
attach(power_consumption)

plot(date_time, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(date_time, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(date_time, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, Sub_metering_2, type="l", col="red")
lines(date_time, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(date_time, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
detach(power_consumption)