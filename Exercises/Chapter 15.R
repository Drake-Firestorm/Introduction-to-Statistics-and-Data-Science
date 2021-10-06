#*** Exercise 15.1 ----
# Perform a two sample t test to see how the TRB (total rebounds) column differs between the lottery and non-lottery picks.
# Interpret your results.
boxplot(NBA_Draft_Data$TRB ~ NBA_Draft_Data$Lottery.Pick,
        xlab = "Lottery Pick", ylab = "Total Rebounds", main = "Total Rebounds")

t.test(NBA_Draft_Data$TRB ~ NBA_Draft_Data$Lottery.Pick, alternative = "greater")

# The small p-value indicates that the population mean of the lottery pick is truly greater than the population mean of the non-lottery picks.

# The 95% confidence interval tells that this difference is at least 1.18.


#*** Exercise 15.2 ----
# Repeat the above analysis but this time split the data into Top-5 picks versus Non-Top-5 picks.
# The below command will create this column for you:
NBA_Draft_Data$Top.Five = ifelse(NBA_Draft_Data$Pick.Number <= 5, "Top 5", "Not Top 5") # create top 5 pick column

boxplot(NBA_Draft_Data$TRB ~ NBA_Draft_Data$Top.Five,
        xlab = "Top 5 Picks", ylab = "Total Rebounds", main = "Total Rebounds")

t.test(NBA_Draft_Data$TRB ~ NBA_Draft_Data$Top.Five, alternative = "less")

# The small p-value indicates that the population mean of the Top 5 picks is truly greater than the population mean of the non-Top 5 picks.

# The 95% confidence interval tells that this difference is at least 1.79.


#*** Exercise 15.3 ----
# Use the Diet_data set to examine whether a diet program is effective in reducing the weight of the participants.
# Record the p value for the most powerful test for a difference in the mean values of the participants. 
head(Diet_data)

t.test(Diet_data$weight.before, Diet_data$weight.after, alternative = "greater", paired = TRUE)

# The small p-value indicates that there is a definite reduction in weights after the program.
# The 95% confidence interval tells that this difference is at least 1.44.


#*** Exercise 15.4 ----
# Fred is gambling in Las Vegas, and has been watching two roulette tables all day.
# Table 1 has landed on red 63 out of 100 times and table 2 has landed on red 56 out of 100.
# Use a statistical hypothesis test to determine whether he has enough evidence to indicate he should bet on red at table 1 instead of table 2. 
prop.test(c(63, 56), c(100, 100), alternative = "greater")

# The evidence is not sufficient to conclude that Table 1 has greater chance of landing on red.


#* 15.4 Homework ----
#** 15.4.1 Concept Questions ----
#*** 1. ----
# What the assumptions behind using a two sample proportion test?
# Hint these will be the same as forming a confidence interval for for the fraction of a population, with two samples where this assumption needs to hold.
#   Conditions for using a two-sample t test:
#     These are roughly the same as the conditions for using a one sample t test, although we now need to assume that BOTH samples satisfy the conditions.
#     1. Must be looking for a difference in the population means (averages)
#     2. 30 or greater samples in both groups (CLT)
#     3. If you have less than 30 in one sample, you can use the t test must you must then assume that the population is roughly mound shaped. 

#   The two sample t test is specialized to deal with comparing the mean values between only two categories.
#   It doesn’t work for categorical variables with more than two levels. 


#*** 2. ----
# What assumptions are required for a two sample t test with small N≤30 sample sizes?
#   If you have less than 30 in one sample, you can use the t test must you must then assume that the population is roughly mound shaped. 

#*** 3. ----
# A paired t test may be used for any two sample experiment (True/False)
#   False


#*** 4. ----
# The power of any statistical test will increase with increasing sample sizes. (True/False)
#   True


#*** 5. ----
# Where possible it is better to collect data on the same individuals when trying to distinguish a difference in the average response to a condition (True/False)
#   True

#*** 6. ----
# The paired t test is a more powerful statistical test than a normal t test (True/ False)
#   True


