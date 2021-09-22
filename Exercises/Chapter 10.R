#* Exercise 10.1 ----
# Find the 99% Confidence Interval of the sample mean departure delays using bootstrapping
quantile(many.studies, c(0.005, 0.995))


#* Exercise 10.2 ----
# Find the 95% Confidence Interval for the sample variance of the departure delays using bootstrapping
many_variance_studies <- replicate(10000, sd(sample(flightNYC$dep_delay, 5000, replace=TRUE))^2) 
quantile(many_variance_studies, c(0.025, 0.975))


#* questions ----
# To learn more about how to interpret confidence intervals open the app “ConfidenceIntervals” by running the command:
#** 1. ----
# The red lines show the confidence intervals which do not contain the actual population mean.
# How does the number of these misses change as you adjust the confidence level?
# Can you see a connection between the confidence level and the expected number of errors?
#   As the confidence interval decreases (i.e. 99 to 80), number of errors increases.


#** 2. ----
# How does changing the sample size effect the number of errors made (misses)?
#   No impact from sample sizes.


#** 3. ----
# How does the width (length) of the intervals change as the sample size increases?
#   width reduces as sample size increases.


#** 4. ----
# How does the width(length) of the confidence intervals change as the confidence level increases?
#   width increase as condidence level increases (i.e. 80 to 99)


#* Exercise 10.3 ----
# Back to the flight delays example if we increased our sample size in the original experiment to 10000 flights what would you expect to happen to to the width of our 95% confidence interval? 
#   width should reduce
many.studies <- replicate(10000, mean(sample(flightNYC$dep_delay, 10000, replace=TRUE)))

hist(many.studies, col='coral', xlab='Flight Delays in Minutes', main='Histogram of Possible Mean Flight Delays NYC')

quantile(many.studies, c(0.025, 0.975))


#* Exercise 10.4 ----
# Use the t.test command to find the 90% confidence interval for the mean flight departure delay. 
t.test(flightNYC$dep_delay, conf.level = 0.9)


#* Exercise 10.5 ----
# How would you form confidence intervals for the mean flight delay if you only had measurements for 15 flights?
# Which approach is justified?
#   Yes bootstrapping, because we do not know the distribution of the population.



#* 10.7 Homework ---------------------------------------------------------
#** 10.7.0.1 Concept Questions: ----
# Are the following statements true? If so, then why? If not then why not?
#*** 1. ----
# We expect the 95% Confidence Interval to be larger than the 99% Confidence Interval
#   False. 99% will include more values so longer interval.


#*** 2. ----
# We can use the student t distribution to estimate the confidence interval for the sample median.
#   False. It works only with mean.


#*** 3. ----
# For large samples N>30 the student t distribution can be used to find the population mean Confidence Intervals for any underlying population distribution.
#   True


#*** 4. ----
# As the sample size increases we expect the width of the confidence intervals to decrease.
#   True


#*** 5. ----
# To form reliable confidence intervals for the population proportion p we need a data set which has at least 5 successful trials and at least 5 failed trials.
#   True


#*** 6. ----
# If we repeat an experiment we should expect the confidence interval will change if we use the new data.
#   True


#*** 7. ----
# If we double the sample size from n = 50 to n = 100, the length of the confidence interval for the population mean is reduced by half.
#   False. Length is a function of sqrt(N) and not N.


#*** 8. ----
# If zero lies inside the 95% confidence interval for μ, then zero is also inside the 99% confidence interval for μ.
#   True


#** 10.7.0.2 Practice Problems: ----
#*** 1. ----
# For the flightNYC data set used in class form a 90% confidence interval for the population mean of the departure delays.
t.test(flightNYC$dep_delay, conf.level = 0.9)


#*** 2. ----
# For the flight data set again form a 95% confidence interval for the population median of the arrival delays using bootstrapping.
sample_median <- replicate(10^4, median(sample(flightNYC$arr_delay, 50, replace = TRUE)))
quantile(sample_median, c(0.025, 0.975))


#*** 3. ----
# Suppose a drug company is conducting a drug trial with 68 participants.
# If 11 of the subjects experienced extreme side-effects give a 99% confidence interval for the proportion of the general population who will experience extreme side-effects.
prop.test(11, 68, conf.level = 0.99)


#*** 4. ----
# A consumer group surveys 195 people who recently bought new kitchen appliances.
# Fifteen percent of them expressed dissatisfaction with the salesperson.
# Find a 95% confidence interval for the percentage of disatisfied customers.
prop.test(0.15*195, 195, conf.level = 0.95)


