##1
# Consider the following data with x as the predictor and y as as the outcome.
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
# Give a P-value for the two sided hypothesis test of whether beta1 from a linear 
# regression model is 0 or not.

fit <- lm(y~x); summary(fit)$coefficients

##2
# Consider the previous problem, give the estimate of the residual standard 
# deviation.

summary(fit)$sigma
#or
sqrt(sum(resid(fit)^2/(length(y)-2)))

##3
# In the mtcars data set, fit a linear regression model of weight (predictor) 
# on mpg (outcome). Get a 95% confidence interval for the expected mpg at the
# average weight. What is the lower endpoint?

attach(mtcars)
fit <- lm(mpg ~ wt, mtcars)
newdata <- data.frame(wt = mean(wt))
x <- predict(fit, newdata, interval = ("confidence"))
#or
data(mtcars)
fit <- lm(mpg ~ I(wt - mean(wt)), data = mtcars)
confint(fit)

##4
# Refer to the previous question. Read the help file for mtcars. What is the
# weight coefficient interpreted as?

help(mtcars)

##5
# Consider again the mtcars data set and a linear regression model with mpg as
# predicted by weight (1,000 lbs). A new car is coming weighing 3000 pounds.
# Construct a 95% prediction interval for its mpg. What is the upper endpoint?

fit <- lm(mpg ~ wt, data = mtcars)
newdata <- data.frame(wt = 3)
x <- predict(fit, newdata, interval = ("prediction"))

##6
# Consider again the mtcars data set and a linear regression model with mpg as
# predicted by weight (in 1,000 lbs). A "short" ton is defined as 2,000 lbs.
# Construct a 95% confidence interval for the expected change in mpg per 1 
# short ton increase in weight. Give the lower endpoint.

fit <- lm(mpg ~ I(wt * 0.5), data = mtcars)
confint(fit)[2, ]

##7
# If my X from a linear regression is measured in centimeters and I convert it 
# to meters what would happen to the slope coefficient?

# It would be multiplied by 100.

##8
# I have an outcome, Y, and a predictor, X and fit a linear regression model 
# with Y=betanaught+beta1*X+error to obtain betahatnaught and betahat1. What 
# would be the consequence to the subsequent slope and intercept if I were to 
# refit the model with a new regressor, X+c for some constant, c?

# Y = betanaught+beta1X+e then Y=betanaught???cbeta1+beta1(X+c)+error 
# The new intercept would be betahatnaught - c*betahat1.

##9
# Refer back to the mtcars data set with mpg as an outcome and weight (wt) as 
# the predictor. About what is the ratio of the the sum of the squared errors, 
# when comparing a model with just an intercept (denominator) to 
# the model with the intercept and slope (numerator)?

fit1 <- lm(mpg ~ wt, data = mtcars)
fit2 <- lm(mpg ~ 1, data = mtcars)
1 - summary(fit1)$r.squared

##10
# Do the residuals always have to sum to 0 in linear regression?

# If an intercept is included, then they will sum to 0.
