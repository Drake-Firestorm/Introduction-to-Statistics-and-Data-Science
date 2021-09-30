#*** Exercise 11.1 ----
# Does a unique line exist which goes through all of our data points? 
# If you fit a line to the data points what are you attempting to minimize?
#   Yes
#   Variance in time for a particular distance


#*** Exercise 11.2 ----
# What do you expect the slope β to be if the explanatory variable (distance) and the response variable (flight time) are completely unrelated?
#   0


#*** Exercise 11.3 ----
# What is your intuition for sign (positive/negative) for β in the flight data set?
#  Extra: What physical quantity does our β correspond to?
#     Positive
#     Speed inverse


#*** Exercise 11.4 ----
# Lets get some practice fitting a linear model in R. Load the alligator data set, from the HannayAppliedStats package. 
# Fit a linear model to this data in R with the weight as the response variable and the snout vent length as the explanatory variable.
head(alligator)
plot(alligator$lnLength, alligator$lnWeight,
     xlab = "Snout Vent Length", ylab = "Weight", main = "Alligator Weight")

lmo <- lm(lnWeight ~ lnLength, data = alligator)
summary(lmo)

# + What does the slope tell you for this model? 
#   As snout length increases by 1, weight increases by 3.4

# + What is a 95% confidence interval for the slope? 
confint(lmo, level = 0.99)


#*** Exercise 11.5 ----
# Run these diagnostics on our model for flying times based on distance used in the first section of the notes. 
# Are any of the assumptions of linear regression significantly violated? 
diagRegressionPlots(res.flying)
#   Unequal variance in residuals


#*** Exercise 11.6 ----
# Run these diagnostics on the model we formed for house prices. 
# Are any of the assumptions of linear regression significantly violated? 
diagRegressionPlots(res.house)
#   Non-normality in noise


#* 11.6 Homework ---------------------------------------------------------
#** 11.6.0.1 Concept Questions: ----
# Are the following statements True or False?:
#*** 1. ----
# When conducting linear regression we assume that the error terms are independent
#   True

#*** 2. ----
# The R2 term measures the goodness of fit for a linear model
#   True

#*** 3. ----
# Linear models with a small R2 term should be discarded in all applications as they are poor predictive models.
#   False

#*** 4. ----
# An assumption of linear regression analysis is that the error terms have equal variance.
#   True

#*** 5. ----
# The least squares solution finds the minimum of the sum of the residuals squared.
#   True

#*** 6. ----
# The standard error of the residuals gives a measure of the predictive power of a regression model.
#   True

#*** 7. ----
# It is safe to form prediction intervals for any value of the explanatory variable we want
#   False

#*** 8. ----
# The width of the prediction interval will decrease if the standard error of the residuals for a model decreases.
#   True


#** 11.6.0.2 Practice Problems: ----
#*** 1. ----
# If we fit a linear model for the effect of a pesticide dosage (gallons sprayed) on the yield of tomatoes (pounds) on our field and find the best fit slope is β=1.2 and a 99% confidence interval for the slope is given by (0.75,1.25) what can we say about the effect of spraying an additional gallon of pesticide on our field on our crop yield?
#   For each additional gallon of pesticide crop yield increases by around 1.


#*** 2. ----
# We have collected a data set on the amount of hours studying versus the grade on a final exam for 300 students. 
# We find this plot has a slope a best fit slope of 5.0 with a 95% confidence interval of (3.0,6.0). 
# What can we conclude about the effects of studying for one additional hour? 
# Do you expect this model to have a high R2 value?
#   Grade increases between 3 and 6.
#   No


#** 11.6.0.3 Advanced Problems: ----
# For each of these data sets conduct a full regression analysis including an exploratory scatter plot, fit a linear model, form confidence intervals for the parameters and perform diagnostics to determine if the assumptions of linear regression are satisfied.
#*** 1. ----
# Load the cricket_chirps data set. 
# Conduct a linear regression using the temperature as the explanatory variable and the chirps per second as the response variable.
head(cricket_chirps)
plot(cricket_chirps$temp.fahrenheit, cricket_chirps$chirps.sec,
     xlab = "Temperature (F)", ylab = "Chirps per second", main = "Cricket Chirps per second")

lmo <- lm(chirps.sec ~ temp.fahrenheit, data = cricket_chirps)
summary(lmo)

confint(lmo)

plot(cricket_chirps$temp.fahrenheit, cricket_chirps$chirps.sec,
     xlab = "Temperature (F)", ylab = "Chirps per second", main = "Cricket Chirps per second")
abline(lmo, col = "blue")

diagRegressionPlots(lmo)
# Errors are not independent.


#*** 2. ----
# Load the kidiq data set. 
# Conduct a linear regression analysis to see how well the mom’s IQ (mom_iq) relates to the kid_score) column giving the child’s IQ score. 
# What can you conclude about the genetic components of intelligence?
head(kidiq)

