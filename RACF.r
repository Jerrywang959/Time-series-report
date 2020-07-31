## 目前TSA包已经被删除的归档, 安装指南:　https://blog.csdn.net/sheneddie/article/details/106598601
library(TSA)
library( forecast)
Data=read.csv("Data.csv")
eacf(diff(log(Data$purchase)),15,28)
eacf(log(Data$redeem),15,28)
eacf(diff(log(Data$redeem)),15,28)

auto.arima(log(Data$redeem))
auto.arima(log(Data$purchase))