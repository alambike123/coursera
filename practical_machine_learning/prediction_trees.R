# prediction tree notes
# iris data
library(ggplot2)
library(caret)
data(iris)

inTrain <- createDataPartition(y=iris$Species,
                              p=0.7, list=FALSE)
training <- iris[inTrain,]
testing <- iris[-inTrain,]
dim(training)

# classification tree
modfit <- train(Species~., method='rpart', data=training)
print(modFit$finalModel)

# plot tree
plot(modFit$finalModel, uniform=TRUE, main='Classification Tree')
text(modFit$finalModel, use.n=TRUE, all=TRUE, cex=.8)

# prettier plot
library(rattle)
fancyRpartPlot(modFit$finalModel)

# predict new values
predict(modFit, newdata=testing)