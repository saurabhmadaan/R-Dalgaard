library(ISwR)

attach(thuesen)

plot(short.velocity,blood.glucose)


lm(short.velocity~blood.glucose)

ggplot(thuesen,aes(y=short.velocity,x=blood.glucose))+
  geom_point()+
  geom_smooth(method='lm',se=FALSE)



lm.velo<-lm(short.velocity~blood.glucose)

summary(lm.velo)
residuals(lm.velo)
fitted(lm.velo)

plot(blood.glucose,short.velocity)
lines(blood.glucose[!is.na(short.velocity)],fitted(lm.velo))


# --- or, better
cc<-complete.cases(thuesen)
attach(thuesen[cc,])

options(na.action=na.exclude)
lm.velo<-lm(short.velocity~blood.glucose)

fitted(lm.velo)

segments(blood.glucose,fitted(lm.velo),blood.glucose,short.velocity)




