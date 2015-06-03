d <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
dt<-subset(d, d$Date == "1/2/2007"| d$Date == "2/2/2007")
dt1 <- data.frame( datetime=paste(dt$Date,dt$Time,sep=" "), 
			Global_active_power=as.numeric(dt$Global_active_power),
			Global_reactive_power=as.numeric(dt$Global_reactive_power),
			Voltage=as.numeric(dt$Voltage) , 
			Sub_metering_1=as.numeric(dt$Sub_metering_1) , 
			Sub_metering_2=as.numeric(dt$Sub_metering_2), 
			Sub_metering_3=as.numeric(dt$Sub_metering_3), 
			order(dt$Date,dt$Time) )


png(filename = "plot4.png",width = 480, height = 480)

par( mfrow = c( 2, 2 ) )

## Plot1
plot(dt1$order.dt.Date..dt.Time.,dt$Global_active_power,type='l',axes=FALSE,ylab="Global Active Power",xlab="")
axis(1, at=c(1,1441,2881), lab=c("Thu","Fri","Sat"))
axis(2, at=c(0,2,4,6,8,10), lab=c("0","2","4","6","8","10"))
box()

## Plot2
plot(dt1$order.dt.Date..dt.Time.,dt$Voltage,type='l',axes=FALSE,ylab="Voltage",xlab="datetime")
axis(1, at=c(1,1441,2881), lab=c("Thu","Fri","Sat"))
axis(2, at=c(234,238,242,246), lab=c("234","238","242","246"))
box()

## Plot3
plot_colors <- c("black","red","blue")
plot(dt1$order.dt.Date..dt.Time.,dt$Sub_metering_1,type='l',axes=FALSE,ylab="Energy sub metering",xlab="",col=plot_colors[1])
lines(dt1$order.dt.Date..dt.Time.,dt$Sub_metering_2,col=plot_colors[2])
lines(dt1$order.dt.Date..dt.Time.,dt$Sub_metering_3,col=plot_colors[3])
axis(1, at=c(1,1441,2881), lab=c("Thu","Fri","Sat"))
axis(2, at=c(0,10,20,30,40), lab=c("0","10","20","30","40"))
legend(800,40,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=plot_colors,lty=1:3)
box()

## Plot4
plot(dt1$order.dt.Date..dt.Time.,dt$Global_reactive_power,type='l',axes=FALSE,ylab="Global_reactive_power",xlab="datetime")
axis(1, at=c(1,1441,2881), lab=c("Thu","Fri","Sat"))
axis(2, at=c(0.0,0.1,0.2,0.3,0.4,0.5), lab=c("0.0","0.1","0.2","0.3","0.4","0.5"))
box()

dev.off()
