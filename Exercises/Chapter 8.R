#* Exercise 8.1 ----
# Find the mean and variance of the uniform random variable on the interval [−1,1]
#   mean = (c+d)/2 = 0
#   var = (d-c)^2 / 12 = 4/12 = 1/3


#* Exercise 8.2 ----
# Is the uniform random variable symmetric?
#   Yes


#* Exercise 8.3 ----
# What is the median of a uniform distribution on [0,1]? 
#   median = mean = (1+0)/2 = 1/2


#* Exercise 8.4 ----
# For a normal random variable with μ=5.0,σ=1.0 find P(3.0≤N≤7.0) using R.
pnorm(7.0, mean = 5.0, sd = 1.0) - pnorm(3.0, mean = 5.0, sd = 1.0)
#   Note: this is prob of NRV between 2 sd of mean


#* Exercise 8.5 ----
# For a normal random variable with μ=0.0,σ=1.0 find P(−1.0≤N≤1.0).
pnorm(1.0, mean = 0.0, sd = 1.0) - pnorm(-1.0, mean = 0.0, sd = 1.0)
#   Note: this is prob of NRV between 1 sd of mean


#* Exercise 8.6 ----
# For a normal random variable with μ=0.0,σ=2.0 find P(|N|>1.5).
1 - pnorm(1.5, mean = 0.0, sd = 2.0)


#* Exercise 8.7 ----
# Assess the Normality of the Hong-Kong Children Data Set for the weight column.
head(hkhw)
hist(hkhw$Weight.lbs)

IQR(hkhw$Weight.lbs) / sd(hkhw$Weight.lbs)

qqnorm(hkhw$Weight.lbs)
qqline(hkhw$Weight.lbs, col = "red")

#   All test passed. weight follows normal distribution.


#* 8.8 Homework ----------------------------------------------------------
#** 8.8.0.1 Practice Problems: ----
#*** 1. ----
# If U is a uniform random variable in the interval [−2,2] find:
# The probability density function fU(x).
#   1/(2 - -2) = 1/4

# The mean and variance of this distribution.
#   mean = (2 - -2) / 2 = 0
#   var = (2 - -2)^2 / 12 = 4/3

# P(U ≤ 1)
#   value of P outside [-2, 2] is 0
#   so, since lower limit is missing, the limit is set as -2
#   so, P(-2 ≤ U ≤ 2) = (1 - -2) / (2 - -2) = 3/4


#*** 2. ----
# If N is a normal random variable with mean μ=1.0 and standard deviation σ=3.0 find:
m = 1.0
sd = 3.0

# P(−1 ≤ N ≤ 3)
pnorm(3, m, sd) - pnorm(-1, m, sd)

# P(N ≥ 4.0)
1 - pnorm(4, m, sd)
#   since prob at 4 is 0, we can ignore the equality


#*** 3. ----
#For the probability density function plot below shade the area which gives P(()−10<X<5)
#   shade from -10 to 5


#*** 4. ----
# Given the below plot of the cumulative distribution function (CDF) for a continuous distribution estimate the median and IQR for this distribution.
#   Since range from -5 to 10
#   median = 10 - (10 - -5)/2 = 2.5
#   q1 = 2.5 - (2.5 - -5)/2 = -1.25
#   q3 = 2.5 + (2.5 - -5)/2 = 6.25


#** 8.8.0.2 Advanced Problems: ----
#*** 1. ----
# Accessing Normality:
# In this exercise we will be using the data set data(Gambling_HW_Normality)
# It has two columns the first column gives the players name and the second their winnings in a night of gambling at a casino.
# Assess the normality of the Winnings column with both players winnings grouped together.
head(Gambling_HW_Normality)
hist(Gambling_HW_Normality$Winnings)
#   Data is not normal dist, although there seem to be 2 peaks.

IQR(Gambling_HW_Normality$Winnings) / sd(Gambling_HW_Normality$Winnings)
#   1.783 > 1.3


# Split the winnings column into the two individual players and assess the normality of each players winnings individually.
#   only mark
winnings <- Gambling_HW_Normality %>%
  filter(Player == "Mark") %>%
  select(Winnings) %>%
  flatten_dbl()
  # unlist(use.names = FALSE)
  # typeof()

hist(winnings)

IQR(winnings) / sd(winnings)

qqnorm(winnings)
qqline(winnings, col = "red")

#   Mark's winnings are normally dist



#   only Kevin
winnings <- Gambling_HW_Normality %>%
  filter(Player == "Kevin") %>%
  select(Winnings) %>%
  flatten_dbl()

hist(winnings)

IQR(winnings) / sd(winnings)

qqnorm(winnings)
qqline(winnings, col = "red")

#   Kevin's winnings show deviation from normally dist.
