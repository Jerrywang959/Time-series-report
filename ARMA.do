insheet using Data.csv
gen lpurchase=ln(purchase)
gen lredeem=ln(redeem)
tsset date_order



\\AR(1) 模型


arima lpurchase, ar(1) 
estat ic
predict r, res
wntestq r
wntestb r, table

egen ssr=total(abs(r))


\\MA(1) 模型
drop r ssr
arima lpurchase, ma(1)
estat ic
predict r, res
wntestq r
wntestb r, table
egen ssr=total(abs(r))



\\ arma(1,1) 模型
drop r ssr
arima lpurchase, ar(1) ma(1)
estat ic
predict r, res
wntestq r
wntestb r, table
egen ssr=total(abs(r))



\\ arma(1,2) 模型
drop r ssr
arima lpurchase, ar(1) ma(1/2)
estat ic
predict r, res
wntestq r
wntestb r, table

egen ssr=total(abs(r))

\\ arma(2,1) 模型

drop r ssr
arima lpurchase, ar(1/2) ma(1)
estat ic
predict r, res
wntestq r
wntestb r, table

egen ssr=total(abs(r))

\\ arma(2,2) 模型

drop r ssr
arima lpurchase, ar(1/2) ma(1/2)
estat ic
predict r, res
wntestq r
wntestb r, table
egen ssr=total(abs(r))

\\ arma(3,2) 模型

drop r ssr
arima lpurchase, ar(3) ma(2)
estat ic
predict r, res
wntestq r
wntestb r, table

egen ssr=total(abs(r))



//arma(4,8)

drop r ssr
arima lpurchase, ar(1/4) ma(1/8)
estat ic
predict r, res
wntestq r
wntestb r, table
egen ssr=total(abs(r))

//arma(5,8)

drop r ssr
arima lpurchase, ar(1/5) ma(1/8)
estat ic
predict r, res
wntestq r
wntestb r, table
egen ssr=total(abs(r))

//arma(6,8)

drop r ssr
arima lpurchase, ar(1/6) ma(1/8)
estat ic
predict r, res
wntestq r
wntestb r, table
egen ssr=total(abs(r))

//arma(7,8)

drop r ssr
arima lpurchase, ar(1/7) ma(1/8)
estat ic
predict r, res
wntestq r
wntestb r, table
egen ssr=total(abs(r))

//arma(8,8)

drop r ssr
arima lpurchase, ar(1/8) ma(1/8)
estat ic
predict r, res
wntestq r
wntestb r, table
egen ssr=total(abs(r))

//arma(6,14)

drop r ssr
arima lpurchase, ar(1/6) ma(1/14)
estat ic
predict r, res
wntestq r
wntestb r, table
egen ssr=total(abs(r))

//arma(7,14)

drop r ssr
arima lpurchase, ar(1/7) ma(1/14)
estat ic
predict r, res
wntestq r
wntestb r, table
egen ssr=total(abs(r))


//arma(6,15)

drop r ssr
arima lpurchase, ar(1/6) ma(1/15)
estat ic
predict r, res
wntestq r
wntestb r, table
egen ssr=total(abs(r))




\\ arima(1,1,1) 模型

drop r ssr
arima lpurchase, arima(1,1,1)
estat ic
predict r, yresiduals 
wntestq r
wntestb r, table
egen ssr=total(abs(r))


\\ arima(2,1,1) 模型


drop r ssr
arima lpurchase, arima(2,1,1)
estat ic
predict r, yresiduals 
wntestq r
wntestb r, table
egen ssr=total(abs(r))

\\ arima(2,1,2) 模型

drop r ssr
arima lpurchase, arima(2,1,2)
estat ic
predict r, yresiduals 
wntestq r
wntestb r, table
egen ssr=total(abs(r))


\\ arima(3,1,1) 模型

drop r ssr
arima lpurchase, arima(3,1,1)
estat ic
predict r, res
wntestq r
wntestb r, table
egen ssr=total(abs(r))
corrgram r
