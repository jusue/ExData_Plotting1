#Set directory to that with household_power_consumption.txt
#setwd("your own working directory here") 

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

#Creating new directory for plot 3
dir.create('plot 3')

png(filename='plot 3/plot3.png',width=480,height=480,units='px')

lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(ExPlot1$DateTime,ExPlot1$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(ExPlot1$DateTime,ExPlot1$SubMetering2,col=lncol[2])
lines(ExPlot1$DateTime,ExPlot1$SubMetering3,col=lncol[3])

legend('topright',legend=lbls,col=lncol,lty='solid')

# Close off graphic device
x<-dev.off()