plot(kidiq$mom_iq, kidiq$kid_score,
     xlab = "Mom's IQ", ylab = "Kid's IQ", main = "Kid's IQ Score")

lmo <- lm(kid_score ~ mom_iq, data =kidiq)
summary(lmo)

confint(lmo)

plot(kidiq$mom_iq, kidiq$kid_score,
     xlab = "Mom's IQ", ylab = "Kid's IQ", main = "Kid's IQ Score")
abline(lmo, col = "blue")

diagRegressionPlots(lmo)
# Unequal variance in the residuals


#*** 3. ----
# Load the NBA_Draft_Data data set. 
# Perform a linear regression analysis with the Pick.Number column as the explanatory variable and the PTS column as the response variable.
head(NBA_Draft_Data)

plot(NBA_Draft_Data$Pick.Number, NBA_Draft_Data$PTS,
     xlab = "Draft Pick", ylab = "points", main = "NBA Points Scored")

lmo <- lm(PTS ~ Pick.Number, data = NBA_Draft_Data)
summary(lmo)

plot(NBA_Draft_Data$Pick.Number, NBA_Draft_Data$PTS,
     xlab = "Draft Pick", ylab = "points", main = "NBA Points Scored")
abline(lmo, col = "blue")

diagRegressionPlots(lmo)
# Unequal residual variance


# + Form a 99% confidence interval for the slope. What does this tell you about the value of an NBA draft pick?
confint(lmo, level = 0.99)
#   Players picked later score less


# + About how many more points does the number one pick average than the 10th pick?
lmp <- predict(lmo, data.frame(Pick.Number = c(1, 2, 10)), interval = "predict", level = 0.95)
lmp[1] - lmp[3]


# + Form a prediction interval for the PPG average of the number 2 pick in the draft
lmp[2]


#*** 4. ----
# Load the seaice_dec_northern data set. 
# Conduct a linear regression analysis of this data set using the year as the explanatory variable and the extent column as the response variable. 
# Check the assumptions of linear regression using diagnostic plots, are any of the conditions violated?
head(seaice_dec_northern)

plot(seaice_dec_northern$year, seaice_dec_northern$extent,
     xlab = "Year", ylab = "Extent", main = "Annual Extent of Sea Ice Decrease in December")

lmo <- lm(extent ~ year, data = seaice_dec_northern)
summary(lmo)

confint(lmo)

plot(seaice_dec_northern$year, seaice_dec_northern$extent,
     xlab = "Year", ylab = "Extent", main = "Annual Extent of Sea Ice Decrease in December")
abline(lmo, col = "blue")

diagRegressionPlots(lmo)
# Residuals not independent.


#*** 5. ----
# Load the StudentsPerformance data set. 
# Conduct a linear regression analysis on this with the Math.Score column as the explanatory variable and Writing.Score as the response variable. 
# Form a confidence interval for the slope parameter and interpret the meaning of this interval.
head(StudentsPerformance)

plot(StudentsPerformance$Math.Score, StudentsPerformance$Writing.Score,
     xlab = "Math Score", ylab = "Writing Score", main = "Math v/s Writing Score")

lmo <- lm(Writing.Score ~ Math.Score, data = StudentsPerformance)
summary(lmo)

confint(lmo)
# ws increase between 0.77 - 0.84 for each point increase in ms

plot(StudentsPerformance$Math.Score, StudentsPerformance$Writing.Score,
     xlab = "Math Score", ylab = "Writing Score", main = "Math v/s Writing Score")
abline(lmo, col = "blue")

diagRegressionPlots(lmo)


#*** 6. ----
# Exponential Models: Load the census.us.pop data set. 
# This data contains the census population of the united states every ten years from 1790 to 2010. 
# Make a scatter plot of the Year column versus the Population column. 
# You should notice that the population grows roughly exponentially with the year. 
# Therefore, we could try and fit a exponential model to this data: 
#   P = α * e**(β*t)
# where t is the number of years since 1790 and P in the united states population. 
# You might notice that this is not a linear model. 
# However, we can turn this exponential model into a linear one by taking the logarithm of both sides. 
# This gives 
#   log(P) = log(α) + βt
# Make two variables (x,y) to store the tranformed variables:
logpop = log(census.us.pop$Population)
t = census.us.pop$Year - 1790

# Now perform a linear regression to estimate β and log(α). 
# Perform some diagnostics on your regression. 
# Are the assumptions of linear regression satisfied for our transformed data set?
head(census.us.pop)

plot(census.us.pop$Year, census.us.pop$Population,
     xlab = "Year", ylab = "Population", main = "Annual Population Trend")

logpop <- log(census.us.pop$Population)
t <- census.us.pop$Year - 1790

plot(t, logpop, xlab = "Years since 1790", ylab = "Population (log)", main = "Annual Population Trend")

lmo <- lm(logpop ~ t)
summary(lmo)

confint(lmo)

diagRegressionPlots(lmo)
# Non linear relationship.
# Non-normality in noise
