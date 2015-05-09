# Code assumes data file household_power_consumption.txt
# is available in subdirectory exdata-data-household_power_consumption
# of the current working directory

hh_pc_col_classes <- c('character', 'character', 
                       'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric')
                       
hh_pc <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", 
                    sep=";", 
                    header=TRUE,
                    na.strings = "?",
                    colClasses = hh_pc_col_classes)

plot4_temp <- hh_pc[ hh_pc['Date'] == "1/2/2007" | hh_pc['Date'] == "2/2/2007",]

DateTime <- strptime(paste(plot4_temp[, 'Date'], 
                           plot4_temp[, 'Time']
                                           ),
                                     "%d/%m/%Y %H:%M:%S")
plot4_data <- cbind(plot4_temp, DateTime)

# Produces the plot directly on a PNG device, without displaying it on the screen.
# That's to work around an issue with LEGEND text being truncated if using dev.copy

png(file="plot4.png")

par(mfrow = c(2, 2))

with(plot4_data, 
  {
    plot( DateTime, Global_active_power,
          type="l",
          col="black",
          ylab="Global Active Power",
          xlab="",
          fg="black")

    plot( DateTime, Voltage,
          type="l",
          col="black",
          ylab="Voltage",
          xlab="datetime",
          fg="black")
    
    
    plot( DateTime, Sub_metering_1
                           ,type="l"
                           ,col="black"
                           ,ylab="Energy sub metering"
                           ,xlab=""
                           ,fg="black"
    )
        
    points( DateTime, Sub_metering_2
                                     ,type="l"
                                     ,col="red"
#                       ,ylab=""
#                       ,xlab=""
#                       ,fg="black"
    )
        
    points( DateTime, Sub_metering_3
                                     ,type="l"
                                     ,col="blue"
#                        ,ylab=""
#                        ,xlab=""
#                        ,fg="black"
    )
    
    legend("topright"
           , lwd = 1
           , col = c("black","red","blue")
           , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
           , bty = "n"
           )
    plot( DateTime, Global_reactive_power,
      type="l",
      col="black",
      ylab="Global_reactive_power",
      xlab="datetime",
      fg="black")

  }
)


dev.off()