#** 15.4.2 Practice Problems ----
# For each of the scenarios below form the null and alternative hypothesis.
#*** 1. ----
# We have conducted an educational study on two classrooms of 30 students using two different teaching methods.
# The first method had 50% of students pass a standardized test, and the classroom using the second teaching method had 60% of the students pass.

#   H0    - pass_teach2 <= pass_teach1
#   H_alt - pass_teach2 >  pass_teach1


#*** 2. ----
# A basketball coach is extremely superstitious and believes that when he wears his lucky tie the team has a greater chance of winning the game.
# He comes to you because he is looking to design an experiment to test this belief.
# If the team has 40 games in the upcoming season, design an experiment and the (null and alt) hypothesis to test the coaches claims.

#   data table
#                   win     loss
#   lucky_tie
#   not_lucky_tie

#   H0    - win_prop_lucky_tie <= win_prop_not_lucky_tie
#   H_alt - win_prop_lucky_tie >  win_prop_not_lucky_tie


#*** 3. ----
# For the below question work out the number of errors in the data set.
# Before the Olympics all athletes are required to submit a urine sample to be tested for banned substances.
# This is done by estimating the concentration of certain compounds in the urine and is prone to some degree of laboratory error.
# In addition, the concentration of these compounds are known to vary with the individual (genetic, diet, etc).
# To weigh the evidence present in a drug test the laboratory conducts a statistical test.
# To ensure they don’t falsely convict athletes of doping they use a significance level of α=0.01.
# If they test 3000 athletes, all of whom are clean about how many will be falsely accused of doping?
# Explain the issue with this procedure.

#   30
#   The issue with this procedure is that it assumes that all individuals have the same level of these compunds on average, which is an incorrect assumption. Therefore, chances of Type 1 and 2 errors are high.


#** 15.4.3 Advanced Problems ----
# Using alpha = 0.05 unless specified.

#*** 1. ----
# Load the drug_use data set from the fivethirtyeight package.
# Run a hypothesis test to determine if a larger proportion of 22-23 year olds are using marijuana then 24-25 year olds.
# Interpret your results statistically and practically.

colnames(drug_use)
levels(drug_use$age)

m_22 <- subset(drug_use$marijuana_use, drug_use$age == "22-23")
m_24 <- subset(drug_use$marijuana_use, drug_use$age == "24-25")


prop.test(c(m_22, m_24), c(100, 100), alternative = "greater")

# can't reject the null hypothesis.
# however, practically there the difference of around 4% is significant enough when compared to the sample size.


#*** 2. ----
# Import the data set Cavaliers_Home_Away_2016.
# Form a hypothesis on whether being home or away for the game had an effect on the proportion of games won by the Cavaliers during the 2016-2017 season, test this hypothesis using a hypothesis test.

head(Cavaliers_Home_Away_2016)

table(Cavaliers_Home_Away_2016$Location, Cavaliers_Home_Away_2016$Result)

prop.test(table(Cavaliers_Home_Away_2016$Location, Cavaliers_Home_Away_2016$Result), alternative = "greater")

# Reject the null hypothesis that the proportion of away games won is greater than or equal to the home game wins.


#*** 3. ----
# Load the data set animal_sleep and compare the average total sleep time (sleep_total column) between carnivores and herbivores (using the vore column) to divide the between the two categories.
# To begin make a boxplot to compare the total sleep time between these two categories.
# Do we have sufficient evidence to conclude the average total sleep time differs between these groups?

head(animal_sleep)

animal_sleep <- animal_sleep %>% filter(vore %in% c("herbi", "carni")) %>% droplevels()

boxplot(animal_sleep$sleep_total ~ animal_sleep$vore, alternative = "two.sided")

# Fail to reject null hypothesis that the average total sleep time differs between these groups.


#*** 4. ----
# Load the HR_Employee_Attrition data set.
# We wish to investigate whether the daily rate (pay) has anything to do with whether a employee has quit (the attrition column is “Yes”).
# To begin make a boxplot of the DailyRate column split into these Attrition categories.
# Use the boxplot to help form the null hypothesis for your test and decide on an alternative hypothesis.
# Conduct a statistical hypothesis test to determine if we have sufficient evidence to conclude that those employees who quit tended to be paid less.
# Report and interpret the p value for your test.

