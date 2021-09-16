#* 3.2.0.1 Exercises ----
#** Exercise 3.1 ----
# Consider the PTS_TYPE column of the shot logs data set.
# Should this be considered a continuous or categorical variable?
unique(shot_logs_2014$PTS_TYPE)    # Pts type tells whether the shot was 2- or 3-pointer, hence is categorical.


#** Exercise 3.2 ----
# How many levels does the Location variable have? What are they? Is this variable ordinal or nominal?
levels(shot_logs_2014$LOCATION)    # Tells away or home, hence nominal


#** Exercise 3.3 ----
# What type of variable is the SHOT_CLOCK variable in the shot logs data set?
class(shot_logs_2014$SHOT_CLOCK)    # Shot clock is the time left for the offence to shoot. This is continuous.


#** Exercise 3.4 ----
# How many shots are in the data set for away games? (Practice Filtering data sets in R)
dim(subset(shot_logs_2014, shot_logs_2014$LOCATION == "A"))


#** Exercise 3.5 ----
# For the nba shot logs data what is the appropriate way to plot the distribution of the column (variable) FINAL_MARGIN?
# Make the appropriate plot of this column.
hist(shot_logs_2014$FINAL_MARGIN, freq = TRUE, main = "Final Margin")


#** Exercise 3.6 ----
# Load the mushrooms data set data(mushrooms).
# The class column tells us if the mushroom species is edible or poison.
# Make the appropriate plot of the distribution of this data.
# What proportion of the mushroom species in the data set are edible? 
barplot(table(mushrooms$class), main = "Mushroom class (Count)")

prop.table(table(mushrooms$class))
barplot(prop.table(table(mushrooms$class)), main = "Mushroom class (Proportion)")


#** Exercise 3.7 ----
# Find the mean and median of the FINAL_MARGIN column of the shot logs data set.
# Is this a mound shaped distribution?
mean(shot_logs_2014$FINAL_MARGIN)
median(shot_logs_2014$FINAL_MARGIN)

hist(shot_logs_2014$FINAL_MARGIN, freq = TRUE, main = "Final Margin")

# Mound with 2 peaks.


#** Exercise 3.8 ----
# Load the Employee_Data data set, for the Performance.Score column what is the best measure of the central tendency of this variable? 
mean(Employee_Data$Performance.Score)
median(Employee_Data$Performance.Score)

hist(Employee_Data$Performance.Score, main = "Employee Performance Score")

# left skewed. median is the best measure.


#** Exercise 3.9 ----
# Which rule (Cheby or Empirical) would you use to form a prediction interval for the Performace.Score column of the Employee_Data data set?
# What is the standard deviation of this variable?
sd(Employee_Data$Performance.Score)


#** Exercise 3.10 ----
# Considering the FINAL_MARGIN column of the shot logs data set, is it accurate to say that about 68% of NBA games ended with teams within 14 points of one another for the 2014 NBA season? 
mean(shot_logs_2014$FINAL_MARGIN) + sd(shot_logs_2014$FINAL_MARGIN)
#   Yes, m + sd = 13.5. Rule valid for all data.


#* 3.6.0.3 Exercises ----
#** Exercise 3.11 ----
# Find the number of weight outliers using the z-score rule (|Z|>3) in the hkhw data set.
subset(hkhw$Weight.lbs, abs(scale(hkhw$Weight.lbs)) > 3.0)

View(cbind(hkhw$Weight.lbs, scale(hkhw$Weight.lbs)))

hist(hkhw$Weight.lbs)
hist(scale(hkhw$Weight.lbs))

# No outliers


#** Exercise 3.12 ----
# Create a weight percentile column on the hkhw data frame, and find the percentile of the third child’s weight. 
hkhw$Z_weights <- scale(hkhw$Weight.lbs)

hkhw$weight.percentiles <- pnorm(hkhw$Z_weights) * 100

head(hkhw)


#** Exercise 3.13 ----
# Make a boxplot comparing the assists per game by position in the nba_pgs_all_players_2016 data set.
# How many outliers are there using Tukey’s rule at the SG position? 

boxplot(nba_pgs_all_players_2016$AST ~ nba_pgs_all_players_2016$Pos, col = "coral",
        main = "Assists for Different POsitions", xlab = "Position", ylab = "Assists")

# 1 outlier

subset(nba_pgs_all_players_2016[, c("AST", "Pos")],
       nba_pgs_all_players_2016$Pos == "SG" &
         nba_pgs_all_players_2016$AST > quantile(nba_pgs_all_players_2016$AST, 0.75) + 1.5*IQR(nba_pgs_all_players_2016$Pos))


