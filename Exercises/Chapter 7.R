#* Exercise 7.1 ----
# If X is a random variable which describes the number of rolls of a six-sided dice before the first six is rolled.
# Find the probability distribution of this random variable.
#   X = 6 can land anytime starting from the first roll onwards.
#     = {1, 2, 3, ...}
#   P(X = 1) = 1/6
#   P(X = 2) = 5/6 * 1/6
#   P(X = 3) = 5/6 * 5/6 * 1/6
#   P(X = n) = (5/6)^(n-1) * 1/6

X <- seq(1, 20, 1)
p_X <- rep(NA, length(X))
for(i in X){
  p_X[i] <- (5/6)^(i-1) * 1/6
}
barplot(p_X ~ X, yaxt = "n", # yaxp = c(0, 0.2, 20),
        xlab = "Number of Rolls until First 6", ylab = "Probability", main = "Dice Roll until First 6")
axis(side = 2, at = seq(0, 0.17, 0.01))


#* Exercise 7.2 ----
# Greg is trying to decide whether to live on campus for next semester.
# He estimates it will cost 3 dollars a day for gas, but he has to travel through the Center Point speed trap on his commute to class.
# From experience he knows that about 3% of the time he forgets to slow down when traveling through Center point and gets a $300 speeding ticket.
# What is the true cost of his daily commute when living off campus?
#   Let X be random variable describing commute cost
#   P(X = 303)  = 3%
#   P(X = 3)    = 97%
#   E[X] = 3*97% + 303*3% = 12


#* Exercise 7.3 ----
# You are offered the chance to enter a raffle by purchasing a $2 dollar ticket and the prize is a $2000 jet-ski.
# 500 tickets will be sold.
# What is your expected return on purchasing a ticket in this raffle?
#   Let X be return on ticket
#   P(X = -2) = 499/500
#   P(X = 2000) = 1/500
#   E[X] = -2*499/500 + 2000*1/500 = 2.004


#* Exercise 7.4 ----
# If X is the random variable which gives the number of heads produced when we flip a coin 100 times, find E[X]
#   X = number of heads at flip n = any number between 0 and n
#   P(X) = 1/2 since each flip is an independent event
#   E[X = 100] = 100 * 1/2 = 50
#   alternate
#   E[X = n] = (1*nC1 + 2*nC2 + ... + n*nCn)/2^n = [n∑k=1](i * nCi / 2^n)
E <- 0
n <- 100
for (i in 1:n) {
  E <- E + (i * choose(n,i)/2^n)
}


#* Exercise 7.5 ----
# As a doctor you prescribe an experimental drug to a patient, which will cure the disease with a probability p=0.20.
# Write this as a Bernoulli random variable and find the variance of this random variable.
# Also, find the formula for the expected value and variance of a Bernoulli random variable from the definitions
#   X = random variable describing if cure is successful
#   P(X = 1)  = 0.2
#   P(X = 0)  = 0.8
#   E[X] = P(X = 1) = 0.2
#   Var(X) = 0.2*0.8 = 0.16


#* Exercise 7.6 ----
# If you know that 5% of a companies products are defective.
# In an order of 30 products what is the probability that less than three are defective?
# What is the expected number of defective products? 
#   N = 30
#   p = 5%
#   q = 1-p = 95%
#   P(X < 3)  = [2∑m=0]30Cm * p^m * (1-p)^(30-m)
P_X <- 0
for(m in seq(0, 2)){
  P_X = P_X + choose(30, m) * 0.05^m * 0.95^(30-m)
}
#   Probability that less than three are defective = 0.8121788

# alternate 1
sum(dbinom(0:2, size = 30, prob = 0.05))

# alternate 2
pbinom(2, size = 30, prob = 0.05)


#* 7.9 Homework ----------------------------------------------------------
#** 7.9.1 Concept Questions: ----
#*** 1. ----
# If the random variable X has units of dollars, what are the units of var(X)?
#   variance has units of dollars squared


#*** 2. ----
# Does the binomial distribution have a mound-shape?
#   Yes


#*** 3. ----
# How many parameters does a binomial distribution have?
#   2 - Size, probability of success


#*** 4. ----
# Is it true that var(X1+X2)≥var(X1) for any random variables X1 and X2?
#   Var(X1 + X2) = Var(X1) + Var(X2) >= Var(X1)
#   Yes


#*** 5. ----
# If X and Y are random variables, we must assume they are independent to apply the formula E[X+Y]=E[X]+E[Y] (True/False).
#   True


#*** 6. ----
# The binomial random variable can be written as a sum of Bernoulli random variables (True/False)
#   X = [N∑j=1]B[j]
#   True


#*** 7. ----
# The variance of a binomial random variable increases with the number of trials (N). (True/False)
#   Var = Np(1-p)
#   True


#** 7.9.1.1 Practice Problems: ----
#*** 1. ----
#   E[X]  = ∑yP(X = y)
#         = -1*P(X = -1) + 0*P(X - 0) + 1*P(X = 1)
#         = -0.2 + 0 + 0.3
#         = 0.1

