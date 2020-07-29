library(tidyverse)
library(data.table)
library(lubridate)

power_consumption<-fread("household_power_consumption.txt")
power_consumption<-power_consumption %>% mutate(date_time = dmy_hms(paste(Date,Time)),Date = dmy(Date), Time = hms(Time))%>%
    mutate_if(is.character,as.numeric)%>% subset(Date == '2007-02-01' | Date =="2007-02-02")

png("plot3.png", width=480, height=480)

with(power_consumption, plot(date_time,Sub_metering_1,type ="l",xlab="",ylab="Energy sub metering"))
with(power_consumption, lines(date_time,Sub_metering_2,type ="l", col = "red"))
with(power_consumption, lines(date_time,Sub_metering_3,type ="l", col = "blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()