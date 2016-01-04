if(!require(installr)) {
        install.packages("installr"); require(installr)} 
updateR()

#1
library(AppliedPredictiveModeling)
library(caret)
data(AlzheimerDisease)

adData = data.frame(diagnosis, predictors)
trainIndex = createDataPartition(diagnosis, p = 0.50, list=FALSE)
training = adData[trainIndex,]
testing = adData[-trainIndex,]

#2
rm(list=ls())
library(AppliedPredictiveModeling)
library(caret)
data(concrete)

set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]
histogram(training$Superplasticizer)

#3
rm(list=ls())
library(caret)
library(AppliedPredictiveModeling)

set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

training2 = training[,grep("^IL", names(training), value=TRUE)]
preProc = preProcess(training2, method='pca', thresh=0.9)
preProc

#4
rm(list=ls())
library(caret)
library(AppliedPredictiveModeling)

set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

training2 = training[,grep("^IL", names(training), value=TRUE)]
training3 = data.frame(training$diagnosis, training2)
lm1 = train(training3$training.diagnosis~., method='glm', data=training3)
confusionMatrix(testing$diagnosis, predict(lm1,testing))
ctrl = trainControl(preProcOptions = list(thresh=0.8))
lm2 = train(training3$training.diagnosis~., method='glm', preProc='pca', data=training3, trControl=ctrl)
confusionMatrix(testing$diagnosis, predict(lm2,testing))