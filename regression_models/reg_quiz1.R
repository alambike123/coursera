##1
# Consider the data set and weights given below.
x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)
# Give the value of mu that minimizes the least squares equation.

weighted.mean(x, w)
# or manually
sum(x*w)/sum(w)

##2
# Consider the following data set.
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
# Fit the regression through the origin and get the slope treating y as the 
# outcome and x as the regressor. (Hint, do not center the data since we want 
# regression through the origin, not through the means of the data.)

beta1 <- sum(y*x)/sum(x^2)
  
##3
# Do data(mtcars) from the datasets package and fit the regression model with 
# mpg as the outcome and weight as the predictor. Give the slope coefficient.

summary(lm(mpg ~ wt, data = mtcars))
# or manually
attach(mtcars)
cor(mpg, wt)*sd(mpg)/sd(wt)

##4
# Consider data with an outcome (Y) and a predictor (X). The standard deviation
# of the predictor is one half that of the outcome. The correlation between the
# two variables is .5. What value would the slope coefficient for the regression
# model with Y as the outcome and X as the predictor?

# beta1 = cor(y,x)*sd(y)/sd(x)
# if cor and sd(x)/sd(y) = .5 then beta1 = 1

##5
# Students were given two hard tests and scores were normalized to have 
# empirical mean 0 and variance 1. The correlation between the scores on the 
# two tests was 0.4. What would be the expected score on Quiz 2 for a student 
# who had a normalized score of 1.5 on Quiz 1?

# If normalized to empirical mean 0 and variance 1
# and correlation of .4 a quiz1 score of 1.5 would
# yield a quiz2 score of .6

##6
# Consider the data given by the following.
x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
# What is the value of the measurement if x were normalized (to have mean 0 and
# variance 1)?

print((x - mean(x))/sd(x))[1]

##7
# Consider teh following data set (used above as well). What is the intercept
# for fitting the model with  as the predictor and y as the outcome?
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
fit <- summary(lm(y~x))
coef(fit)[1]
# or manually
beta1 <- cor(y,x)*sd(y)/sd(x)
beta0 <- mean(y) - beta1 * mean(x)
print(beta0)

##8
# You know that both the predictor and response have mean 0. What can be said
# about the intercept when you fit a linear regression?

# beta0 = mean(x) - beta1*mean(y)
# If predictor and response have mean 0 then intercept 0

##9
# Consider the data given by
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
# What value minimizes the sum of squared distnaces between these point and 
# itself?

mean(x)

##10
# Let the slope having fit Y as the outcome and X as the predictor be denoted 
# as beta1. Let the slope from fitting X as the outcome and Y as the predictor 
# be denoted as gamma1. Suppose that you divide beta1 by gamma1; in other words
# consider beta1/gamma1. What is this ratio always equal to?

# Division of slope from fitting outcome Y and predictor X
# over slope from fitting outcome X and predictor Y is
# (cor(y,x)*sd(y)/sd(x))/(cor(x,y)*sd(x)/sd(y)) = var(y)/var(x)
