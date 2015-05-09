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

plot2_temp <- hh_pc[ hh_pc['Date'] == "1/2/2007" | hh_pc['Date'] == "2/2/2007",]

DateTime <- strptime(paste(plot2_temp[, 'Date'], 
                                           plot2_temp[, 'Time']
                                           ),
                                     "%d/%m/%Y %H:%M:%S")
plot2_data <- cbind(plot2_temp, DateTime)

with(plot2_data, plot( DateTime, Global_active_power,
                       type="l",
                       col="black",
                       ylab="Global Active Power (kilowatts)",
                       xlab="",
                       fg="black")
    )
     
dev.copy(png, file="plot2.png")
dev.off()