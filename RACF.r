## 目前TSA包已经被删除的归档, 安装指南:　https://blog.csdn.net/sheneddie/article/details/106598601
library(TSA)
Data=read.csv("Data.csv")
eacf(log(Data$purchase),15,40)
eacf(log(Data$redeem),10,10)