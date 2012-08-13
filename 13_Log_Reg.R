# --- form data table
no.yes<- c('No','Yes')
smoking<-gl(2,1,8,no.yes)
obesity<-gl(2,2,8,no.yes)
snoring<-gl(2,4,8,no.yes)
n.tot<-c(60,17,8,2,187,85,51,23)
n.hyp<-c(5,2,1,0,35,13,15,8)

df<-data.frame(smoking,obesity,snoring,n.tot,n.hyp)
#---------

df$hlt<-(df$n.tot-df$n.hyp)/(df$n.tot)
df$hyp<-(df$n.hyp)/(df$n.tot)
attach(df)

#--- Plot logistic regression
glm(hyp~smoking+obesity+snoring,binomial,weights=n.tot)
glm.fit<-glm(hyp~smoking+obesity+snoring,binomial,weights=n.tot)


#--- smoking z value indicates it is not significant param, remove it
glm(hyp~obesity+snoring,binomial,weights=n.tot)
glm.fit<-glm(hyp~obesity+snoring,binomial,weights=n.tot)



anova(glm.fit,test="Chisq") #Deviance for variable = SSW, and Residual .Dev = SSB
  