#** Exercise 3.14 ----
# For the mtcars data set should we make a boxplot or a scatter plot to look for a relationship between the mpg column and the disp column?
head(mtcars[, c("mpg", "disp")])
#   Both are continuous, so scatter plot

plot(mtcars$mpg ~ mtcars$disp, main = "MPG v/s Disp")
#   increasing displacement gives lower mpg


#** Exercise 3.15 ----
# Load the PlantGrowth data set using the command data(PlantGrowth).
# Should we use a boxplot or a scatter plot to look for a relationship between the weight column and the group column? 
data("PlantGrowth")

head(PlantGrowth)
# group categorical, so boxplot

boxplot(PlantGrowth$weight ~ PlantGrowth$group, main = "Weight by Group")


#* 3.11 Homework ---------------------------------------------------------
#** 3.11.0.1 Concept Questions: ----
#*** 1. ----
# What is the goal of exploratory data analysis? Is it subjective?
#   To understand the data, including
#     data types of each column
#     distributions/spread of data by various slices
#     identify outlier/missing data
#     relationship between various datra points
#   It is subjective


#*** 2. ----
# What should one consider when looking at a histogram of a data set, i.e. what is subjective about a histogram plot?
#   depending on how the bins are created the information shown by the histogram might change.


#*** 3. ----
# What does it mean to say that a data distribution is skewed? How can we detect skewness?
#   if the median is different from the mean the data is skewed.
#     it means that there are extreme values on one side of the data
#   skewness can be detected by using histogram


#*** 4. ----
# Give an example for when the median should be used instead of the sample mean as a measure of central tendency.
#   when there is skewness in the data


#*** 5. ----
# When should one use Chebyshev’s Rule versus the Empirical Rule?
#   Chebyshev - any data
#   Empirical - when normal distribution


#*** 6. ----
# When can Z-scores be used for detecting outliers versus Tukey’s Rule?
#   Z-scores - when data is symetrical
#   Tukey - always


#*** 7. ----
# What are some dangers in leaving outlier’’ data points out of your data set?
#   outliers might have specific meaning, abd leaving them out could lead to loss of information


#*** 8. ----
# Which plot would you use to look for a relationship between the location of a basketball game (Home or Away and the number of passes in the game?
#   Boxplot


#** 3.11.0.2 Practice Problems: ----
#*** 1. ----
# It has been asserted that income inequality is on the rise in the United States and around the world.
# How might we be able to capture this trend with our summary statistics?
#   create histogram to capture the spread of data
#   if inequality is present then data should be right skewed

# In particular, if only the top 1% richest people in the US have seen their wages increase how will this effect the median of the income distribution?
#   median is impacted by outliers

# How would the mean of the income distribution be affected by the wealthy getting wealthier?
#   mean would increase

# Which measure would you use?
#   median


#*** 2. ----
# Make a histogram and box plot for the rebounds per game in the NBA Players Stats 2016-2017 data set (nba_pgs_all_players_2016).
hist(nba_pgs_all_players_2016$TRB, main = "Histogram of Rebounds")    # Assuming TRB is rebounds

# Are there any outliers?
subset(nba_pgs_all_players_2016$TRB, nba_pgs_all_players_2016$TRB <
         quantile(nba_pgs_all_players_2016$TRB, 0.25) - 1.5*IQR(nba_pgs_all_players_2016$TRB))

subset(nba_pgs_all_players_2016$TRB, nba_pgs_all_players_2016$TRB >
         quantile(nba_pgs_all_players_2016$TRB, 0.75) + 1.5*IQR(nba_pgs_all_players_2016$TRB))
#   There are outliers

# What is the IQR?
IQR(nba_pgs_all_players_2016$TRB)


#*** 3. ----
# Make a box plot to compare the rebounds per game by position in the NBA per game stats data set (nba_pgs_all_players_2016)

#   Assuming TRB is Rebounds
boxplot(nba_pgs_all_players_2016$TRB ~ nba_pgs_all_players_2016$Pos,
        main = "Rebounded by Position", xlab = "Position", ylab = "Rebounds")


#** 3.11.0.3 Advanced Problems: ----
#*** 1. ----
# Mushrooms
# Load the mushroom data set in R using the command data(mushrooms).
names(mushrooms)

# Use the help page for this data set to look at what each of the columns tells you ?mushrooms.
?mushrooms

