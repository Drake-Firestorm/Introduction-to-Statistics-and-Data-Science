#*** Exercise 12.1 ----
# Load the HR_Employee_Attrition data set in R.
# Perform a regression analysis to compare the DailyRate variable (giving the daily pay of employees at a company) according to the categorical variable (Attrition) which tells whether the employee left the company or not.
# Be sure to interpret the coefficients in the model you form and use confidence intervals for the parameters to reach a conclusion. 
colnames(HR_Employee_Attrition)

boxplot(HR_Employee_Attrition$DailyRate ~ HR_Employee_Attrition$Attrition, col = "skyblue",
        xlab = "Attrition", ylab = "Daily Pay", main = "Daily Pay of Employees")

table(HR_Employee_Attrition$Attrition)

lm_attrition <- lm(DailyRate ~ Attrition, data = HR_Employee_Attrition)
summary(lm_attrition)

confint(lm_attrition, level = 0.99)

# Employees who leave are paid 62 less on average compared to those who stay.
# The confidence interval at:
#   0.95 - doesn't contain a zero
#   0.99 - contains a zero. therefore, we can't conclude there is a difference in pay between those who stay and those who leave.


#*** Exercise 12.2 ----
# Repeat the analysis from this section but change the response variable from weight to GPA. 
# Be sure to interpret the coefficients in your model and use confidence intervals to reach a conclusion. 
boxplot(food_college$GPA ~ food_college$exercise, col = "cyan",
        xlab = "Exercise", ylab = "GPA", main = "Exercise and GPA")

f2 <- food_college %>% select(exercise, weight, Gender, GPA) %>% na.omit()
f2$exercise <- as.factor(f2$exercise)

lm_gpa <- lm(GPA ~ exercise, data = f2)
summary(lm_gpa)

confint(lm_gpa, level = 0.99)

# The confidence interval contains a 0, therefore, we can't conclude there is any difference in the average GPA of the 3 exercise categories.


#*** Exercise 12.3 ----
# Repeat the analysis from this section but change the response variable from weight to GPA. 
# Be sure to interpret the coefficients in your model and use confidence intervals to reach a conclusion. 
lm_gpa <- lm(GPA ~ Gender + exercise, data = f2)
summary(lm_gpa)

confint(lm_gpa)

# All confidence intervals contain 0.
# This means that we don't have enough data to see a consistant effect or perhaps no consistant effect.


#* 12.4 Homework ----
#** 12.4.1 Concept Questions ----
#*** 1. ----
# Describe the process that R uses to generate a “One Hot Encoding” of a categorical variable with L levels for regression.
#   Creates L-1 binary variables, where each variables has a value of 1 if the data point belongs to that level or 0 otherwise.
#   If all variables have a value of 0, then the data point belongs to the default level.


#*** 2. ----
# When performing a regression analysis we should include as many variables as humanly possible? (True/False)
#   False


#*** 3. ----
# If I form a regression model using a single categorical explanatory variable with 4 levels, how many slopes will need to estimated from the data?
#   3


#*** 4. ----
# The same core assumptions apply to regression using categorical variables as to ordinary regression (True/False)
#   True


#** 12.4.2 Practice Problems ----
#*** 1. ----
# Suppose that I have collected survey data the education level of people in the local area and their annual income. 
# Suppose that my educational background variable has the following four levels (Non high school graduate, high school graduate, college graduate, advanced degree) cooresponding to the highest level achieved by a respondant. 
# I want to look for a difference in incomes based on this categorical variable.

# + If I form a regression model using this data, how many parameters (slopes+intercepts) will I be estimating?
#     4

# + Write out a formula for the model, and give an interpretation of all the variables and parameters.
#     inc = a + B1*E_hsg + B2*E_cg + B3*E_ad
#     a     - intercept. avg value for nshg
#     B1-3  - slope of variables. explains the increase/decrease over intercept
#     E_    - binary variables 


#*** 2. ----
# Explain the reasoning behind one-hot encoding categorical variables. 
# Why do we need to do this? 
# What is subjective about the process?
#   To use categorical variable in lm, one hot encoding is done.
#   It is subjective because
#     1 level is arbitarily chosen as the base, and the average its value is chosen as the intercept.
#       All other values are either increment/decrements over this base.
#     Also, with multiple categorical variables, the slope of all levels depends only on the base, and not on any interaction between the variables.
#       e.g. - weight ~ gender + exercise, the value for levels of gender, exercise depend on base and not gender/exercise interaction.


#** 12.4.3 Advanced Problems ----
# For each of the below questions conduct a full regression analysis. 
# Remember to check whether R is treating a categorical variable as a “factor”. 
# If not then cast it to a factor using the as.factor command.

#*** 1. ----
# Load the kidiq data set in R. 
# Famalirise yourself with this data set. 
# We will be using various explanatory variables in this exercise to try and predict the response variable kid_score. 
# For each of the below form a graphical plot to look for a relationship, check sample sizes, form a regresion model and interpret the results.
colnames(kidiq)


