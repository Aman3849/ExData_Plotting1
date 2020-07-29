library(tidyverse)
library(data.table)
library(lubridate)

power_consumption<-fread("household_power_consumption.txt")
power_consumption<-power_consumption %>% mutate(date_time = dmy_hms(paste(Date,Time)),Date = dmy(Date), Time = hms(Time))%>%
    mutate_if(is.character,as.numeric)%>% subset(Date == '2007-02-01' | Date =="2007-02-02")

png("plot1.png", width=480, height=480)

hist(power_consumption$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()