#*** Exercise 14.1 ----
# In a high school they have tested out a new teaching technique on a class. 
# The students scored an average of an 82 on a standardized test, where the national average is a 75. 
# The school wants to know if the new teaching technique has improved the test scores.
#   H0    - same score                - score <= 75
#   H_alt - new tech improved scores  - score  > 75
t.test("82", mu = 75, alternative = "greater")


#*** Exercise 14.2 ----
# Lets say we have collected data on tadpole sizes in one pond in Chemical city. 
# If the average tadpole size is 1cm we would like to know if these chemical city tadpoles are abnormally small.
#   H0    - size >= 1
#   H_alt - size  < 1
t.test("size", mu = 1, alternative = "less")


#*** Exercise 14.3 ----
# The Lays potato chip factory has added a new machine which makes bags of potato chips. 
# If Lays machines typically put an average of 17 chips into each bag, we want to know if the new machine is performing like the typical potato chip machines.
#   H0    - performance  != 17
#   H_alt - performance   = 17
t.test("performance", mu = 17, alternative = "two.sided")


#*** Exercise 14.4 ----
# If I flip a coin 35 times and obtain 20 heads. 
# If p is the fraction of heads produced when flipping the coin can I conclude at a α=0.05 significance level that the coin is biased towards heads?
prop.test(20, 35, p = 0.5, alternative = "two.sided")
#   Fail to reject null hypothesis


#*** Exercise 14.5 ----
# If only 5% of people have a rare genetic disease in the United States, if we find that 15 out of 100 people randomly sampled in Kerrville have the disease can we conclude with a significance level of α=0.01 that Kerrville has a higher rate of this disease than the national average? 
prop.test(15, 100, p = 0.05, alternative = "greater")
#   reject null hypothesis


#* 14.10 Homework ----
#** 14.10.1 Concept Questions: ----
#*** 1. ----
# If I test 100 hypotheses using a significance level of α=0.05, what is the expected number of Type I (False Positive) errors?
#   100 * 0.05 = 5


#*** 2. ----
# Collecting larger samples lowers both the Type I and Type II error rates for a Hypothesis test (True or False?) Why?
#   False.
#   Lowers Type II not Type I


#*** 3. ----
# By testing a hypothesis many times against data, eventually I will collect a sample which allows me to reject the null hypothesis (True/False)
#   True


#*** 4. ----
# The p value measures the weight of evidence against the null hypothesis present in the data. (True/False)
#   True


#*** 5. ----
# The p value of a test is a random variable. (True/False)
#   True


#*** 6. ----
# By collecting enough data we can prove the null hypothesis (True/False)
#   True


#*** 7. ----
# Decreasing the significance parameter α will decrease the risk of False Negatives (Type II errors) (True/False)
# False


#*** 8. ----
# A p value is the probability that the null hypothesis is true. (True/False)
#   True. Technically it means Probability(data | null hypothesis), and we fail to reject null hypothesis


#*** 9. ----
# A p value can be thought of as a conditional probability P(D|H0) where D is the data. (True/False)
#   True


#** 14.10.2 Practice Problems: ----
# For each of the scenarios below form the null and alternative hypothesis.
#*** 1. ----
# We want to measure if people in Kerrville consume on average more fried food in a week than the national average of 1 pound of fried food a week.
#   H0    - consumption <= 1
#   H_alt - consumption  > 1


#*** 2. ----
# We would like to evaluate if a smaller fraction of people in Kerrville support banning those on the no-fly list from purchasing a gun than the national average. 
# A national poll found that around 80% of the public supported this measure.
#   H0    - support >= 80%
#   H_alt - support  < 80%


#*** 3. ----
# You have had have collected the number of cyber attacks each week on your website during the last year. 
# You would like to test whether there has been a change in the long-time average of 425 attacks per year.
#   H0    - average == 425
#   H_alt - average != 425


#** 14.10.3 Advanced Problems ----
# Taking α = 0.05 unless specified.

#*** 1. ----
# Within the Turtle data set conduct a hypothesis test to determine if we have sufficient evidence to conclude that Turtles which were collected on the Property “BGAD” have a mean mass greater than 2100 grams. 
# The following R command filters the mass data to give only those Turtles collected on the BGAD property and drops any turtles whose weights were not measured.
colnames(Distel_Turtle_Data)

td <- na.omit(Distel_Turtle_Data$Mass[Distel_Turtle_Data$Property == 'BGAD'])

t.test(td, mu = 2100, alternative = "greater")
#   Failed to reject null hypothesis


#*** 2. ----
# Using Lebron James Data Set (from the Confidence Interval homework) conduct a hypothesis test to see if we have sufficient evidence that Lebron’s true scoring average PPG exceeded 20 PPG in 2016-2017.
colnames(Lebron_James_2016)

t.test(Lebron_James_2016$PTS, mu = 20, alternative = "greater")
#   Reject null hypothesis


#*** 3. ----
# You suspect that an online poker game is not giving you random cards. 
# The odds a receiving two pair in a five card hand determined randomly is 42.25%. 
# You have played 100 hands and only started with a single pair 32 times. 
# Do you have sufficient evidence to conclude that the website is cheating?
prop.test(32, 100, 0.4225, alternative = "less")
#   Reject null hypothesis.
#   Yes, have sufficient evidence to conclude that the website is cheating.


#*** 4. ----
# Explain why we are careful to say we “fail to reject the null hypothesis” or “retain the null hypothesis” versus we “accept the null hypothesis”.
#   The conditions for performing a hypothesis test for a population proportion are the same as forming a confidence interval. 
#   We need….
#     At least five sucesses in our data set
#     At least five failures in our data set
#   I call this the rule of 5 and 5. 


#*** 5. ----
# Load the wine_tasting data set. Conduct a hypothesis test to determine if the mean price of a bottle of wine from France is truly greater than the average price of a bottle of wine from all countries in the data set (the mean of the price column). 
# Report and interpret the p value obtained from your test.
colnames(wine_tasting)
levels(wine_tasting$country)

price_france <- wine_tasting$price[wine_tasting$country == "France"]

t.test(price_france, mu = mean(wine_tasting$price), alternative = "greater")
#   Reject null hypothesis.
#   Yes, the mean price of a bottle of wine from France is truly greater than the average price of a bottle of wine from all countries in the data set.


#*** 6. ----
# Load the NBA_Salaries_2017 data set. 
# Determine whether we have sufficient evidence to conclude that the average guaranteed salary of NBA players ( NBA_Salaries_2017$Guaranteed) exceeded 16 million in 2017. 
# Report and interpret the p value obtained as well as justifying the use of the statistical hypothesis test chosen.
colnames(NBA_Salaries_2017)
head(NBA_Salaries_2017$Guaranteed)

t.test(NBA_Salaries_2017$Guaranteed, mu = 16*10^6, alternative = "greater")
#   p-value > α=0.05
#   Fail to reject null hypothesis
#   No, we don't have sufficient evidence
#   Since we are trying to test if salary > 16 million, t.test is correct.