# + Use mom_hs as the explanatory variable.
table(kidiq$mom_hs)
class(kidiq$mom_hs)
kidiq$mom_hs <- as.factor(kidiq$mom_hs)

boxplot(kidiq$kid_score ~ kidiq$mom_hs,
        xlab = "Mom's High School Degree", ylab = "Child's IQ Score", main = "Child's IQ Score")

lm_hs <- lm(kid_score ~ mom_hs, data = kidiq)
summary(lm_hs)

confint(lm_hs, level = 0.99)
# kid scores are higher for mom's with high school degree when compared to mom's without degree.


# + Use mom_work as the explanatory variable.
table(kidiq$mom_work)
class(kidiq$mom_work)
kidiq$mom_work <- as.factor(kidiq$mom_work)

boxplot(kidiq$kid_score ~ kidiq$mom_work,
        xlab = "Working Mom?", ylab = "Child's IQ Score", main = "Child's IQ Score")

lm_work <- lm(kid_score ~ mom_work, data = kidiq)
summary(lm_work)

confint(lm_work, level = 0.99)
# Except w3 rest have 0 in the interval.
# Hence while w3 (worked part-time in first year of child’s life) is higher than w1 (did not work in first three years of child’s life), no conclusion about the others can be reached.


# + Use both mom_hs and mom_work as explanatory variables.
lm_both <- lm(kid_score ~ mom_hs + mom_work, data = kidiq)
summary(lm_both)

confint(lm_both, level = 0.99)

# kid's iq scores are higher for mom's with high school degree when compared to mom's without degree.
# No conclusion can be reached about the others.


#*** 2. ----
# Load the videoGameSales data set in R. 
# We want to look for a relationship between the genre column and the Global_Sales column.
colnames(videoGameSales)

# + Choose the appropriate graphical way to look for a relationship between these two columns. 
#   What does you EDA indicate?
boxplot(videoGameSales$Global_Sales ~ videoGameSales$Genre,
        xlab = "Genre", ylab = "Global Sales", main = "Global Video Games Sales")

# Wide range of values for each Genre.
# Since all these outlier values are on the upper side, the Sales are heavily right skewed assuming a normal distribution.


# + Check the sample size for each of the categories of the Genre column. 
#   Are any categories poorly represented in the data set and need to be combined or removed?
class(videoGameSales$Genre)
table(videoGameSales$Genre)
# All samples are adequetely represented.
# The minimum count is over 600.


# + Build a regression model of your system. 
#   Write down the model form and what each of the slopes and the intercepts mean. 
#   What can you conclude based on your model?
lm_sales <- lm(Global_Sales ~ Genre, data = videoGameSales)
summary(lm_sales)

confint(lm_sales)
# Sales = 0.50 - 0.34*Adv + 0.01*Fig - 0.06*Misc + 0.42*Plat - 0.10*Puz + 0.07*Rac + 0.11*Role + 0.29*Sho - 0.08*Sim + 0.05*Spo - 0.26*Strat
# There are few categories which have 0 in the confidence interval, and no conclusion can be reached for them.
# Adventure & Strategy have lower sales than Action
# Platform, Role Playing and Shooter have higher sales than Action.


#*** 3. ----
# Load the NBA_Draft_Data data set in R. We will be looking for useful explanatory variables for the response variable PTS. For each of the following explanatory variables, make the appropriate plot in R, check sample sizes, form the regression model and interpret the model results.
colnames(NBA_Draft_Data)

# + Use the Pos column as an explanatory variable.
boxplot(NBA_Draft_Data$PTS ~ NBA_Draft_Data$Pos,
        xlab = "Position", ylab = "Average Points per Game", main = "Averegae Points per Game by Position")
table(NBA_Draft_Data$Pos)

lm_pts <- lm(PTS ~ Pos, data = NBA_Draft_Data)
summary(lm_pts)

confint(lm_pts)

# The average points by a center is 7.
# All other positions will score more than the C on average.
# The highest scores are by F-G with additional score of 5 on average.


# + Use the Tm column as an explanatory variable.
table(NBA_Draft_Data$Tm)
# Multiple Teams have very low sample count.
# Dropping teams with less than 10 samples.
nba <- NBA_Draft_Data %>%
  select(PTS, Pos, Tm) %>%
  group_by(Tm) %>%
  mutate(count = n()) %>%
  ungroup() %>%
  filter(count > 10) %>%
  droplevels()

table(nba$Tm)

boxplot(nba$PTS ~ nba$Tm,
        xlab = "Teams", ylab = "Average Points per Game", main = "Averegae Points per Game by Teams")

lm_pts <- lm(PTS ~ Tm, data = nba)
summary(lm_pts)

confint(lm_pts)
# Except PHI rest of the teams have 0 in confidence interval and no conclusion can be reached.
#   This might be due to low sample count in each group.
# PHI on average scores 4 more PTS than ATL.


# + Use nboth Pos and Tm as an explanatory variable.
lm_pts <- lm(PTS ~ Pos + Tm, data = nba)
summary(lm_pts)

confint(lm_pts)
# Results are similar to above.
