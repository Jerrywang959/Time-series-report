## 数据来源 https://tianchi.aliyun.com/competition/entrance/231573

## 加载包
using DataFrames,CSV
gr()
## 设置文件路径
data_raw_path="/home/jerrywang/Desktop/user_balance_table.csv"

## 读取CSV文件
raw=CSV.read(data_raw_path)
data=raw[:,[:report_date,:total_purchase_amt,:total_redeem_amt]]

## 时间区间为 20130701 至 20140831
Date=sort(collect(Set(data[:,:report_date])))

## 初始化申购和赎回
purchase=zeros(Int64,length(Date))
redeem=zeros(Int64,length(Date))
for i in 1:length(Date)
    d=Date[i]
    index=findall(x->isequal(x,d) ,data[:,:report_date])
    purchase[i]=sum(data[index,:total_purchase_amt])
    redeem[i]=sum(data[index,:total_redeem_amt])
end

T=1:427

CSV.write("Data.csv",DataFrame([Date purchase redeem]))

