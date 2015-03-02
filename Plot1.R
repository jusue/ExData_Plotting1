#Set directory to that with household_power_consumption.txt
setwd("your own working directory here") 

#Load libraries
library(lubridate)

#Read from source file limiting only 2 days
variable.class<-c(rep('character',2),rep('numeric',7))
ExPlot1<-read.table('household_power_consumption.txt',header=TRUE,
                    sep=';',na.strings='?',colClasses=variable.class)
ExPlot1<-ExPlot1[ExPlot1$Date=='1/2/2007' | ExPlot1$Date=='2/2/2007',]

#Tidy up data
cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
        'SubMetering1','SubMetering2','SubMetering3')
colnames(ExPlot1)<-cols
ExPlot1$DateTime<-dmy(ExPlot1$Date)+hms(ExPlot1$Time)
ExPlot1<-ExPlot1[,c(10,3:9)]

#Creating new directory for plot 1
dir.create('plot 1')

#Plotting 
png(filename='plot 1/plot1.png',width=480,height=480,units='px')
hist(ExPlot1$GlobalActivePower,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')

#Close off graphic device
x<-dev.off()
