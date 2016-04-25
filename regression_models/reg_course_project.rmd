Regression Course Project - Motor Trend Analysis
========================================================

## Executive Summary  
This report analyzes data from the 1974 Motor Trend magazine to determine the 
relationship between vehicle attributes and fuel efficiency (MPG). Additionally, 
we aim to drill down on two questions:

*Are automatic or manual transmissions better for MPG?
*What is the quantified difference in MPG between transmission types?

A t-test demonstrates a significant difference in MPG per cars with automatic
vs manual transmissions; this difference being 7.245 MPG more per cars with
manual transmission. This alone does not account for the impact of additional
explanatory variables nor does it account for interaction terms. When fitting
a linear model that account for both we find a difference of 14.079 MPG more
per cars with manual transmission.

## Exploratory Data Analysis  
We use a pair graph (Appendix Fig. 1) to identify all correlations between the
variables in our data set and our dependent variable (MPG). The plot shows
some degree of correlation between most variables and MPG. Without delving into
which variables are confounders, we notice some higher correlations between cyl,
disp, wt, and hp.

Looking more carefully at the relationship between transmission and MPG we plot
a simple scatterplot between these two variables (Appendix Fig. 2). While there
is clearly a relationship between the two the effect on mpg is not so reliant
on transmission to preclude the existence of confounders or additional
explanatory variables.

Delving further, we explore the idea of interaction between weight and
transmission by plotting a scatterplot of mpg by weight per transmission type
(Appendix Fig. 3). This plot yields a much smoother linear relationship between
mpg and the explanatory variables. Furthermore, transmission type is largely
segregated by weight indicating that manual vehicles (am=1) are typically
lighter. 

The above suggests that we will need to account for this interaction term in our
modeling.

## Inference
To determine significance between MPG and the inclusion of automatic vs
manual transmission, we use a t-test with the null hypothesis being that there
is no difference between these two populations.

Setting
```{r}
attach(mtcars)
t <- t.test(mpg~am)
t$p.value
t$estimate[2]-t$estimate[1]
```

We get a p-value of .00137, rejecting the null hypothesis at confidence >99%
and assume a significant difference between the two populations. The difference
between the means of these populations is 7.245, but this in itself does not
tell us the influence of transmission type with other variables taken into
account.

## Regression
Before beginning our modeling we must address categorical variables within our
data set by setting them as factors.

```{r}
mtcars$cyl <- factor(mtcars$cyl)
mtcars$vs <- factor(mtcars$vs)
mtcars$am <- factor(mtcars$am)
mtcars$gear <- factor(mtcars$gear)
mtcars$carb <- factor(mtcars$carb)
```

To isolate the effect of am on mpg we begin by fitting all variables and
evaluating the adjusted r-squared.
```{r}
fit1 <- lm(mpg ~ ., data = mtcars)
summary(fit1)[9] #adj.r.squared
```
This fit gives us an adjusted r-squared of 779 suggesting that the model
explains 77.9% of the variation of the dependent variable mpg. None of the
coefficients, however, achieve significance of 95% confidence as all variables
have a p-value above .05.

Without significant coefficients, we implement backward selection to determine 
which variables to include in our model.
```{r}
fit2 <- step(fit1, k = log(nrow(mtcars)))
summary(fit2)[9]
```
This model keeps transmission, weight, and 1/4 mile time as explanatory
variables, all of which are significant at 95% confidence. Also, the
adjusted r-squared has improved slightly to .834 explaining 83.4% of mpg
variation.

Note, we can still improve our model by incorporating the interaction term that
we unearthed in our exploratory data analysis (Appendix Fig. 3).
```{r}
fit3 <-lm(mpg ~ wt + qsec + am + wt:am, data = mtcars)
summary(fit3)[9]
```
With an adjusted r-squared of .880 we find that the model has improved further
with explained variation of 88% and 95% significance for all coefficients.
Selecting this as a our preferred model, we may interpret the variables we are
interested in as follows:
```{r}
summary(fit3)$coefficients
```
The am1 and wt:am1 coefficients suggest that a manual transmission type adds 
14.079 mpg with an interaction term of -4.141 mpg on average holding weight
and 1/4 mile time constant.

## Residuals
Plotting a series of residual and diagnostic plots (Appendix Fig. 4) we see get
a Residual vs. Fitted plot with a roughly even band around the 0 residual line.
This suggests that variance of the error terms is not correlated with the
fitted values. Also, the randomness of the band supports the linear relationship
of the model (fit3).

## Appendix
Figure 1: Pair Graph 
```{r}
pairs(mtcars, panel = panel.smooth, main = "Motor Trend Car")
```  

Figure 2: Scatterplot MPG by Transmission
```{r}
library(ggplot2)
ggplot(mtcars, aes(x=am, y=mpg)) +
        geom_point() +
        xlab('transmission') +
        ggtitle("MPG by Transmission")
```

Figure 3: Scatterplot MPG by Weight and Transmission
```{r}
ggplot(mtcars, aes(x=wt, y=mpg, group=am, color=am)) +
        geom_point() +
        xlab('weight') +
        ggtitle("MPG by Weight and Transmission")
```

Figure 4: Residual Plot
```{r}
par(mfrow = c(2, 2))
plot(fit3)
```
