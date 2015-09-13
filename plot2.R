************************************
*** Data input and manipulation ****
************************************



setwd("~/R/courseraEDA/Project1")

data <- read.table("power.txt",  	#pre-extracted data for specified dates with grep
	comment.char="#",sep=";",
	stringsAsFactors = FALSE,
	col.names = c("date","time","active","reactive","voltage","intensity","sm1","sm2","sm3"))


	 
data$date <- as.Date(data$date,format="%d/%m/%Y")            #convert date to Date class
dateTime <- paste(data$date,data$time,sep=",")
newDateTime <- strptime(dateTime,format='%Y-%m-%d,%H:%M:%S')	#convert date & time to POSIXlt





*******************************************************************
*** Plot 2  Global Active Power over time *************************
*******************************************************************

png("plot2.png",    				# create PNG for the heat map        
  	width = 480,        			# dimensions in pixels
  	height = 480,
  ) 
plot(newDateTime,data$active, type = "l",	#line graph
	ylab ="Global Active Power (kilowatts)",
	xlab = "",
	)

dev.off()               			# close the PNG device

