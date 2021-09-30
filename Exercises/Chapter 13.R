#* 13.5 Homework ----
#** 13.5.1 Concept Questions ----
#*** 1. ----
# (True/False) When building multiple regression models we should include every possible explanatory variable we have available.
#   False


#*** 2. ----
# (True/False) Over-fitting occurs when we include to many explanatory variables in our model
#   True


#*** 3. ----
# (True/False) Under-fitting occurs when some key explanatory variables are left out of our model.
#   True


#*** 4. ----
# (True/False) An over-fit model may describe the data used to fit it very closely (high goodness of fit) but generate poor predictive estimates
#   True


#*** 5. ----
# (True/False) Multicollinearity is a good thing when we are considering whether to include an additional explanatory variable in our model.
#   False


#** 13.5.2 Practice Problems ----
#*** 1. ----
# Suppose I am building a linear model to predict the college GPA (C) of incoming students using data from their college applications.

# + I begin with a simple regression using their high school GPA (H).
#   Thus my model looks like 
#     C = α + β1*H.
#   What are the interpretations of the slope and intercept values of this model?
#     α   - Average gpa when high schoold GPA is 0
#     β1  - GPA increase for each increase of 1 high school GPA

# + Suppose I decide to include the students SAT scores (S) as well.
#   Now my model reads 
#     C = α + β1*H + β2*S. 
#   How can I interpret the coefficients of this model?
#   What conditions should I check before including this extra explanatory variable in my model?
#     β2 - GPA increase for each increase of 1 SAT keeping high school GPA constant

# + Suppose the SAT score variable turns out to be useless in predicting college GPA and I decide to remove it.
#   I now add a variable (A) which is zero for students who were not athletes in high school and 1 for those who played some sport.
#   Thus my model is 
#     C = α + β1*H + β2*A. 
#   How can I interpret the coefficients for this model?
#     β2 - GPA increase for athlete keeping high school GPA constant


#** 13.5.3 Advanced Problems ----
#*** 1. ----
# Load the kidiq data set from the class R package.
# This data set contains the iq scores for children and characteristics of the mothers.
# We will perform a multiple regression analysis on this data set with the kid_score column as the response variable and the other columns as potential explanatory variables.
head(kidiq)

# + Classify the statistical variable types for the explanatory variables (categorical, numeric, etc)
#     categorical - mom_hs, mom_work
#     numeric     - mom_iq, mom_age

# + Form a simple regression using the explanatory variable mom_iq?
#   Interpret the results.
#   How precise is the fit? how can we interpret the slope and intercept values?
lm_score <- lm(kid_score ~ mom_iq, data = kidiq)
summary(lm_score)
confint(lm_score)
# p-value   - significant. Mom's iq helps explain kid's iq score
# intercept - average score keeping mom's iq = 0
# mom_iq    - increase in kid's iq score for each increase of one in mom_iq


# + Form a simple regression with just the mom_hs variable as the explanatory variable.
#   Intepret the slope and intercept in this case.
#   Does this variable influence the value of the kid_score column?
lm_score <- lm(kid_score ~ mom_hs, data = kidiq)
summary(lm_score)
confint(lm_score)
# p-value   - significant. mom_hs helps explain kid's iq score
# intercept - average kid's iq score for mom's who didn't complete high school
# mom_hs    - increase in kid's iq score for mom's who complete high school


# + Form a muliple regression using both the mom_iq and mom_hs columns as explanatory variables.
#   Interpret the meaning of the slope and intercept in this case.
#   How does this change the fit of our model?
lm_score <- lm(kid_score ~ mom_iq + mom_hs, data = kidiq)
summary(lm_score)
confint(lm_score)
# p-value   - significant. both mom_iq and mom_hs helps explain kid's iq score
# intercept - average kid's iq score keeping mom_iq = mom_hs = 0
# mom_iq    - increase in kid's iq score for each increase of one in mom_iq keeping mom_hs constant
# mom_hs    - increase in kid's iq score for mom's who complete high school keeping mom_iq constant


#*** 2. ----
# Load the NBA_Draft_Data from the class R Package.
# We will use using the columns PTS, Pick.Number and Pos.
# The PTS column gives the average PPG for that player over the course of their career.
colnames(NBA_Draft_Data)

# + Conduct a simple regression analysis using the response variable PTS and the explanatory variable Pick.Number.
#   Interpret the results.
#   What do the intercept and slope parameters tell you in this case?
lm_pts <- lm(PTS ~ Pick.Number, data = NBA_Draft_Data)
summary(lm_pts)
confint(lm_pts)
# p-value     - significant. Pick number helps explain points score
# intercept   - average score keeping Pick Number = 0
# Pick.Number - decrease in points for each increase of one in Pick Number 


# + Add the explanatory variable Pos to your model.
#   How does this change your fit.
lm_pts <- lm(PTS ~ Pick.Number + Pos, data = NBA_Draft_Data)
summary(lm_pts)
confint(lm_pts)
# p-value     - significant. Pick number and Position helps explain points score
# slight increase in R2


# + Interpret the model what do the coefficients mean?
#     intercept   - average points keeping Pick Number = Position = 0
#     Pick.Number - decrease in points for each increase of one in Pick Number keeping Poistion constant
#     Position    - inc/decrease in Point compared to Position = C keeping Pick Number constant


#*** 3. ----
# Load the videoGameSales data set in R (again).
# Last chapter you looked for a relationship between the genre column and the Global_Sales column, now we will add the Critic_Score column as well.
colnames(videoGameSales)

# + Make the appropriate graphical representations to look for relationships between the two sets of variables.
plot(x = videoGameSales$Critic_Score, y = videoGameSales$Global_Sales, col = videoGameSales$Genre,
     xlab = "Critic Score", ylab = "Global Sales", main = "Global Sales by Genre")
legend(x = "topleft", legend = levels(videoGameSales$Genre), fill = videoGameSales$Genre, ncol = 3, cex = 0.6)
# Increase in Global Sales with Critic Score.

# + Build a regression model of your system.
# Write down the model form and what each of the slopes and the intercepts mean.
# What can you conclude based on your model?
lm_sales <- lm(Global_Sales ~ Genre + Critic_Score, data = videoGameSales)
summary(lm_sales)
confint(lm_sales)
# p-value   - significant. The genre and score helps explain sales
# intercept - average sales for genre = Action keeping score = 0
# score     - increase in sales for each increase of one in score
# genre     - inc/decrease of sales compared to genre = Action keeping score constant
#   however, multiple genres have 0 in confidence interval so inconclusive if their sales significantly differs from genre = Action
