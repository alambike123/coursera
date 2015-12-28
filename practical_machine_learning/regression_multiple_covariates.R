# predicting regression with multiple covariates
# wage data
library(ISLR)
library(ggplot2)
library(caret)
data(Wage)
Wage <- subset(Wage,select=-c(logwage))
summary(Wage)

inTrain <- createDataPartition(y=Wage$wage,
                              p=0.7, list=FALSE)
training <- Wage[inTrain,]; testing <- Wage[-inTrain,]

# feature plot
featurePlot(x=training[,c("age","education","jobclass")],
            y = training$wage,
            plot="pairs")

# exploratory plots
qplot(age,wage,data=training)
qplot(age,wage,colour=jobclass,data=training)
qplot(age,wage,colour=education,data=training)

# fit linear model
modFit<- train(wage ~ age + jobclass + education,
               method = "lm",data=training)
finMod <- modFit$finalModel
print(modFit)

# diagnostic plots
plot(finMod,1,pch=19,cex=0.5,col="#00000010")

# color by variables not used in model
qplot(finMod$fitted,finMod$residuals,colour=race,data=training)

# plot by index
plot(finMod$residuals,pch=19)

# predicted vs truth in test select
pred <- predict(modFit, testing)
qplot(wage,pred,colour=year,data=testing)

# use all covariates
modFitAll<- train(wage ~ .,data=training,method="lm")
pred <- predict(modFitAll, testing)
qplot(wage,pred,data=testing)