#   E[f(X)] = ∑f(X)P(X = k)
#   f(X) = X^2
#   E[X^2]  = ∑k^2 * P(X = k)
#           = -1^2*P(X = -1) + 0^2*P(X - 0) + 1^2*P(X = 1)
#           = 0.2 + 0 + 0.3
#           = 0.5


#*** 2. ----
# During the rifle qualification in the Marine Corps the final ten shots are taken from 500 yards.
# You receive one point for a hit and zero points for a miss.
# If each shot is independent of all the others and the probability you hit the target on each shot is p=0.70 what is the probability you hit 7 or more of your shots?
#   N = 10
#   p = 0.7

# P(X = k) = (NCk) * p^k * (1-p)^(N-k)
# P(X >= 7)
#   = P(X = 7) + P(X = 8) + P(X = 9) + P(X = 10)
#   = choose(10,7) * 0.7^7 * 0.3^3 + choose(10,8) * 0.7^8 * 0.3^2 + choose(10,9) * 0.7^9 * 0.3^1+ choose(10,10) * 0.7^10 * 0.3^0
#   = 0.6496107


#*** 3. ----
# In the NBA 3-point contest the player shoots 20 shots from positions around the court.
# Sixteen (16) of these shots are taken with a normal basketball and each made shot counts as one point, and four shots are taken with a stripped money ball where makes count as 2 points.
# Assume that each shot taken has an independent probability of p=0.43 of going in.
#   N = 20
#   s1 = 16*1 = 16
#   s2 = 4*2 = 8
#   p = 0.43
#   Since each s either goes in or not, this is a binomial random variables.

# Find the expected value for the points scored
#   E[X]  = s1*p + s2*p
#         = p(s1 + s2)
#         = 0.43*24
#         = 10.32

# Find the standard deviation of the total points scored
#   Var(X)  = s1*p*q + s2*p*q
#           = pq(s1 + s2)
#           = 0.43*0.57*24
#           = 5.8824
#   sd(X) = sqrt(5.8824)
#         = 2.425366


#*** 7.9.2 Advanced Problems: ----
#*** 1. ----
# Parking Tickets:
# Parking on the street costs $1 a day, but about 5% of the time I forget to bring the parking pass and receive a $50 dollar parking ticket.
# How much should I budget for my daily parking costs in the long-term?
#   p = c(0.95, 0.05)
#   X = c(1, 50)
#   E[X]  = 1*0.95 + 50*0.05
#         = 3.45


#*** 2. ----
# Hogwarts Test Guessing:
# Professor Dumbledore is writing an exam for his students.
# He plans on giving a multiple choice exam, with no partial credit.
# However, he is worried that students who are randomly guessing may score much higher than they deserve.
# His test has 20 questions on it, with four answer choices for each problem.
#   N = 20
#   p = 1/2

# What is the expected number of questions correct when a student is purely guessing on the exam?
#   E[X] = Np = 10

# What is standard deviation for a randomly guessing students number of correct answers?
#   sd(X) = sqrt(Npq) = sqrt(5) = 2.24 

# What is the probability that a student who is purely guessing scores 70% or better on the exam?
#   P(X >= 40%) = P(X >= 14) = 1 - pbinom(13, 20, 0.5) = 0.058

# Give an interval which will contain about 99% of the students number of correct answers, if they are guessing on the exam.
#   Since this is a binomial random distribution, it is near normal distribution.
#   So using emperical rule, 99% is 3 std dev = 3*2.24 = 6.72. So range = 10 +- 6.72 = 3.28 - 16.72
#   pbinom(16.72, 20, 0.5) - pbinom(3.28, 20, 0.5)
#   Using Chebychev's rule 99% = 1 - 1/k^2 => k = 10. So range = 10 +- 10 = 0 - 20


#*** 3. ----
# Home Runs:
# In 1961 Roger Maris broke Babe Ruth’s home run record with 61 home runs.
# Rather than adoration Maris was despised by much of the public because he was deemed unworthy of dethroning the great Babe Ruth as the home run king.
# This was largely because Maris never hit more than 40 home-runs in a season except his record breaking season.
# We can estimate Roger Maris’s probability of hitting a home run in any given game as p=0.187 by taking his 275 career home runs and dividing by his 1463 career games.
#   p = 0.187

# Given his career numbers what is Maris’s expected number of home runs in a 162 game season?
#   N = 162
#   E[X] = Np = 162 * 0.187 = 20.294

# What is the standard deviation expected in his home run output each year?
#   sd(X) = sqrt(Npq) = sqrt(162 * 0.187 * 0.813) = 4.962764

# Construct an interval which will contain about 95% of Maris’s home run output for a season?
#   Using Emperical rule = 95% = 2 sd
#   Interval = 30.294 +- 2*4.962764 = 20.07447 to 39.92553

