************************************
*** Data input and manipulation ****
************************************



setwd("~/R/courseraEDA/Project1")
data <- read.table("power.txt",  	#pre-extracted data for specified dates with grep on Unix
	comment.char="#",sep=";",
	stringsAsFactors = FALSE,
	col.names = c("date","time","active","reactive","voltage","intensity","sm1","sm2","sm3"))

	 
data$date <- as.Date(data$date,format="%d/%m/%Y")            #convert date to Date class
dateTime <- paste(data$date,data$time,sep=",")
newDateTime <- strptime(dateTime,format='%Y-%m-%d,%H:%M:%S')	#convert date & time to POSIXlt




************************************
*** Plot 4 *************************
************************************

png("C:plot4.png",    				# create PNG for the heat map        
  	width = 480,        			# dimensions in pixels
  	height = 480,
  ) 
par(mfcol=c(2,2))
plot(newDateTime,data$active, type = "l",	#line graph
	ylab ="Global Active Power (kilowatts)",
	xlab = "",
	cex.lab=0.8,cex.axis=0.8)

plot(newDateTime,data$sm1, type = "l",		#submetering line graph sm1
	ylab ="Energy sub metering",xlab= "", #label axes
	cex.lab=0.8,cex.axis=0.8)
lines(newDateTime,data$sm2, type = "l",		#red line graph sm2
	col="red")
lines(newDateTime,data$sm3, type = "l",		#blue line graph sm3
	col="blue")
legendTxt <- c("sub_metering_1","sub_metering_2","sub_metering_3")
legend("topright",legendTxt,col = c("black", "red", "blue"),lty=1,cex=0.6)

plot(newDateTime,data$voltage, type = "l",	#Voltage line graph
	xlab = "datetime",
	ylab="Voltage",
	cex.lab=0.8,cex.axis=0.8)

plot(newDateTime,data$reactive, type = "l",	#reactive power line graph
	xlab = "datetime",
	ylab="Voltage",
	cex.lab=0.8,cex.axis=0.8)

dev.off()               			# close the PNG device
