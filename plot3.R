hh_pc_col_classes <- c('character', 'character', 
                       'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric')
                       
hh_pc <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", 
                    sep=";", 
                    header=TRUE,
                    na.strings = "?",
                    colClasses = hh_pc_col_classes)

plot3_temp <- hh_pc[ hh_pc['Date'] == "1/2/2007" | hh_pc['Date'] == "2/2/2007",]

DateTime <- strptime(paste(plot3_temp[, 'Date'], 
                                           plot3_temp[, 'Time']
                                           ),
                                     "%d/%m/%Y %H:%M:%S")
plot3_data <- cbind(plot3_temp, DateTime)

with(plot3_data, 
     
     plot( DateTime, Sub_metering_1
                       ,type="l"
                       ,col="black"
                       ,ylab="Energy Sub Metering"
                       ,xlab=""
                       ,fg="black"
                      ))
with(subset(plot3_data),
     points( DateTime, Sub_metering_2
                      ,type="l"
                      ,col="red"
#                       ,ylab=""
#                       ,xlab=""
#                       ,fg="black"
                      )
     )
with(subset(plot3_data),
     points( DateTime, Sub_metering_3
                       ,type="l"
                       ,col="blue"
#                        ,ylab=""
#                        ,xlab=""
#                        ,fg="black"
                      )
)
legend("topright"
       , lwd = 3
       , col = c("black","red","blue")
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       )
dev.copy(png, file="plot3.png")
dev.off()