#*** 5. ----
# Load the Titanic data set in R using the command data(Titanic).
# Then run the command Titanic=data.frame(Titanic).
# Now form a confidence interval for the proportion of passengers who survived the wreck.
data("Titanic")
Titanic <- data.frame(Titanic)
head(Titanic)

prop.test(sum(Titanic$Survived == "Yes"), nrow(Titanic))


#*** 6. ----
# You have fallen on hard times and are working for a carnival.
# Your boss has never had a formal statistics course and is designing a new ride for the park.
# The ride will have to have a height restriction where the riders have to be taller than X feet and shorter than Y feet to ride.
# His goal is to design the ride so at least 95% of the people who enter the carnival can ride it.
# He takes a sample of 134 people who enter the park and finds and average of 5.41 ft with a standard deviation of s=0.2ft.
# He asks you to find a 95% confidence interval for the mean heights of people in the park?
#   What is the confidence interval?
#   Is a confidence interval of use in this scenario?
n <- 134
m <- 5.41
s <- 0.2
t.test.hand(m, s, n)

#   No. This is the CI of mean height and not 95% interval of all heights.


#*** 7. ----
# If I shoot 27 free-throws and make 15 find a 95% confidence interval for my free throw percentage.
# Why is this justified or not justified in this case?
prop.test(15, 27)
#   Not justified since the sample < 30


#** 10.7.0.3 Advanced Problems: ----
#*** 1. ----
# More Toads:
# You are trying to estimate the girth of Kerrville toads.
# You collect 100 toads from many different ponds, rivers, witches cauldrons, etc around Kerrville.
# This is in the data set toad_girth. Using this data set find the following:
#   What is your estimate for the mean toad girth in Kerrville?
#   What is the standard error for this estimation?
#   Form a 95% confidence interval for the mean toad girth in Kerrville.
#   Form a 95% confidence interval for the population standard deviation of toad girths
mean(toad_girth$Girths)
sd(toad_girth$Girths)
t.test(toad_girth$Girths)

sample_sd <- replicate(10^4, sd(sample(toad_girth$Girths, 50, replace = TRUE)))
quantile(sample_sd, c(0.025, 0.975))


#*** 2. ----
# Roger Maris Again:
# In 1961 Roger Maris broke Babe Ruth’s home run record with 61 home runs.
# Rather than adoration Maris was despised by much of the public because he was deemed unworthy of dethroning the great Babe Ruth as the home run king.
# This was largely because Maris never hit more than 40 home-runs in a season except his record breaking season.
# We can estimate Roger Maris’s probability of hitting a home run in any given game as p=0.187 by taking his 275 career home runs and dividing by his 1463 career games.
#   What is the standard error in our estimation of ^p=0.187 given above?
#   Form a 95% Confidence interval for the probability that Maris hits a home run in a given game given this data.
#   Is this statistic valid? How could you critique this statistic?
n <- 1463
t <- 275
p <- t / n

se <- sqrt(p * (1 - p) / n)

prop.test(t, n)

#   valid statistic, since no. of success > 5 and no. of failuer > 5 + all games are random


#*** 3. ----
# Lebron James:
# For this question we will be using the data set Lebron_James_2016 data set.
# This gives the statistics for Lebron James during every game of the 2016-2017 NBA regular season.
# This question will involve doing some processing of the data, to remove missing values.
#   Find 95% Confidence Interval for Lebron’s mean points per game.
#   Find a 99% Confidence Interval for Lebron’s median points per game.
# Here are some hints on processing this data to remove the missing values (NA).
data(Lebron_James_2016)
PTS<-as.numeric(Lebron_James_2016$PTS) ##tells R that the PTS column should be treated as numbers
PTS<-na.omit(PTS) ##tells R to drop any values which are missing from the vector PTS

t.test(PTS)

sample_median <- replicate(10^4, median(sample(PTS, 50, replace = TRUE)))
quantile(sample_median, c(0.005, 0.995))


#*** 4. ----
# Drug Use Again:
# Form a confidence interval for the following statistics in the drug_use data set, found in the fivethirtyeight R package.
#   Find a 99% confidence interval for the proportion of 20 year olds who have used alcohol
#   Find a 95% confidence interval for the proportion of 21 year olds who have used alcohol
library(fivethirtyeight)
data("drug_use")

perc <- drug_use %>% filter(age %in% c("20", "21")) %>% select(alcohol_use) %>% purrr::flatten_dbl()
n <- drug_use %>% filter(age %in% c("20", "21")) %>% select(n) %>% purrr::flatten_dbl()

prop.test(perc[1] / 100 * n[1], n[1], conf.level = 0.99)
prop.test(perc[2] / 100 * n[2], n[2], conf.level = 0.95)
