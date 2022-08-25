library(xlsx)
library(readxl)

# import newdata from results/Final.xlsx as 'Final'
Final = read_xlsx("data/Final.xlsx","Sheet1")

# transform the data into xts time series
Final$Date = as.Date(as.POSIXct(Final$Date))
Final = xts(Final, order.by = Final$Date)



# To merge the old dataset and new datasets, we need to reset the index of Final
index(Final) = index(dat)

#Merge two datasets
data = merge.xts(dat, Final[,-1], join = "left")

targets <- scan("txt/target.txt", character(), quiet=T)

names(data)[1:220]=colnames(dat)

dat = data