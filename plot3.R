plot3 <- function(){
  
  ## Read the raw data set
  
  initialdataset <- read.table("household_power_consumption.txt",sep=";",header=T,na.strings=c("?"),colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  
  
  ## Change the format of the Time column
  
  initialdataset$Time <- strptime(paste(initialdataset$Date,initialdataset$Time),"%d/%m/%Y %H:%M:%S")
  
  
  ## Change the format of the Date column
  
  initialdataset$Date <- as.Date(initialdataset$Date, "%d/%m/%Y")
  
  
  ## Extract data with date 2007-02-01 y 2007-02-02
  
  dataset1 <- initialdataset[initialdataset$Date=="2007-02-01",]
  dataset2 <- initialdataset[initialdataset$Date=="2007-02-02",]
  dataset <- rbind(dataset1,dataset2)
  
  
  ## Create the plot in the png file
  
  png(file="plot3.png",width=480,height=480)
  Sys.setlocale("LC_TIME", "English")
  plot(dataset$Time,dataset$Sub_metering_1, xlab="",ylab="Energy sub metering", type="n")
  lines(dataset$Time,dataset$Sub_metering_1,col="black",xlab="",ylab="",pch=46,type="o")
  lines(dataset$Time,dataset$Sub_metering_2,col="red",xlab="",ylab="",pch=46,type="o")
  lines(dataset$Time,dataset$Sub_metering_3,col="blue",xlab="",ylab="",pch=46,type="o")
  legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
  
}

