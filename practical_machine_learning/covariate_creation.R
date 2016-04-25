# covariate creation notes
# spam data
library(kernlab)
data(spam)
spam$capitalAveSq <- spam$capitalAve^2

# wage data
library(ISLR)
library(caret)data(Wage);
inTrain <- createDataPartition(y=Wage$wage,
                              p=0.7, list=FALSE)
training <- Wage[inTrain,]; testing <- Wage[-inTrain,]

# dummy variables
dummies <- dummyVars(wage ~ jobclass,data=training)
head(predict(dummies,newdata=training))

# removing zero covariates
nsv <- nearZeroVar(training,saveMetrics=TRUE)

# spline basis
library(splines)
bsBasis <- bs(training$age,df=3) 

# fit curves with splines
lm1 <- lm(wage ~ bsBasis,data=training)
plot(training$age,training$wage,pch=19,cex=0.5)
points(training$age,predict(lm1,newdata=training),col="red",pch=19,cex=0.5)

# splines on test set 
predict(bsBasis, age=testing$age)

