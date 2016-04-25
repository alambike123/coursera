##1
# Consider the space shuttle data ?shuttle in the MASS library. 
# Consider modeling the use of the autolander as the outcome (variable name 
# use). Fit a logistic regression model with autoloader (variable auto) use 
# (labeled as "auto" 1) versus not (0) as predicted by wind sign (variable 
# wind). Give the estimated odds ratio for autoloader use comparing head winds, 
# labeled as "head" in the variable headwind (numerator) to tail winds 
# (denominator).

library(MASS)
data(shuttle)

# convert outcome to 0 = noauto, 1 = auto
shuttle$use <- factor(shuttle$use, levels = c("auto", "noauto"), labels = c(1, 0))

fit1 <- glm(use ~ wind - 1, data = shuttle, family = "binomial")
summary(fit)

windhead <- fit1$coef[1]
windtail <- fit1$coef[2]

exp(windtail)/exp(windhead)

##2
# Consider the previous problem. Give the estimated odds ratio for autoloader 
# use comparing head winds (numerator) to tail winds (denominator) adjusting 
# for wind strength from the variable magn.

fit2 <- glm(use ~ wind + magn - 1, data = shuttle, family = "binomial")
summary(fit)

windhead2 <- fit2$coef[1]
windtail2 <- fit2$coef[2]

exp(windtail2)/exp(windhead2)

##3
# If you fit a logistic regression model to a binary variable, for example use 
# of the autolander, then fit a logistic regression model for one minus the 
# outcome (not using the autolander) what happens to the coefficients?

shuttle$auto <- as.numeric(shuttle$use=="auto")
fit <- glm(auto ~ wind,  binomial,  shuttle)
fit3 <- glm(1-auto ~ wind,  binomial, shuttle)
fit$coefficients
fit3$coefficients

##4
# Consider the insect spray data InsectSprays. Fit a Poisson model using spray 
# as a factor level. Report the estimated relative rate comapring spray A 
# (numerator) to spray B (denominator).

data(InsectSprays)
fit <- glm(count ~ spray  - 1, family = "poisson", data = InsectSprays)
exp(fit$coef[1])/exp(fit$coef[2])

##5
# Consider a Poisson glm with an offset, t. So, for example, a model of the
# form glm(count ~ x + offset(t), family = poisson) where x is a factor 
# variable comparing a treatment (1) to a control (0) and t is the natural log
# of a monitoring time. What is impact of the coefficient for x if we fit the 
# model glm(count ~ x + offset(t2), family = poisson) where t2 <- log(10) + t? 
# In other words, what happens to the coefficients if we change the units of the 
# offset variable. (Note, adding log(10) on the log scale is multiplying by 10 
# on the original scale.)

# log(u) = beta0 + beta1*x
# log(u/t) = beta0' + beta1'*x
# log(u) = beta0' + beta1'*x + log(t)

##6
# Using a knot point at 0, fit a linear model that looks like a hockey stick 
# with two lines meeting at x=0. Include an intercept term, x and the knot 
# point term. What is the estimated slope of the line after 0?

x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)
plot(y ~ x)
d1 <- c(0, 0 ,0, 0, 0,  0,  1 , 1,  1 , 1 , 1)
d2 <- c(1, 1 ,1, 1, 1,  1,  0 , 0,  0, 0 , 0) 
# y = c + d1 * x + d2 * x 
summary(lm(y ~ d1*x))