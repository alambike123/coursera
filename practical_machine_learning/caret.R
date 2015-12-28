# caret notes
# spam data
library(caret)
library(kernlab)
data(spam)
inTrain <- createDataPartition(y=spam$type,
                              p=0.75, list=FALSE)
training <- spam[inTrain,]
testing <- spam[-inTrain,]
dim(training)

# fit a model
set.seed(32343)
modelFit <- train(type ~.,data=training, method="glm")
modelFit

# final model
modelFit$finalModel

# prediction
predictions <- predict(modelFit,newdata=testing)
predictions

# confusion matrix
confusionMatrix(predictions, testing$type)

# k-fold
set.seed(32323)
folds <- createFolds(y=spam$type,k=10,
                             list=TRUE,returnTrain=TRUE)
sapply(folds,length)

# resampling
set.seed(32323)
folds <- createResample(y=spam$type,times=10,
                             list=TRUE)
sapply(folds,length)

# time slices
set.seed(32323)
tme <- 1:1000
folds <- createTimeSlices(y=tme,initialWindow=20,
                          horizon=10)