insheet using Data.csv
gen lpurchase=ln(purchase)
gen lredeem=ln(redeem)
tsset date_order

regress D.lpurchase
estat archlm, lags(1)   // 有 ARCH 效应

regress D.redeem
estat archlm, lags(1)  // 有ARCH效应

regress D.lredeem
estat archlm, lags(1)  // 没有ARCH效应


arch D.lpurchase,  arch(1) garch(1)  //Arch 回归

test [ARCH]L1.arch [ARCH]L1.garch    //检验 garch(1,1)效应，结果显示，拒绝系数都为零的原假设，有显著的 garch(1,1)效应