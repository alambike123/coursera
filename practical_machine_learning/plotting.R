# plotting notes
# wage data
library(ISLR)
library(ggplot2)
library(caret)
library(Hmisc)
data(Wage)
summary(Wage)

inTrain <- createDataPartition(y=Wage$wage,
                              p=0.7, list=FALSE)
training <- Wage[inTrain,]
testing <- Wage[-inTrain,]
dim(training); dim(testing)

# feature plot
featurePlot(x=training[,c("age","education","jobclass")],
            y = training$wage,
            plot="pairs")

# qplot + regression smooothers
qq <- qplot(age,wage,colour=education,data=training)
qq +  geom_smooth(method='lm',formula=y~x)

# cut2, making factors
cutWage <- cut2(training$wage, g=3)
table(cutWage)

# boxplots w/ points overlayed
p1 <- qplot(cutWage,age, data=training,fill=cutWage,
      geom=c("boxplot"))
p2 <- qplot(cutWage,age, data=training,fill=cutWage,
      geom=c("boxplot","jitter"))
grid.arrange(p1,p2,ncol=2)

# density plot
qplot(wage,colour=education,data=training,geom="density")