# Using these numbers do you think this malice towards Maris is justified?
#   the record breaking was an outlier
#   Prob of scoring 61 or more home runs = 1 - pbinom(60, 162, 0.187) = 1.293067e-08


#*** 4. ----
# Triple A Rated Mortgages:
# Most people who are investing their money want to do so at a very limited risk.
# For this reason many pension funds and mutual funds require that any stock or bond purchased has to be rated to have an very low risk of going into default.
# Standard and Poors (S&P) and Moody are two companies who rate the risk of investments, and their triple A ranking is supposed to indicate that the bond has a risk of less that 1 in 850 (0.12%) of going into default.
# It is rather difficult to find individual investments which are this conservative in their risk.
# Therefore, it is common practice on Wall Street to bundle together a bunch of risker investments into what are called Collateralized Debt Obligations (CDO’s).
# The idea is that these bonds pay out as long as not every loan in the bundle fails.
#   P(AAA) = 1/850 = 0.12%

# What is the risk of a CDO failing to pay out if it consists of 10 loans which all independently have a probability of 5% of failing individually?
#   N = 10
#   p = 5%
#   P(CDO fail) = 0.05^10 = 9.765625e-14

# If we are trying to bundle together subprime loans which each have a probability of 50% of failing into a triple AAA CDO how many loans do we need to put into the CDO?
#   P(subprime) = 50%
#   P(AAA >= N * P(subprime fail)^k * P(subprime not fail)^(N-k)
#   worst case all N fail
#   1/850 >= N * 0.5^N
N <- 0
for(n in seq(100)){
  if(round(1/850, 6) >= round(n*0.5^n, 6)){
    print(n)
    N <- n
    break
  }
}
round(1/850, 6); N-1; round((N-1) * 0.5^(N-1), 6); N; round(N * 0.5^N, 6)

# What is the probability the subprime CDO will fail to pay out if the loans used in the bundle are completely on one another?
#   Didn't understand the question

# Do you expect that mortgage loan foreclosures are completely independent of one another?
# This error by the ratings agencies was a major contributing factor in the recent global economic meltdown.
#   No


#*** 5. ----
# Murphy’s Law:
# The Air Force has ordered a new fighter jet from Lockheed Martin with contains 1000 critical engineering components.
# Tests have shown that each of these parts will fail independently with a probability of p=0.001.
# In the design team they have to decide how much redundancy to build into the system.
#   N = 1000
#   p = 0.001

# Define a random variable X which counts the number of components which fail on the jet.
# What distribution does X have, and what are the parameters of the distribution?
#   X = number of failed componenets
#   Since the components can wither fail or not fail and there are N components, this is a binomial distribution.
#   Parameters = N, p, X

# If they add no redundancy into the system, so that the jet will fail if of these 100 critical components fails what is the probability that the jet fails?
#   P(X = 100) = choose(1000, 100) * 0.001^100 * 0.999^900 = 2.594799e-161

# Given these numbers they decide to add some redundancy so that the jet will continue to work as long as less than k components fail.
# What is the minimum k where the probability for the jet to fail is less than P(X>k)<0.001.
#   P(X > k) < 0.001
#   1 - P(X <= K) < 0.01
#   P(X <= k) > 0.99
K = 0
for(k in seq(100)){
  p = pbinom(k, 1000, 0.001)
  if(p > 0.99){
    print(k)
    K = k
    break
  }
}
print(K); pbinom(K, 1000, 0.001)
# K = 4


#*** 6. ----
# Zombie Apocalypse:
# The zombie apocalypse is here, and the population of Kerrville is quickly being converted to zombies.
# You are well prepared for such a contingency, but you estimate you have a 5% chance of being bitten by a zombie on any given day.
# Let S be a random variable which gives the number of days you are able to survive.
#   p = 5%

# Find the probability distribution for S, that is write a formula for P(S=d).
#   P(D = d) = nCd * p^d * (1-p)^(n-d)


# If you get word that the national guard is on the way, but it will be ten days until they arrive, what are the odds that you survive until help arrives?
# [Hint: Use the first example of random variables for the number of flips of a coin until a heads appears]
#   odds  = P(S = 0) + P(S = 1) + ... + P(S = 10)
#         = 0.05 + 0.95*0.05 + 0.95^2 * 0.05 + ...
p <- 0 # cumulative prob of infection on day n
for(n in seq(10)){
  p <- p + (0.95^(n-1) * 0.05)
}
print(1-p)

# The national guard is trying to estimate how many trucks to bring to evacuate the survivors.
# If there are 100 survivors left in Kerrville today and they each have the same 5% daily chance of being bitten independent of the rest, how many people should the national guard expect to have survived 10 days from now?
#   N = 100
#   no. of people = N*(1 - P(S = 0)) + (N*(1-P(S = 0)))*P(S = 1) +...
N <- 100
for(n in seq(N)){
  N <- N*(1 - (0.95^(n-1) * 0.05))
}
print(N) # 36.52401