# The mushrooms$class variable is a categorical variable with two levels e and p standing for edible and poisonous.
# Make a bar chart of the fraction of edible and poisonous mushrooms in the data set.
barplot(prop.table(table(mushrooms$class)), main = "Count by Class")

# How many poisonous mushrooms have cap.shape of b for bell?
table(mushrooms$cap.shape)


#*** 2. ----
# Geese Flocks
# Load the geese_flocks data set (same procedure as the mushroom data set).
names(geese_flocks)

# Make a histogram of the geese flocks sizes.
# Is this a mound shaped distribution?
hist(subset(geese_flocks$flock.size, geese_flocks$flock.size > 0), breaks = 60, main = "Flock Size Count")
#   Not mound shaped. Righ skewed

# What is the largest goose flock observed?
max(geese_flocks$flock.size)

# On how many days were geese observed in the fields?
NROW(geese_flocks$flock.size) - table(geese_flocks$flock.size)[["0"]]


#*** 3. ----
# Credit Card Fraud Detection:
# You are setting up alerts for your credit card and need to tell the bank when you should be notified via text message that a purchase has been made.
# Most of your purchases are small and let us assume you don’t want the bank blowing up your cell phone every time you buy a coke.
# From your back records you see that your average purchase is 5 dollars with a standard deviation of 5 dollars.

# Is this distribution of your purchase amounts likely to be symmetric?
#   No. There will be purchases of bigger amounts skewing the data.

# If you want to be notified for than 25% of the purchases what should you set your threshold?
#   Z = 25% = 0.25
#   mean = 5
#   sd = 5
#   Z = (x - mean)/sd
#   x = Z*sd + mean
#   threshold = (0.25*5) + 5 = 6.25


#*** 4. ----
# Gerrymandering:
# Imagine that we have ten voters where three vote for Steve and seven vote for Amanda {A,A,A,A,A,A,A,S,S,S}.
# If we look at the whole set together then the Amanda has won the election.
# However, imagine that you can place these votes into three districts however you want.
# Whoever has the majority in the district collects 1 pt and the loser gets 0 pts.
# If they tie in the district then both get 0 points.
# Whoever has the most points wins the election.
# For example,
#   you could group the entries {A,A,A}, {A,A,A}, {A,S,S,S}, then the Amanda gets two points and Steve gets one point, thus, Amanda wins the election.

# Can you come up with a grouping where Steve wins the election?
#   {S}, {S,S,A}, {A,A,A,A,A,A}

# If Amanda received 8 votes, and Steve only 2, can you find a grouping (with 3 districts) where Steve wins?
#   {S}, {S,}, {A,A,A,A,A,A,A}


#*** 5. ----
# Curving Grades:
# Lets, say that a professor wants to curve the grades on his exam because the mean score is only a μ = 50.91 with a standard deviation of σ = 15.92.
# Without looking at the distribution of scores, he assumes that it will be a symmetric mound-like’’ distribution.
# He curves the scores by saying that
#   anyone who scored better than μ+σ will receive an A,
#   those with scores in the interval (μ−σ,μ+σ) we receive a B and
#   those in the region (μ−2σ,μ−σ) will get a C.
#   Any students with scores in the region (0,μ−2σ) will get an F.

# If the professor’s assumption is correct that the distribution in mound-like and symmetric, then about how many students will receive each letter grade?
#   mean  = 50.91
#   sd    = 15.92
#   Z     = (X - mean)/sd

#   Using Emperical rule
#     B = (mean - sd, mean + sd)                      = 68%
#     A = >(mean + sd)              = (1-68%)/2       = 16%
#     C = (mean - 2sd, mean + sd)   = (95% - 68%)/2   = 13.5%
#     F = <(mean - 2sd)             = (1 - 95%)/2     = 2.5%

# The grade distribution, z scores and assigned letter grades for the imaginary class are given in GradeCurveHW.
# This can be loaded by typing data(GradeCurveHW).
names(GradeCurveHW)

# Make a histogram of the raw exam scores.
hist(GradeCurveHW$Score, main = "Hist of Score")

# Take a look at the letter grades assigned by the professors grade curve scheme using z-scores.
# How many B’s and C’s were given?
table(GradeCurveHW$letter.grades)

# Given this information about the class can you discover what went wrong in this grade curving scheme?
GradeCurveHW
#   Students above Z = 1 were given B instead of A
#   and there are no Z <= -2

# Describe a better way of curving the grades, which will give 25% A’s, 50% B’s and 25% C’s.
#   Using Quintiles
#     A - above 75% quantile
#     B - IQR range
#     C - below 25% quantile
