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

plot1_data <- hh_pc[ hh_pc['Date'] == "1/2/2007" | hh_pc['Date'] == "2/2/2007",]

hist(plot1_data$Global_active_power, 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red")

dev.copy(png, file="plot1.png")
dev.off()