colnames(HR_Employee_Attrition)

boxplot(HR_Employee_Attrition$DailyRate ~ HR_Employee_Attrition$Attrition,
        xlab = "Attrition", ylab = "Daily Rate", main = "Daily Rate")

# H0    - pay_attrition >= pay_non_attrition
# H_alt - pay_attrition < pay_non_attrition

t.test(HR_Employee_Attrition$DailyRate ~ HR_Employee_Attrition$Attrition, alternative = "greater")

# reject H0.
# based on 95% confidence interval there is at least Daily Rate difference of 15.10.


#*** 5. ----
# Load the BirdCaptureData data set.
# Perform a hypothesis test to determine if the proportion of orange-crowned warblers (SpeciesCode==OCWA) caught at the station is truly less than the proportion of Yellow Warblers (SpeciesCode==YWAR).
# Report your p value and interpret the results statistically and practically.

colnames(BirdCaptureData)

levels(BirdCaptureData$SpeciesCode)

table(BirdCaptureData$SpeciesCode)

ocwa <- nrow(subset(BirdCaptureData, BirdCaptureData$SpeciesCode == "OCWA"))
ywar <- nrow(subset(BirdCaptureData, BirdCaptureData$SpeciesCode == "YWAR"))
n <- nrow(BirdCaptureData)

ocwa; ywar
prop.test(c(ocwa, ywar), c(n, n), alternative = "less")

# the small p-value indicates that the proportion of orange-crowned warblers is truly less than the proportion of Yellow Warblers.
# practically, the count is significant, around 300 or 3%.


#*** 6. ----
# (All of Statistics Problem)
# In 1861, 10 essays appeared in the New Orleans Daily Crescent.
# They were signed “Quintus Curtius Snodgrass” and one hypothesis is that these essays were written by Mark Twain.
# One way to look for similarity between writing styles is to compare the proportion of three letter words found in two works.
# For 8 Mark Twain essays we have:
twain=c(0.225, 0.262, 0.217, 0.240, 0.230, 0.229, 0.235, 0.217)
# From 10 Snodgrass essays we have that:
snodgrass=c(0.209,0.205, 0.196, 0.210, 0.202, 0.207, 0.224, 0.223, 0.220, 0.201)
# Perform a two sample t test to examine these two data sets for a difference in the mean values.
# Report your p value and a 95% confidence interval for the results.
# What are the issues with using a t-test on this data? 

t.test(twain, snodgrass, alternative = "two.sided")

# The small p-value indicates that the means are different.

# The small dataset along with assumption of normality which may be incorrect are possible issues while using a t-test on this data.


#*** 7. ----
# Consider the analysis of the kidiq data set again.
# + Run a regression with kid_score as the response and mom_hs as the explanatory variable and look at the summary() of your results.
#   Notice the p-value which is reported in the last line of the summary.
#   This “F-test” is a hypothesis test with the null hypothesis that the explanatory variable tells us nothing about the value of the response variable.
# + Perform a t test for the a difference in means in the kid_score values based on the mom_hs column. What is your conclusion?
# + Repeat the t test again using the command:
t.test(kidiq$kid_score~kidiq$mom_hs, var.equal=TRUE)

# This keyword has the t test assume that the variance for the two samples (mom_hs=0 and mom_hs=1) is the same.
# Notice that the p-value now matches the linear regression F-test result exactly.
# Thus, we can see that a two sample t test is really a linear regression analysis!
# Also, notice that the assumption of equal variances for all values of the explanatory variable is one of the four assumptions of linear regression analysis.  

lm_score <- lm(kid_score ~ mom_hs, data = kidiq)
summary(lm_score)

t.test(kidiq$kid_score ~ kidiq$mom_hs, alternative = "two.sided")
# The small p-value indicates that the means in the kid_score are greater for momether's who complete high school compared to those who didn't.
