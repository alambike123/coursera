#1
library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)

inTrain = createDataPartition(y=segmentationOriginal$Case,
                               p=0.7, list=FALSE)
training = segmentationOriginal[inTrain,]
testing = segmentationOriginal[-inTrain,]

set.seed(125)
modfit = train(Class~.-Case, method='rpart', data=training)
print(modfit$finalModel)

#3
library(pgmm)
data(olive)
olive = olive[,-1]

modfit2 = train(Area~., method='rpart', data=olive)
newdata = as.data.frame(t(colMeans(olive)))
predict(modfit2, newdata=newdata)

#4
library(ElemStatLearn)
data(SAheart)

set.seed(8484)
train = sample(1:dim(SAheart)[1], size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]

set.seed(13234)
modfit3 = train(chd~age+alcohol+obesity+tobacco+typea+ldl,
                 method='glm',
                 data=trainSA)

missClass = function(values,prediction){sum(((prediction > 0.5)*1) != values)/length(values)}
predTrain = predict(modfit3, trainSA)
missClass(trainSA$chd, predTrain)
predTest = predict(modfit3, testSA)
missClass(testSA$chd, predTest)

#5
library(ElemStatLearn)
data(vowel.train)
data(vowel.test)

vowel.train$y = as.factor(vowel.train$y)
vowel.test$y = as.factor(vowel.test$y)

set.seed(33833)
modfit4 = train(y~., method='rf', data=vowel.train)
varImp(modfit4)

