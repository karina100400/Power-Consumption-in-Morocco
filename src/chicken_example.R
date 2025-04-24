library(astsa)
tsplot(chicken)
my.t=time(chicken)
reg1=lm(chicken~my.t)
tsplot(resid(reg1))
acf2(resid(reg1)) #suspect AR(2) for this residual. 


reg2=sarima(chicken,p=2,d=0,q=0,P=0,D=0,Q=0,xreg=my.t)
reg1$coefficients

#reg2: chicken_t = beta_0 + beta_1 t + X_t, X_t \sim ar(2)

tsplot(chicken)
abline(reg1)
lines(reg2$fit)
plot(reg2)
summary(reg2)
