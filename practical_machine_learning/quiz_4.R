#1
library(caret)
library(ElemStatLearn)
data(vowel.train)
data(vowel.test) 

vowel.train$y = as.factor(vowel.train$y)
vowel.test$y = as.factor(vowel.test$y)

set.seed(33833)
modFit1 = train(y~., method='rf', data=vowel.train)
modFit2 = train(y~., method='gbm', data=vowel.train)

pred1 = predict(modFit1, vowel.test)
pred2 = predict(modFit2, vowel.test)

confusionMatrix(pred1, vowel.test$y)
confusionMatrix(pred2, vowel.test$y)
confusionMatrix(pred1, pred2)

#2
library(caret)
library(gbm)
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

set.seed(62433)
modFit1 = train(diagnosis~., method='rf', data=training)
modFit2 = train(diagnosis~., method='gbm', data=training)
modFit3 = train(diagnosis~., method='lda', data=training)

pred1 = predict(modFit1, testing)
pred2 = predict(modFit2, testing)
pred3 = predict(modFit3, testing)

predDF = data.frame(pred1, pred2, pred3, diagnosis=testing$diagnosis)
combModFit = train(diagnosis~., method='rf', data=predDF)
combPred = predict(combModFit, predDF)

confusionMatrix(pred1, testing$diagnosis)
confusionMatrix(pred2, testing$diagnosis)
confusionMatrix(pred3, testing$diagnosis)
confusionMatrix(combPred, testing$diagnosis)

#3
set.seed(3523)
library(elasticnet)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

set.seed(233)
modFit1 = train(CompressiveStrength~., method="lasso", data=training)

plot.enet(modFit1$finalModel, xvar="penalty", use.color=T)

#4
library(lubridate)
library(forecast)
dat = read.csv("gaData.csv")
training = dat[year(dat$date) < 2012,]
testing = dat[(year(dat$date)) > 2011,]
tstrain = ts(training$visitsTumblr)

modFit1 = bats(tstrain)
pred = forecast(modFit1, level=95, h=dim(testing)[1])

predComb = cbind(testing, data.frame(pred))
predComb$a = (predComb$Lo.95 < predComb$visitsTumblr) & 
  (predComb$visitsTumblr < predComb$Hi.95)
table(predComb$a)

#5
set.seed(3523)
library(AppliedPredictiveModeling)
library(e1071)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

set.seed(325)
modFit1 = svm(CompressiveStrength~., data=training)
pred = predict(modFit1, testing)
RMSE(pred, testing$CompressiveStrength)