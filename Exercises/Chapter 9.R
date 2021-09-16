#* Exercise 9.1 ----
# What is the standard error for our height sampling problem if we ask 100 randomly chosen students?
(4/12) / sqrt(100)


#* Exercise 9.2 ----
# How many samples should I take if I want to σ¯X<0.01, if I am sampling from a population with σ=1?
#   σ¯X = σ / √N
#   0.01 > σ¯X
#   0.01 > 1 / √N
#   √N > 100
#   N > 10000
1 / sqrt(10000); 1 / sqrt(10001)


#* Exercise 9.3 ----
# Do the above results depend on the distribution of the random variables Xj? 
#   No


#* Exercise 9.5 ----
# If we randomly sample 36 data points from a population which has a mean μ=0 and a standard deviation of σ=3.0.
# Estimate the probability that we get a sample mean greater than 7, i.e. P(¯X>7)
n <- 36
m <- 0
my.sd <- 3 / sqrt(n)

1 - pnorm(7, mean = m, sd = my.sd)


#* Exercise 9.6 ----
# Set the population distribution to Normal and sample size to 30.
# Does the sampling distribution look normally distributed when the point estimator used is the:
# + Mean + Median
#   + Mean - Yes
#   + Median - depends on the sample picked.


#* Exercise 9.7 ----
# Use the mean point estimator with samnple size greater than 30.
# Does the sampling distribution look normally distributed when the population is uniform, beta, binomial ?
# What theorem can we use to tell us this?
#   Yes for all 3
#   Central Limit Theorem


#* Exercise 9.8 ----
# What happens to the standard error as the sample size increases for any of these point estimators?
#   sd decreases for all as sample size increasees


#* Exercise 9.9 ----
# The dashed red lines in the sampling distribution plot show the 2.5% and 97.5% quantiles of the sampling distribution.
# How often do we expect that the population parameter (blue line) will fall outside these limits? 
#   P(X <= 2.5%) + P(X >= 97.5%)


#* Exercise 9.10 ----
# The San Antonio Spurs have won 40 of their first 55 games of the NBA season.
# We would like to estimate their winning percentage p giving the probability that they will win any given game using this data.
# Find an interval which should contain the Spurs true winning percentage about 95% of the time
# (Hint: Use the Normal Approximation and the Empirical Rule) 
N <- 55
p_hat <- 40/N # winning percentage
se <- sqrt(p_hat * (1 - p_hat) / 100)
N*p_hat >= 15; N*(1 - p_hat) >= 15
p_hat - 2*se; p_hat + 2*se # using emperical rule - mean +- 2sd


#* Exercise 9.11 ----
# How did poincare convince the police that he had convincing evidence that the baker was selling underweight loaves?
# Hint:
#   Calculate the standard error of his estimation for the mean bread weight.
#   Then use the empirical rule in combo with the central limit theorem. 
n <- NROW(poincare_bread$bread.before)
m <- mean(poincare_bread$bread.before)
se <- sd(poincare_bread$bread.before) / sqrt(n)
# Uisng CLT + Emperical Rule
m - 2*se; m + 2*se # 95%

# se using    https://www.scribbr.com/statistics/standard-error/


#*  Exercise 9.12 ----
# Why did the distribution change?
# What has the baker been doing?
# Hint what would you do in the baker’s shoes…
#   Probably created special loaves which were 1000+


#* 9.8 Homework ----------------------------------------------------------
#** 9.8.0.1 Concept Questions: -------------------------------------------
# Are the following statements true? If so, then why? If not then why not?
#*** 1. ----
# The standard error for a point estimator ^θ is given by σ^θ=σ√N.
#   False. This is for sample distribution of mean only.


#*** 2. ----
#If E[^θ]=θ then we say the point estimator ^θ is unbiased.
# True


#*** 3. ----
# The distribution of the sample mean point estimator ¯X is unbiased and is normally distributed for large enough sample sizes.
#   True


#*** 4. ----
# To calculate the standard error for the sample mean point estimator ¯X we need to know the standard deviation of the population distribution.
#   True(?)


#*** 5. ----
# The point estimator ^θ is a random variable which has a normal distribution.
#   False. Depends on the sample size.


#** 9.8.0.2 Practice Problems: ----
#*** 1. ----
# How many samples are needed to have a standard error of less than 0.1 for the sample mean ¯X estimator if we are sampling from a population with a distribution σ=1.5?
#   se < 0.1
#   1.5 / sqrt(N) < 0.1
#   N > (0.5 / 0.1)^2 = 225


#*** 2. ----
# If we randomly sample 100 data points from a population with standard deviation σ=2.0. If the sample mean of our data set is 36 what is the probability that the next sample we take is:
n <- 100
p_sd <- 2.0
m <- 36
s_sd <- p_sd / sqrt(n)

# Greater than 40?
1 - pnorm(40, m, s_sd)

# Between 32 and 40?
pnorm(40, m, s_sd) - pnorm(32, m, s_sd)

# Greater than 36?
1 - pnorm(36, m, s_sd)


#** 9.8.0.3 Advanced Problems: ----
#*** 1. ----
# Toads:
# You are trying to estimate the girth of Kerrville toads.
# From your many years of experience in the study of toad girths you know that the standard deviation of toad girths is about σ=40mm for normal Texas toads.
# You collect 100 toads from many different ponds, rivers, witches cauldrons, etc around Kerrville.
# This is in the data set toad_girth, using this data set find the following:
head(toad_girth)
n <- NROW(toad_girth)
p_sd <- 40

# What is your estimate for the mean toad girth in Kerrville?
m <- mean(toad_girth$Girths)

# What is the standard error for this estimation?
se <- 40 / sqrt(n)

# How many toads would you have to measure if you wanted to estimate the mean girth of Kerrville toads with a standard error of less than 1mm?
#   se < 1
#   40 / sqrt(N) < 1
#   N > (40)^2 = 1600


#*** 2. ----
# Hogwarts:
# The Hogwarts_heights data set (data(Hogwarts_Heights)) gives the heights of all students and magical creatures at Hogwarts.
# Suppose we would like to estimate the typical height of a life-form at Hogwarts data set by sampling.
head(Hogwarts_Heights)

# Conduct EDA to determine the best measure of central tendency for this data set.
# Justify your answer.
hist(Hogwarts_Heights$Heights, breaks = 20) # median. The data is highly skewed right.

# Using R estimate the standard error of your point estimator for a sample of 50 data points.
NROW(Hogwarts_Heights$Heights)
n <- 50
store.med <- replicate(10000, median(Hogwarts_Heights$Heights, size = n, replace = TRUE))
hist(store.med)
sd(store.med)

# What if we increase the sample to 100 data points?
n <- 100
store.med <- replicate(10000, median(Hogwarts_Heights$Heights, size = n, replace = TRUE))
hist(store.med)
sd(store.med)
#   Result is the same.


#*** 3. ----
# Drug Use:
# The below table gives the data from a survey of 20 and 21 year olds and the percentage of them who admitted to drinking alcohol.
# age 	 n 	  alcohol_use
# 20 	  2271    69.7
# 21    2354    83.2

# The n column gives the size of the survey (number of people asked in each category).
# Given this information estimate the probability of the following events:
# The probability if we repeat the survey we will find the percentage of alcohol in 21 year olds exceeds 69.7?
1 - pnorm(0.697, mean = 0.832, sd = sqrt(0.832 * (1 - 0.832) / 2354))

# The probability that if we repeat the experiment we will find that the percentage of use in 20 year olds exceeds 68?
1 - pnorm(0.68, mean = 0.697, sd = sqrt(0.697 * (1 - 0.697) / 2271))
