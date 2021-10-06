# Links -------------------------------------------------------------------
#* Additional Reads ----
# https://faculty.nps.edu/rbassett/_book/


#* Datasets ----
# https://github.com/khannay/HannayIntroStats/tree/master/data
# animal_sleep      BirdCaptureData       crime_cluster       demographic_data
# Employee_Data     flightNYC             flightNYCFull       geese_flocks
# GradeCurveHW      hkhw                  Hogwarts_Heights    Lebron_James_2016
# mushrooms         nba_pg_2016           nflplays            poincare_bread
# shot_logs_2014    toad_girth            wine_tasting        NBA_Draft_Data
# bacon_data        cricket_chirps        alligator           kidiq
# census.us.pop     food_college          videoGameSales      NBA_Salaries_2017
# soccer_coach      
# AmesHousing_Regression                  bad_drivers_cluster
# Gambling_HW_Normality                   seaice_dec_northern
# HR_Employee_Attrition                   nba_pgs_all_players_2016
# Young_People_Survey                     StudentsPerformance
# Distel_Turtle_Data                      


# https://cran.r-project.org/web/packages/fivethirtyeight/vignettes/fivethirtyeight.html
#   https://github.com/rudeboybert/fivethirtyeight/tree/master/data
#   https://github.com/fivethirtyeight/data  - original raw data containing csv
# candy_rankings        drug_use              


# Datasets
path_dataset <- ".."

load(paste(path_dataset, "animal_sleep", ".Rdata", sep = ""))
load(paste(path_dataset, "candy_rankings", ".rda", sep = ""))

candy_rankings <- read.csv(paste(path_dataset, "candy_rankings", ".csv", sep = ""))


#* Additional Functions ----
# https://github.com/khannay/HannayIntroStats/tree/master/R
# ElbowClusterPlot      grabNumeric           t.test.hand
# StatePlot             diagRegressionPlots   generateCorrelatedErrors
# dropLowFactors


# Additional Functions
path_add_func <- ".."

source(paste(path_add_func, "StatePlot", ".R", sep = ""))


#* Shiny ----
# https://github.com/khannay/HannayIntroStats/blob/master/inst/shiny-examples/
# runHannayApp          SamplingDemo          

# Additional Functions
path_shiny <- ".."

source(paste(path_shiny, "runHannayApp", ".R", sep = ""))


# ____----


# Library -----------------------------------------------------------------
library(HannayIntroStats)    # not installed
library(tidyverse)           # used for cleaning using tidyverse::fn()
library(dplyr)
library(maps)
library(cluster)
library(shiny)
library(corrplot)


# ____----


# Chapter 1 Preface -------------------------------------------------------
#* 1.1 Librarian or Farmer? ----------------------------------------------
#_----


#* 1.2 Profits -----------------------------------------------------------
#_----


#* 1.3 Accidental Deaths -------------------------------------------------
# ____----


# Chapter 2 Introduction to R ---------------------------------------------
#* 2.1 What is R? --------------------------------------------------------
#_----


#* 2.2 R Packages --------------------------------------------------------
# To install the class R package you will need to run the following commands:

install.packages("devtools") # get the package installing package
devtools::install_bitbucket(repo="khannay/hannayintrostats.git") # install the class R package

# You will only need to run these install commands one time.
# From now on you can start your R session by giving the command:

library(HannayIntroStats)

# Remember to load the class R package when you open RStudio using library(HannayIntroStats) 


#_----


#* 2.3 R as a Fancy Calculator -------------------------------------------
#** 2.3.0.1 Basic Operations ----
# The console in R can be used like a very powerful calculator:
2+3 # add two numbers

2-3 # subtract two numbers

2*3 # multiply two numbers

2/3 # divide two numbers

2^3 # raise 2 to the third power

# R also has many functions which we can use just like on a calculator.
# For example we can use the trigonometric function sin(x):
sin(10.0)

# Or we could use the exponential function y=ex easily using:
exp(2.0)

# You can always look up what a function does using:
?exp
# which will bring up the details of what that function does in RStudio.
# You can also search for a function using the RStudio help menu.

# R has many functions which aren’t typically on a calculator.
#   example, I will use the print() function a bunch in these notes.
#   This just prints a variable to the screen.


#** 2.3.0.2 Variables in R ----
# You won’t use the R command line very long before you want to save the value of a computation.
# This is easy to do in R:

x = 2
y = x + 2
print(y)

# The first line says define the value of x as 2, the second line define y as the value of x+2=(2)+2=4.


# One note is we come back later and change the value of x, the value of y won’t change automatically.
# You need to run the y=x+2 line again to update y if you change x.

x = 2
y = x + 2
print(y)

x = 3;
print(y)


# As a note you can use either the equals sign x=2 to assign a variable a value, or you can use the “arrow” way x<-2.

x <- 2;
y <- x + 2
print(y)


# Within Rstudio you can always see what variables are defined during your current session in the upper right panel under the environment tab.


#*** Exercise 2.1 ----
# Open RStudio and use R as a calculator to find the value of 2^3+exp(3)/10 in the console. 
2^3+exp(3)/10


#_----


#* 2.4 More Advanced R ---------------------------------------------------
#** 2.4.1 Data Types in R ----
# R stores the variables as one of a few different types,
# Data Type       Example
# logical         TRUE/FALSE
# numeric         1.23, 2.3     decimal numbers
# integer         0,1,-1,2,-2, etc
# character       ‘abc’, ‘Hannay’, etc
# factor          A categorical variable which takes on a small number of values
# and a few types we should never need to use.


# Note that for the character types I use quotes around them, this tells R to consider that as a character and not a variable name.
# You can use either single or double quotes as long as they match.
# The data type shouldn’t matter much as R typically picks the correct type for our variables automatically.


# If you are curious you can check what type a variable is using the class() command:
last.name<- "Hannay"
class(last.name)

age <- 22
class(age)


# If you want to change the type of a variable you can use the as.numeric, as.character, as.integer, etc functions.
#   example, if we want to store age as a integer instead as a numeric type we could use:
age.int <- as.integer(age)
class(age.int)


#_----


#* 2.5 Logic in R --------------------------------------------------------
# The logical types are returned when we ask the computer true/false questions like:

old <- age.int > 30;
print(old)
# The answer to whether the integer called age.int is greater than 30 is FALSE.

class(old)
# We can see that R stores the answers to our true/false questions using the logical type.


# The most basic logical operations we can do are comparisons.
# To put these into R we need the following notations.

# What is we want to ask R more complicated logical questions for example how can we ask whether a number a is between 1 and 2.
# Mathematically this would look like: 1<a<2.
# The key is to notice this is really just two of our questions from before stacked together.
# We want to know if a>1 AND if a<2.

# To ask this question in R we can use the && operator.

a = 2.8
(a > 1) && (a < 2)

a = 1.6
(a > 1) && (a < 2)


# We may also want to ask the logical questions which involve using OR.
#   example, we can ask whether a character equals apples OR oranges.

# We denote an OR question in R using the notation ||.
# This one doesn’t make as much sense as the && for and but this is the standard notation for computer scientists.

a = 'apples'
(a == 'apples') || (a == 'oranges')


a = 'grapes'
(a == 'apples') || (a == 'oranges')


# We may also reverse the answer to a logical question using the NOT operator !.
# This just reverses our answer TRUE becomes FALSE and FALSE becomes TRUE.

a = 'grapes'
!((a == 'apples') || (a == 'oranges'))


?base::Logic


# You might rightly ask can we really do everything we will want to do with these relatively simple logic operations?
# Pretty much, as long as we learn to ask the questions in the right way.
# Perhaps I am biased but my field of mathematics is basically just a bunch of these logical operations chained together in new and interesting ways.
# Also these logical operations underlie the mechanics of computers used for everything from guiding missles to posting pictures of cats on instagram.


# Notice that testing for equality uses a double equal sign (==).
# This is because the single equals sign is already being used to save a variable to memory.
# This is a very common error! 


#_----


#* 2.6 Storing Data in R -------------------------------------------------
#** 2.6.1 Vectors ----
# Statistics involves analyzing large collections of data, so individually naming each variables would be a huge waste of time.
# We need a way to store a collection of related data and give them a single name.
# For this we have vectors in R.

x <- c(1,2,3)

# The c here is a function which concatenates the collection of numbers 1,2,3 into a single vector.
# If we do operations on vectors they act on each entry individually.

x+1 # add one to each number in x

x^2 # square each number in x

x>2 # for each number in x, ask the question is x greater than 2? 


# If we want to access the entries of x individually we can use brackets x[1] to get that entry individually.
# For example the first entry of x can be accessed using:
x[1]

# The third entry:
x[3]


# If we try to access the an entry in a vector which isn’t there we get NA back,
x[4]
# which stands for Not Available.


# To avoid this we can always find the length of a vector (number of entries) using:
length(x)


# We can also add all the values in a vector using the sum command,
sum(x)


# Besides creating vectors using the c function and manually typing them in R provides many other ways to create vectors.
#   example the seq function, short for sequence, can be used to get a vector with a sequence of values separated by an increment:
seq(0,10,1)    # created a vector with values going from 0 to 10 by 1

# as another example
seq(0,1,0.1)

# The seq command can be useful if we want to apply a function to a vector of evenly spaced values, e.g.

x.example <- seq(0,5,0.1)    # values from 0 to 5 every 0.1
y.example <- exp(x.example)  # the exponential of each value in the x vector
print(y.example)


# Later we will see how to create of plot of the exponential function by plotting x.example versus y.example:


# We can also use our logical operators to slice a vector.
#   example, suppose we want to get only the elements in our y.example vector which are less than or equal to 50.
y.example[y.example <= 50.0]

# This R command translates to “give the elements of the vector y.example where the logical statement y.example<=50.0 is true.”


#*** Exercise 2.2 ----
# Make a vector in R with the numbers 1,2,3,4,5 and save it under the name my_vec.
# Slice your vector to vector to get only values greater than 3. 
my_vec <- seq(1,5,1)
my_vec[my_vec > 3]


#_----


#** 2.6.2 Data Frames ----
# We will find that vectors are still inconvenient when dealing with many statistical data sets.
#   Imagine are looking to come up with a statistical way of measuring body mass index.
#   We collect the genders, heights, weights, and ages of the study participants.
#   We could try and store this data as four separate vectors (one for each category of our data) but this is unwieldy.
#   Moreover, storing them as four seperate vectors we lose the knowledge that they are all connected as part of our BMI study.

# Instead we can create one data frame variable which stores all this information:

# Create the data frame.
BMI <-  data.frame(
  gender = c("Male", "Male","Female", "Male", "Female", "Female"), 
  height = c(81,93, 78,100,92,75),
  weight = c(152, 171.5, 165,140,192.1,180.2),
  Age = c(42,38,26,52,18,23)
)

print(BMI)


# This way we can name the columns (gender, height, weight, Age) and store all this related information under one name.
#   If you have my package installed and loaded you can load this data set in by typing data(BMI_Example).
#   To get a look at the data in a spreadsheet type format you can type View(BMI_Example).

# If we want to see the names of the columns we can use the command:
colnames(BMI)


# We can see the size of this data set (rows by columns)
#   using the command dim or
#   by looking at the information provided in the enviroment tab in the top right of the RStudio window.

dim(BMI)


# From a data frame it is easy to access a single column.
#   example if we want to look at just the ages we can use the $ command:
BMI$Age    # get the Age vector from the dataframe named BMI


#   Of if we want to see the weights we use the command:
BMI$weight    # get a vector of the weights in the BMI data frame


# Individual entries in the data frame can still be accessed easily as well.
# However, now we need to give the row and column numbers (instead of just the one index in a vector)
BMI[2,3]    # Get the entry in the data frame in the second row, third column (weight of the second participant)


# We could also have gotten this information by specifying the column using the dollar sign $ and the row as a single index.
BMI$weight[2]


# Finally, if we want to look at a row of our data we can use:
BMI[2,]    # Get all the data for the second participant in the study

# Notice the use of the comma.


# If you are worried that it will be a pain to type in the data.frames– don’t worry I will show you how to read data frames in automatically from spreadsheets of data.
# In addition, most of the data sets used in the class will be loaded using the command data() from the R console.
# You won’t spend much time typing in data sets into R.


#*** 2.6.2.1 Filtering Data Frames ----
# Now comes the real cool part of R, and a big reason why it is used so much.
# Data frames are a powerful tool for keeping large collections of data organized, but often we will want to consider just a subset of the data.
#   example, in our body mass index BMI data frame above we might want to just consider the entries where the gender is female.

# Therefore, we want to consider just a subset of the available data.
# Intuitively, we can do this using the powerful subset command in R.

BMI.FEMALE <- subset(BMI, BMI$gender == 'Female')
print(BMI.FEMALE)


# The new data frame BMI.FEMALE has only the entries where the gender is Female.
# Once again notice the use of the double equal sign ==, it used to ask if the entry is equal to a given value.
# When using subset the first entry is the whole set we are trying to extract a piece from, and the second entry gives the logical condition for the piece we want to grab.

#   another example imagine we are interested in looking only those participants who are over the age of 30.
#   Then we could filter the data frame using:

BMI.OLD <- subset(BMI, BMI$Age > 30)


# We will see many examples of using filtering to look at subsets of data in the class.
# You will be expected to be able to perform basic filtering of data frames on all of the assessments in this class.
# It is worth your time to learn how to do this now!


#**** Exercise 2.3 ----
# Load the animal sleep data frame by typing the command data("animal_sleep") into the R console.
# Look up the help page for this data set using the command ?animal_sleep.
#   The help pops up the the lower right panel in RStudio.
#   All the data sets I provide in the class will have a help page like this telling you what each column in the data set means.
# Filter this data frame to keep only rows where the vore column is equal to carni.
# How many rows are left in this subset?
load(paste(path, "animal_sleep", ".Rdata", sep = ""))

head(animal_sleep)

carni <- subset(animal_sleep, animal_sleep$vore == "carni")
head(carni)

dim(carni)


#**** Exercise 2.4 ----
# Load the geese flocks data set using the command data(geese_flocks) filter this data frame to have only rows (observations) where the flock.size is greater than 50.
# How many rows are left in this reduced data frame? 

dim( subset(geese_flocks, geese_flocks$flock.size > 50) )


#_----


#* 2.7 Basic Plots in R --------------------------------------------------
# R has an extremely powerful library of functions for producing pretty plots of data.
# We will only use a few of these commands in the course of the class.
# For now lets assume we want to plot the height and weight variables from the BMI data frame.

plot(BMI$height, BMI$weight)


# This gives a plain plot with the height on the x-axis and the weight on the y-axis.
# Notice that R automatically labels the axes using the names given by the data frame (BMI$height and BMI$weight).
# We can easily improve the aesthetics of the plot using a few extra parameters to the plot function.

plot(BMI$height, BMI$weight, main = 'BMI Height versus Weight', col = 'red')


#   The keyword main changes the title of the plot, and
#   the keyword ’col` changes the color of the points to being red.


# If for some reason you wanted to change the x-axis and y-axis labels this can easily be done as well:

plot(BMI$height, BMI$weight, main = 'BMI Height versus Weight', col = 'red', xlab = 'Height', ylab = 'Weight')


# The xlab keyword changes the x-axis label and likewise for the ylab keyword.
# Within RStudio you can view the plots and save them as images easily.

# Notice the use of quotes around the inputs for the axis labels and the plot title.
# This tells R that these are character types and not some variable named Height, etc.
#   This is a common mistake in using R.

# As a note for the class, producing pretty plots is not really our goal so you are not required to produce plots which are easy on the eyes.
# However, it is important to produce plots which are readable and convey the correct information.
# To this end it will be a good idea to get used to labeling your graphs axes and giving each graph an informative title.

# The graphics commands we learn in R will all have the same keyword arguments (as long as they make sense for that plot).
#   example, main=‘Blah’ will set the title of the graph to be ‘Blah’.

# We we be using basic plots in R for this course, but you can make some really pretty plots using another R package called ggplot2 (a more fancy plotting library).


#_----


#* 2.8 Additional Resources ----------------------------------------------
# If anyone reading this has a background in computer programming then you are probably wondering if R has all the features you are used to in other programming languages.
# The answer is yes (for the most part).
# R is a full programming language with the usual conditional statements (if, else, etc) and loops (for, while) that you are used to.
# We won’t focus on the computer programming aspects in this class but their are many resources online for learning the full R programming language. 


#_----


#* 2.9 Homework ----------------------------------------------------------
#** 2.9.0.1 Concept Questions ----
#*** 1. ----
# What are the fundamental data types in R?
#   2.4.1 Data Types in R 


#*** 2. ----
# Explain the difference between using = and == in R.
#   =     - Assignment operator
#   ==    - Equality check


#*** 3. ----
# What does the command rep do in R? Look at the help page for this function
#   rep() - repeats the values of x "n" number of times
    base::rep(age.int, 10)


#*** 4. ----
# How can I convert the data type of a variable from an integer to a factor?
  as.factor(age.int)


#*** 5. ----
# For what numbers will the following logical statement evaluate to TRUE? !((a>10)||(a<1))?
#   for any number between 1 & 10
    a <- 5; !((a>10)||(a<1))
    a <- 11; !((a>10)||(a<1))


#*** 6. ----
# Look up the help for the rep command in R. Create a vector which has 100 copies on 23 in it.
    rep(23, 100)


#** 2.9.0.2 Practice Problems ----
#*** 1. ----
# Make a scatter plot of the parabola y=x^2 for x between [-1,1] in R.
  x <- seq(-1,1,0.01)
  plot(x = x, y = x^2, main = "Parabola y = x^2")


#*** 2. ----
# Create a vector with the numbers 1,2,3,4,5 and call this vector x:
#   Type x==1, what does the result produced mean? What is R doing?
#   Type x>2, what does the result tell you?
      x <- seq(1,5,1)
      x == 1    # check if each element equal to 1
      x > 2     # check if each element greater than 2


#** 2.9.0.3 Advanced Problems ----
#*** 1. ----
# Install R and R Studio on your laptop (if you have one) and follow the directions at the start of these notes to install the class R package.
#   Done


#*** 2. ----
# Load the mtcars data set by typing data(mtcars).
data("mtcars")

# Bring up the help page for this data set by typing ?mtcars.
?mtcars

# How many cars are there in the data set total?
dim(mtcars)

# How many cars with 6 cylinders?
dim( subset(mtcars, mtcars$cyl == 6) )

# How many cars weight more than 4000 lbs? Hint the wt column gives the weight of the cars in 1000’s of pounds.
dim( subset(mtcars, mtcars$wt > 4) )

# How many cars weight more than 2000 lbs AND are four cylinders?
dim( subset(mtcars, mtcars$wt > 2 & mtcars$cyl == 4) )

# Create a new column on the mtcars data set which is given by the weight of the car divided by its horsepower.
# What is the value of this new column for the Volvo 142E car?
subset(mtcars$wt / mtcars$hp, rownames(mtcars) == "Volvo 142E")

# How many cars get better than 20.0 miles per gallon?
dim( subset(mtcars, mtcars$mpg > 20) )


#*** 3. ----
# Load the wine_tasting data set data(wine_tasting).
colnames(wine_tasting)

# What is the size of this data set? rows x columns
dim(wine_tasting)

# How many wines in the data set are less than 100 dollars in price?
dim( subset(wine_tasting, wine_tasting$price < 100) )

# How many wines are from the united states? This is stored with the name “US” in the country column
dim( subset(wine_tasting, wine_tasting$country ==  "US") )


#*** 4. ----
# You can generate a vector of random numbers of length N using the command rnorm(N).
# Generate a random vector of length 1000 using rnorm and save it under the name rx
rx <- rnorm(1000)

# How many of the entries in this vector are positive? Hint use logical vector slices
sum(rx > 0)


#*** 5. ----
# We can also do some simulations in R using the sample command.
# Look up the help page for this command using ?sample.
#   As an example, suppose I want to generate the results of random (fair) coin flips in R.
#   We can do this using the sample command.
#   The below command generates 100 random coin flip results.
#   To use the sample command we put in a vector of outcomes, then set the number of draws to perform (size=100).
#   The final options says that we should draw from the full list of options each time (otherwise we can have no repeats)

coin.options = c('H','T')
sample(coin.options,size = 100, replace = TRUE)


# Generate 1000 rolls of a fair six-sided dice using the sample command and save the result.
dice <- sample(seq(1,6,1), size = 1000, replace = TRUE)

# How many 6’s appear in your simulation? Does this change if you run a new simulation?
sum(dice == 6)    # results change on rerunning the simulation  


#*** 6. ----  
# Load the candy rankings data set using the commands:
library(fivethirtyeight)    # not loaded
data("candy_rankings")


# Look at the help page for this data set to see what the various columns mean.
?candy_rankings


# How many candies are in this data set?
dim(candy_rankings)

# What R data type is being used to store the chocolate column?
class(candy_rankings$chocolate)

# How many candies contain nougat?
dim(subset(candy_rankings, candy_rankings$nougat == TRUE))


#_----


# Chapter 3 Exploratory Data Analysis -------------------------------------
#* 3.1 Shot Logs Basketball Data -----------------------------------------
# We load a data set (originally downloaded from kaggle.com) which has every shot taken during the 2014-2015 NBA season.
# This can be done by giving the commands:
library(HannayIntroStats)
data("shot_logs_2014")


# We can see what the columns of the data frame are using the colnames command:
colnames(shot_logs_2014)


# We can access each of these columns using shot_logs_2014$COL_NAME,
#   example shot_logs_2014$TOUCH_TIME gives the data for how long each player had the ball before taking the shot.


# You can also look-up the help page for that data set using the command:
?shot_logs_2014


#_----


#* 3.2 Principal Types of Statistical Data -------------------------------
# Data comes into two principle types in statistics, and it is crucial that we recognize the differences between these two types of data.

# Categorical Variables:
#   These are data points that take on a finite number of values, AND whose values do not have a numerical interpretation.
#   example,
#     “Male” or “Female”, the position of an NBA player, the species of a toad, the color of a mushroom, etc.
#     Each of these examples take on a finite number of possibilities, and it doesn’t make sense to add the colors or mushrooms, the species of toads, etc.
#   Many times these variables will have non-numerical names, however this is NOT the way to tell.
#   example,
#     smoker versus non-smoker could be encoded in our data as S versus NS, or it could be 1 versus 0.
#   The context of the data is the only sure way to tell whether a variable is categorical or not.

# Categorical variables may be divided into two sub-groups called ordinal and nominal variables:
#   Ordinal categorical variable
#     takes on values which can be logically ordered.
#     example,
#       the reviews for an product which are given as 0-5 stars.
#       We can say that 4 stars is closer to 5 stars then 1 star is.
#       Academic grades A,B,C,D,F provide another example of ordinal categorical variables.

#   Nominal categorical variables
#     cannot be put in any logical order.
#     Examples of this would be the gender, toad species, race, etc.

# Numerical Variables:
#   These are variables which are numerical in nature, so adding them together makes mathematical sense.
#   They can come in two principle subcategories, either discrete or continuous.

#   Continious Variables:
#     Take on a continious values (no breaks).
#     example, height, weight, reaction time for a chemical reaction, profits from a stock transaction, etc are examples of continuous numerical variables.

#   Discrete numerical variables
#     take on a set of values which can be counted.
#     example, goals scored by a soccer team, assists in a game for an NBA player, number of leaves on a spinach plant, etc.

# Here is a handy flow chart to help you keep these variable types straight:
#                               Variable
#                             /         \
#                       Numeric         Categorical
#                      /       \       /         \
#             Continuous    Discrete  Ordinal     Nominal


# We will develop different statistical approaches based on whether the data are numerical (discrete/continuous) or categorical in nature.
# R knows about this important distinction and we can let R know that a variable should be treated as a categorical variable by using the command as.factor.

shot_logs_2014$W = as.factor(shot_logs_2014$W)    # make sure that the wins column is treated as a categorical variable (factor)
class(shot_logs_2014$W)    # check the type of data stored in this column

levels(shot_logs_2014$W)    # give the options for a categorical variable


# The levels command tells us how many different categories are in the categorical variable.



#** 3.2.0.1 Exercises ----
#*** Exercise 3.1 ----
# Consider the PTS_TYPE column of the shot logs data set.
# Should this be considered a continuous or categorical variable?
unique(shot_logs_2014$PTS_TYPE)    # Pts type tells whether the shot was 2- or 3-pointer, hence is categorical.


#*** Exercise 3.2 ----
# How many levels does the Location variable have? What are they? Is this variable ordinal or nominal?
levels(shot_logs_2014$LOCATION)    # Tells away or home, hence nominal


#*** Exercise 3.3 ----
# What type of variable is the SHOT_CLOCK variable in the shot logs data set?
class(shot_logs_2014$SHOT_CLOCK)    # Shot clock is the time left for the offence to shoot. This is continuous.


#*** Exercise 3.4 ----
# How many shots are in the data set for away games? (Practice Filtering data sets in R)
dim(subset(shot_logs_2014, shot_logs_2014$LOCATION == "A"))


#_----


#* 3.3 The Distribution of a Data Set ------------------------------------
# The most crucial step to exploratory data analysis is estimating the distribution of a variable.
# We begin with continuous variables and the histogram plot.


#** 3.3.0.1 Histograms (Continuous Variables) ----
# First let us consider the distance measurements for every shot taken during the NBA season.
# This is over 128,000 distance measurements so just staring at these numbers won’t give us much insight into the data.

# We may be interested in the number of shots which are taken from a given distance.
# If we define bins for our data then we can count the number of shots between say 12-15 feet and compare this with the number in the other bins.
# This is called a histogram of the data.
# Luckily R has a built-in function for this.

hist(shot_logs_2014$SHOT_DIST, freq = TRUE,
     main = "Distances of NBA Shots 2015", xlab = 'Distance (ft)', ylab = 'Number of Shots', col = "light blue")


# The histogram tells us that nba players tend to either try to shoot from very close to the basket or from 3-pt shots.
# In fact we can compute that 25.8363129% of the shots taken were 3pt shots and 48.6049207% were taken from less than 12 feet.

# Notice that histograms can be very sensitive to the number of bins that you use.
# By default R will choose the number to bins used to be somewhat appropriate.
# However lets see what happens if we choose only a few bins for our histogram.

hist(shot_logs_2014$SHOT_DIST, freq = TRUE, breaks = 3,
     main = "Distances of NBA Shots 2015 (bad bins)", xlab = 'Distance (ft)', ylab = 'Number of Shots', col = 'cyan')


# The conclusions for our data is entirely different!
# With these large bins it looks like NBA players just try and get as close as possible to the basket.


# Always question the bin sizes for a histogram to see whether they are appropriate for the plot being presented.
# If you see a histogram with illogically large or small bin sizes and/or uneven bin sizes beware of the results being presented!

  
# For the purposes of this class you can usually just use the default number of bins in R, unless you have some special reason to change the number of bins.


# From our data we can also pull out individual players shot-chart for the 2015 season.
#   example, Steph Curry’s distribution of shot distances is given by,

sc_data<-subset(shot_logs_2014, shot_logs_2014$player_id  ==  201939)    # get only those rows (shots which were taken by Steph Curry)
hist(sc_data$SHOT_DIST, freq  =  TRUE,
     main = 'Steph Curry Shot Distances', xlab = 'Distance (ft)', ylab = 'Number of Shots', col = 'lightblue', breaks = 20)


#** 3.3.0.2 Tables (Categorical Variables) ----
# To investigate the distribution of categorical variables we will use the powerful table command to generate bar plots and/or pie charts.
#   example, if we use the table command on the LOCATION column of the the shot logs data set we get a count of the number of shots taken for home teams and away teams in the data set.

table(shot_logs_2014$LOCATION)


# To get a graphical representation we can use the output from the table command to make a bar plot.
# Here I have added the command prop.table outside the table command.
# This changes our table from raw counts to the proportion of the data in each category.

barplot(prop.table(table(shot_logs_2014$LOCATION)), main='Location of the Game')


# Another way to represent the proportions in each category is to use a pie chart.
# This is also easily done in R.

pie(prop.table(table(shot_logs_2014$LOCATION)), main='Location of the Game')


# Pie charts should not be used to categorical variables with many levels (options) or to present data where some levels are very rare.
# Pie charts can give a sense of the relative size but small differences in the proportions are hard to see.
# These data are better presented using a barchart.


# A common way of creating a misleading statistical plot is to make a pie chart where it is unclear what the whole pie represents.


# The table command can also be used to create an two-dimensional table based on the values of two categorical variables.
#   example, within the nba shot logs data set we could make a table:

table(shot_logs_2014$LOCATION, shot_logs_2014$SHOT_RESULT)


# We could then use statistical analysis we will learn in this class to examine whether NBA teams shot a higher percentage on shots during home games versus away games.

# We can also make this into a proportion table using the prop.table command.

prop.table(table(shot_logs_2014$LOCATION, shot_logs_2014$SHOT_RESULT))


#*** Exercise 3.5 ----
# For the nba shot logs data what is the appropriate way to plot the distribution of the column (variable) FINAL_MARGIN?
# Make the appropriate plot of this column.
hist(shot_logs_2014$FINAL_MARGIN, freq = TRUE, main = "Final Margin")


#*** Exercise 3.6 ----
# Load the mushrooms data set data(mushrooms).
# The class column tells us if the mushroom species is edible or poison.
# Make the appropriate plot of the distribution of this data.
# What proportion of the mushroom species in the data set are edible? 
barplot(table(mushrooms$class), main = "Mushroom class (Count)")

prop.table(table(mushrooms$class))
barplot(prop.table(table(mushrooms$class)), main = "Mushroom class (Proportion)")


#_----


#* 3.4 Numerical Measures for Central Tendency ---------------------------
# When examining data sets we will very often find mound shaped histograms.
# This mound shaped data tells us that the values tend to cluster about the central values.
# In describing data of this type it is useful to have a numerical method for finding the location of this central cluster. 


#** 3.4.0.1 Sample Mean and Median ----
# Within our NBA data set if we look at the time remaining on the shot clock when a shot was taken we find a mound shaped distribution.
# A histogram of this data is shown below:

all_shot_clock <- na.omit(subset(shot_logs_2014$SHOT_CLOCK, shot_logs_2014$SHOT_CLOCK < 24.0))

hist(all_shot_clock, freq = FALSE, breaks = 24,
     main = 'Time left on the shot clock', xlab = 'Time (sec)', col = 'light blue')


# Notice that unlike the shot distance data, this data has a single peak located around 12 seconds.
# This type of single hump distribution is very common in statistics and we would like a good measure for the location of the “hump”.


# Perhaps the most popular choice to measure this quantity is the sample mean:
#   ¯x = (1/N) * (N∑j=1)x[j]
#     where x[j] is the value of each data point in the sample.

# The sample mean ¯x can be computed in R using:
mean(all_shot_clock)


# Another measure for the central tendency in a data set is given by the median.
# The median is the middle number when the entries are sorted in ascending (or descending) order.
# If the data set has an even number of entries then we average the two middle most entries.
median(all_shot_clock)


# For this data set the median and the mean are very close to one another.
# This will be the case when the distribution of data values is has few extreme values (outliers) and the mound is symmetric.
# In this case the choice of the sample mean or median doesn’t matter much although we will see the mean is usually the better choice as it is easier to work with.


# However, lets pretend that out data set has one outlier.
# If we add one large point to our data set and recompute the mean and median we get:
  
sc_new <- c(all_shot_clock, 12000*60)
mean(sc_new)
median(sc_new)


# In this case the median is not effected by much, but the mean is strongly effected by the outlier.
# Therefore, the median is often used when a data set has outlier points.

# Imagine you are considering taking a job at a company.
# As part of your research you find the average (mean) salary of employees at this company is 931,818.2 dollars!
# However, the actual salaries for the ten normal workers at this company are all 25000 dollars, and the CEO makes 10 million a year.
# Therefore the average salary is quite high due to the CEOs enormous salary, although the median salary is only 25k.


# Beware of the mean of a data set being pulled very far away from the typical value by large outliers. 


#** 3.4.0.2 Skewness ----
# The difference between the mean and the median can also tell you about the skewness of the data.
# A data set is said to be skewed of one tail of the distribution is more extreme then the other tail.

# For a right skewed graph the median (black line) is typically less than the mean (blue line) (image).

# For a left skewed graph the median (black line) is typically more than the mean (blue line) (image).


#** 3.4.0.3 Mode ----
# The final method we will discuss for determining the “central tendency” of a data set is to use the mode.
# The mode is the value which appears most often in the data set.
#   example, in the data set [2,3,5,4,3,2,1,1,5,5,5,0] the mode is 5 as it appears four times.


# It might seem that the mode is a very good measure for the central clustering in a data set.
# However, it has a few problems.
# First, it is hard to define for continuous variables,
#   example
#     the data set 5.325296, 5.7694647, 4.7132227, 4.7833648, 4.8080121, 5.4131916, 5.8356347, 4.418998 technically has no mode as no value is repeated.
#     We could try and get around this by binning the data as we did to make histograms.
#     Then we can talk about the “modal class (bin)” instead of the raw value.
#     However, now the value of the mode depends on how we decided to bin the data.
#     This makes the mode subjective.


#   Also, the mode is more sensitive to the size of the data set used to find it than our other measures.
# Thus, we will avoid using the mode as a measure of the peak of the hump in a distribution whenever possible.
# However, in some applications using the mode may be the best choice.


#** 3.4.0.4 The Dangers of these Measures ----
# Be aware than anytime you try and reduce a data set to a single number summarizing it, information is lost!
# This is a bit like reading a one sentence summary of a thousand page novel.
#   example, a one sentence summary of the Harry Potter series is “Every summer, an evil sorcerer suddenly gets the urge to kill a young wizard.”
#   For any Harry Potter fans out there this is about as good as I can do in a single sentence but I wouldn’t say that does a great job in getting across the whole message of the books.


# So looking at only the mean, median, mode, etc for a data set at best gives you only a rough idea about the trends in the data.
# At worst these summary statistics can be grossly misleading.


#   example, if we look again at the distribution of shot-distances in the 2015 NBA season: 
hist(shot_logs_2014$SHOT_DIST, freq = TRUE,
     main = "Distance of NBA Shots 2015", xlab = "Distance (ft)", ylab = "Number of Shots", col = "light blue")

# As noted before this distribution shows two “humps” one corresponding to short distance shots and one for three-point shots.
# If we blithely ignore this and take the mean = 13.4437577 as the typical distance of a shot we miss this trend entirely!
# Likewise, with the median = 13.4.
# Clearly, the typical value for the shot distance variable is not either the mean or the median.


# Always use graphical presentations of the data before choosing a summary statistic for the data.


#*** Exercise 3.7 ----
# Find the mean and median of the FINAL_MARGIN column of the shot logs data set.
# Is this a mound shaped distribution?
mean(shot_logs_2014$FINAL_MARGIN)
median(shot_logs_2014$FINAL_MARGIN)

hist(shot_logs_2014$FINAL_MARGIN, freq = TRUE, main = "Final Margin")

# Mound with 2 peaks.


#*** Exercise 3.8 ----
# Load the Employee_Data data set, for the Performance.Score column what is the best measure of the central tendency of this variable? 
mean(Employee_Data$Performance.Score)
median(Employee_Data$Performance.Score)

hist(Employee_Data$Performance.Score, main = "Employee Performance Score")

# left skewed. median is the best measure.


#_----


#* 3.5 Numerical Measures of Variability ---------------------------------
#** 3.5.0.1 Variance and Standard Deviation ----
# If we know where the center of the mound is located in a mound-shaped distribution we still don’t know how wide the mound is about that point.
#   example the two plots below have the same mean but a very different width!


# Therefore, we need an additional numerical measure to describe mound shaped distributions.
# The most intuitive measurements for the spread of data is the range given by the difference between the largest and smallest values in the data set.

max(all_shot_clock) - min(all_shot_clock)    # range of a data set in R


# The range is a good thing to know about a data set, but it has a critical flaw.
# It can change drastically (even for large data sets) if we introduce one very large or small data point.
# Ideally, we want our summary statistics to be relatively unaffected by changes to a small percentage of the data points.


# Generally a better measure of the variability of data is given by the sample variance.
# Here we add up the squares of the differences between the data values and the sample mean ¯x.
# We then normalize this value by the number of data points N−1 so that the sample variance doesn’t grow with the number of data points.
#   s[^2] = (1/N−1) * [N∑j=1](x[j] − ¯x)/2


# Notice if we have constant values for our data d=[1,1,1,...1] then ¯x = 1 and s2 = 0 as this distribution has no width at all.


# In R we can compute the sample variance using the command var(). For the shot clock data we find the sample variance is:

var(all_shot_clock)


# Notice that since the variance is defined as the sum of squares it has weird units..
#   example if the data is measurements of tadpole tail lengths in inches, the variance will have units of inches2.

# To put things back in the original units of the data we can consider the sample standard deviation s = √s[^2].
# The sample standard deviation is given by the square root of the variance.
# In R we can just use the command:
sd(all_shot_clock)


# which gives us the same result as using:
sqrt(var(all_shot_clock))


#** 3.5.0.2 Understanding Data with the Standard Deviation ----
# If we know both the mean and the standard deviation of a data set we can use a couple of rules to help us get an idea of the whole distribution of values.
# In cases where we have the full data set we don’t really need to use these, but in the real world we often are given only the summary statistics (mean and standard deviation) for a data set.


# Our first rule works no matter what the underlying data distribution (histogram) is.

# Chebyshev’s Rule:
#   We can’t say anything about how much data is within one standard deviation for general data sets.
#   For any data set at least 34 of data points will lie within two standard deviations of the mean.
#   At least 89 of observations fall within three standard deviations of the mean.
#   In general for any k>1 at least 1 − 1/k[^2] of the observations will fall within k standard deviations of the mean.


#*** 3.5.0.2.0.1 Example Chebyshev’s Rule: ----
# As an example of using Chebyshev’s Rule lets consider the data set of NBA shot distances again.
# The rule tells us that without knowing anything about the data other than the sample mean ¯x=13.4437577 and the standard deviation s=8.7771132.
# We still know that at least 3/4 of nba shots were taken from (¯x−2s,¯x+2s) or (-4.1104688, 30.9979841).
#   Since the distances for the shots can’t be negative we could tighten this to (0.0, 30.9979841).

# Since we have the full data set we can check to see how well Chebyshev is doing.
# This code finds fraction of shots taken from less than 31.34 feet.

length(subset(shot_logs_2014$SHOT_DIST, shot_logs_2014$SHOT_DIST < 31.34)) / length(shot_logs_2014$SHOT_DIST)

# Well, 0.9992653> 0.75 for sure.
# However, since Chebyshev has to be true for ANY data set it has to be pretty conservative in its estimates.


# If we think the data set shows a mound-shape symmetrical distribution then we can do better than Chebyshev estimates.
# However, unlike Cheby we no longer have an iron clad mathematical guarantee.


# Empirical Rule
#   About 68% of measurements will lie within one standard deviation of the mean (¯x−s,¯x+s).
#   About 95% of measurements will lie within two standard deviations of the mean (¯x−2s,¯x+2s).
#   About 99.7% of measurements will lie within three standard deviations of the mean (¯x−3s,¯x+3s).


#*** 3.5.0.2.0.2 Example Empirical Rule: ----
# Lets consider the shot clock data set again:

hist(all_shot_clock, freq = FALSE, breaks = 24,
     main = 'Time left on the shot clock', xlab = 'Time (sec)', col = 'light blue')

# If we apply the empirical rule to the shot clock data set we get the prediction that 68% of shots were taken with between (6.6172216, 17.5387311) seconds on the shot clock.
# Using (¯x−2s,¯x+2s) the empirical rule tells us to expect 95% of shots were taken with between (1.1564668, 22.9994858) seconds on the shot clock.


# It might not seem like it now, but the empirical rule will play a big role later in this class.
# We will see later in the class that mound shaped distributions are the norm rather than the exception in statistics.
# Therefore, it is worth your time to commit the 68,95,99 rules to memory.

mean(all_shot_clock) - 2*sd(all_shot_clock)


#*** Exercise 3.9 ----
# Which rule (Cheby or Empirical) would you use to form a prediction interval for the Performace.Score column of the Employee_Data data set?
# What is the standard deviation of this variable?
sd(Employee_Data$Performance.Score)


#*** Exercise 3.10 ----
# Considering the FINAL_MARGIN column of the shot logs data set, is it accurate to say that about 68% of NBA games ended with teams within 14 points of one another for the 2014 NBA season? 
mean(shot_logs_2014$FINAL_MARGIN) + sd(shot_logs_2014$FINAL_MARGIN)
#   Yes, m + sd = 13.5. Rule valid for all data.


#_----


#* 3.6 Numerical Measures for Relative Standing --------------------------
#** 3.6.0.1 Quantiles, Percentiles, etc ----
# Lets consider another basketball data set, this one has the per game averages for all the NBA players who appeared in an NBA game in 2016-2017.
# We will look the points scored per game of the players (PPG), for only those players who appeared in more than 50 games .
PPG <- subset(nba_pgs_all_players_2016$PPG, nba_pgs_all_players_2016$G > 50)    # Get the PPG for only those players who appeared in more than 50 games


# This leaves a total of 307 players in our data set.
# We can make a histogram of the PPG averages of the NBA players:
hist(PPG, col = 'coral', main = 'NBA PPG 2016-2017', xlab = 'PPG', freq = TRUE, breaks = 20)


# If we sort this list and choose the middle entry (or average the two closest to the middle) we have the median value (median=9.2).
# The definition of the median means that 50% of the players in the NBA scored less than 9.2 PPG in 2016-2017, and 50% scored more.


# In the same way we could find the PPG average where 75% of players scored less than that (it is 13.65).
# These more general “median” type numbers are known as the quantiles of the data.
# In R we can find quantiles for any percentage we are interested in using:

quantile(PPG,0.90)

# This command tells us that 90% of NBA players score less than 20.18 points per game.


# Quantiles are useful because like the median they are resistance to the effect of outliers and non-symmetric distributions.
# The default quantile command in R gives the quantiles at 25% increments:

quantile(PPG)


# These are some of the most common quantiles to consider.
# The difference between the 25% and 75% quantile is known as the inter-quartile range IQR=Q0.75−Q0.25.
# The R command for this is given by:

IQR(PPG)


# The IQR gives a measure for the spread of the data which is resistance to the presence of outliers (extreme values) in the data.
# Therefore, it is often used as a criteria for identifying outliers in the data.


# Outlier: Tukey’s Rule of Thumb
#   Any value is greater that Q[0.75] + (3/2 * IQR) can be considered an outlier
#   Any value less than Q[0.25] - (3/2 * IQR) can be considered an outlier

# If this already seems like to much information you are in good company.
# The box plot or (box and whisker plot) was invented to summarize the quantile information about a data set graphically.

# Box plots are very easy to make in R:
boxplot(PPG, main = 'Box Plot of PPG', ylab = 'PPG', col = 'bisque')


# How to read Box Plots:
#  The thick line in the middle of the box gives the median value.
#  The top of the box shows Q[0.75]
#  The bottom of the box shows Q[0.25]
#  So the height of the box in the IQR
#  The top whisker —| shows Q[0.75] + (3/2 * IQR), the upper cutoff for outliers using Tukey’s rule
#  The bottom whisker —| shows Q[0.25] - (3/2 * IQR), the lower cutoff for outliers using Tukey’s rule
#  Any data points (circles) show outlier values


# Actually, R only goes to the full length of the whiskers if there are outlier points in that direction for the data set, otherwise the whisker will stop at the most extreme data point in that direction.
# This is why the lower whiskers in the above data set stop at zero.


# If you are curious here are the players which are considered ‘outliers’ in our analysis:
nba_pgs_all_players_2016$Player <- as.character(nba_pgs_all_players_2016$Player)

upper.outlier.bd <- quantile(PPG,0.75)+1.5*IQR(PPG)

subset(nba_pgs_all_players_2016$Player, nba_pgs_all_players_2016$PPG > upper.outlier.bd)


# If you are a basketball fan you will know these outliers make sense because they are the best players in the league .


#** 3.6.0.2 Z-scores ----
# For mound shaped and symmetric distributions another method of detecting outliers and computing percentiles is commonly used.
# This method relies on computing z-scores and for a data point X the z-score is given by:
#   Z = (X − ¯x)/s
#     where
#       ¯x is the sample mean of the distribution and
#       s is the sample standard deviation.
# The z-score measures the distance of a data point from the mean in units of the standard deviation.
#   So a Z = 2.0 means the data point is two standard deviations above the mean,
#   Z = −1.0 means the data point is one standard deviation below the mean, etc.

# You might guess that z-scores are nicely paired with the empirical rule.
# Using Z-scores we can rephrase the empirical rule for mound-shaped distributions as:
#   About 68% of data points in a mound shaped distribution will have |Z|<1.0
#   About 95% of data points in a mound shaped distribution will have |Z|<2.0
#   About 99.7% of data points in a mound shaped distribution will have |Z|<3.0


# To learn more about z-scores let’s load a new data set into R:
colnames(hkhw)

hist(hkhw$Height.in, col = 'light blue',
     xlab = 'Height Inches', main = 'Heights of Hong Kong Children in Inches', breaks = 30)


# This data set has the heights and weights of 200 children in Hong Kong and is downloaded from the UCLA stats wiki (http://wiki.stat.ucla.edu/socr/index.php/SOCR_Data_Dinov_020108_HeightsWeights).

# In R we can easily compute the z-scores for each data point in a data set using the scale command:
hkhw$Z_heights <- scale(hkhw$Height.in)

# I created a new column, called Z_heights, in our height data frame to store the z-scores for each child.

hist(hkhw$Z_heights, col = 'coral', main = 'Z-score Distribution of Heights', xlab = 'Z', breaks = 30)


# The distribution of z-scores will always have a mean of zero and a standard deviation of one.
# Using the empirical rule we know that about 68% of a mound-shaped distribution will have z-scores in the range [-1,1], 95% will be in the range [-2,2], etc.

# The z-score is sometimes used to detect outliers in a data set.
#   example, about 99% of the data should have z-scores in the range of [-3,3], for data points with |Z|>3 may be classified as outliers.
#   Data points with |Z|>2 are possible outliers.

# Using the |Z|>3 criteria we can see two outliers in the height data:

outliers_height <- subset(hkhw$Height.in, abs(hkhw$Z_heights) > 3.0)


# We can estimate the percentile of a data point from the z-score in R using the pnorm command:

hkhw$height.percentiles = pnorm(hkhw$Z_heights) * 100
head(hkhw)


# From this we can see that the about 97% of hong kong children are shorter than the child who is 71.52 inches tall.


# As a warning using z-scores to estimate percentiles can give very poor results if the distribution is not mound shaped and symmetric!
# See the homework for an example of this.


#** 3.6.0.3 Exercises ----
#*** Exercise 3.11 ----
# Find the number of weight outliers using the z-score rule (|Z|>3) in the hkhw data set.
subset(hkhw$Weight.lbs, abs(scale(hkhw$Weight.lbs)) > 3.0)

View(cbind(hkhw$Weight.lbs, scale(hkhw$Weight.lbs)))

hist(hkhw$Weight.lbs)
hist(scale(hkhw$Weight.lbs))

# No outliers


#*** Exercise 3.12 ----
# Create a weight percentile column on the hkhw data frame, and find the percentile of the third child’s weight. 
hkhw$Z_weights <- scale(hkhw$Weight.lbs)

hkhw$weight.percentiles <- pnorm(hkhw$Z_weights) * 100

head(hkhw)


#_----


#* 3.7 Relation between Continuous and Categorical Variables: Box --------
# Box plots are especially useful when we want to compare the values of a continuous variable for different values of a categorical value.
# In fact R, has a shortcut for this to make this easier.
# Suppose for example we want to compare the points per game averages for the different positions in our per game NBA statistics.
#   The position of each player is stored in the Pos column of our data set.
# To get an idea about this categorical (ordinal) variable we can make a table of the values:

table(nba_pgs_all_players_2016$Pos)


# Notice we have a good amount of players at each position except for the one player who is listed as PF-C.
# We may want to remove this category from consideration because it is impossible to perform statistical analysis on a single data point.

PosColNumber = which(colnames(nba_pgs_all_players_2016) == 'Pos')    # find the column number for the Position

nba_pgs_all_players_2016 <- droplevels(subset(nba_pgs_all_players_2016, nba_pgs_all_players_2016$Pos != "PF-C"))
# can't find dropLowFactors
nba_pgs_all_players_2016=dropLowFactors(nba_pgs_all_players_2016, factor.column = PosColNumber, threshold = 10) ##drop the PF-C player

# We can check this using another table command:
table(nba_pgs_all_players_2016$Pos)


# Now we visualize the PPG data for each position using a special boxplot:

boxplot(nba_pgs_all_players_2016$PPG ~ nba_pgs_all_players_2016$Pos, col = 'coral',
        main = 'Points Per Game for Different Positions', xlab = 'Position', ylab = 'PPG')


# This is the first demonstration of the magical tilde ~ operator in R.
# It may be used to split up data in one column using the values of a categorical variable.


#*** Exercise 3.13 ----
# Make a boxplot comparing the assists per game by position in the nba_pgs_all_players_2016 data set.
# How many outliers are there using Tukey’s rule at the SG position? 

boxplot(nba_pgs_all_players_2016$AST ~ nba_pgs_all_players_2016$Pos, col = "coral",
        main = "Assists for Different POsitions", xlab = "Position", ylab = "Assists")

# 1 outlier

subset(nba_pgs_all_players_2016[, c("AST", "Pos")],
       nba_pgs_all_players_2016$Pos == "SG" &
         nba_pgs_all_players_2016$AST > quantile(nba_pgs_all_players_2016$AST, 0.75) + 1.5*IQR(nba_pgs_all_players_2016$Pos))


#_----


#* 3.8 Relation between Continuous Variables: Scatter Plots --------------
# The final type of plot we will examine is the scatter plot.
# A scatter plot is best used when you are trying to look for a relationship between two continuous variables.
#   example, we could make a scatter plot of the height versus the weight of the Hong Kong children.

plot(hkhw$Height.in, hkhw$Weight.lbs,
     main = 'Height versus Weight in Hong Kong Children', xlab = 'Height Inches', ylab = 'Weight (lbs)')

# This graph shows the expected trend that taller children tend to weigh more.


# The scatter plot is very often used when a box plot is a better choice.
# Box plots should be used when the x-axis is a categorical variable and the y-axis is a numerical (continuous) variable.
# If you make a scatter plot with a categorical variable on either axis the points will all lie on top of one another and the plot will give very little information to the reader.


# Here is an example of a POOR choice for a scatter plot

data(mtcars)
plot(mtcars$cyl, mtcars$mpg,
     xlab = 'Cylinders in the Engine', ylab = 'Miles Per Gallon', main = 'Poor Choice for a Scatter Plot')


# Here cylinders is a categorical variable and mpg is a continuous variable. It is better to make a boxplot of this data:

boxplot(mtcars$mpg~mtcars$cyl,
        xlab = 'Cylinders in the Engine', ylab = 'Miles Per Gallon', main = 'Box Plot is Better: MPG of Cars', col = 'lightblue')


# Notice is used the magical tilde ~ to automatically split up the mpg data into the cylinder categories.


#*** Exercise 3.14 ----
# For the mtcars data set should we make a boxplot or a scatter plot to look for a relationship between the mpg column and the disp column?
head(mtcars[, c("mpg", "disp")])
#   Both are continuous, so scatter plot

plot(mtcars$mpg ~ mtcars$disp, main = "MPG v/s Disp")
#   increasing displacement gives lower mpg


#*** Exercise 3.15 ----
# Load the PlantGrowth data set using the command data(PlantGrowth).
# Should we use a boxplot or a scatter plot to look for a relationship between the weight column and the group column? 
data("PlantGrowth")

head(PlantGrowth)
# group categorical, so boxplot

boxplot(PlantGrowth$weight ~ PlantGrowth$group, main = "Weight by Group")


#_----


#* 3.9 Relationship between Categorical Variables: Contingency Ta --------
# We have seen that looking for a relationship between a numeric and categorical variable should lead to a boxplot.
# A comparison of two numeric (continuous) variables should be done with a scatter plot (plot command.)
# The final comparison we might want to make is a comparison between two categorical variables.


# As an example of this lets consider the relationship between the down (1,2,3,4) and the type of play (Pass versus Rush) in the nflplays data set.

data(nflplays)

# This data set has data for over 275 thousands plays during NFL (football) games from 2009-2017 we will be using the PlayType and down columns (each categorical).

# We have seen that we can use the table command to build what is called a contingency table.
# Lets begin with that:

table(nflplays$PlayType, nflplays$down)

# This table counts up the number of pass/run plays for each down in the data set.
# However, it is difficult to look at these large numbers and get and idea about how likely the two play types are.
# To look at this we can put a prop.table command outside.

prop.table(table(nflplays$PlayType, nflplays$down))

# This tells us that for example 21.23% of the plays in our data set were first down running plays.
# However, this isn’t really what we want either.
# We would like to look at the percentage of Pass/Run plays for each down.
# We can use the margin keyword in the prop.table command to compute this.

prop.table(table(nflplays$PlayType, nflplays$down), margin = 2)


# Selecting margin = 1 divides each row by its total,
# margin = 2 divides each column by its sum.

# Now we can actually see that pass plays becomes more likely for downs 1-3 before falling slightly for 4th downs.
# We can make a graphical representation of this using the barplot command:

down.table = prop.table(table(nflplays$PlayType, nflplays$down), margin = 2)
barplot(down.table, legend = rownames(down.table))


# By default R will make what is called a stacked bar chart.
# This shows the percentage in each category as the high of the colored part of the bar.
# I can’t say I am a huge fan of stacked bar charts.
#   I prefer to put the bars beside one another:

barplot(down.table, legend = rownames(down.table), beside = TRUE)


# You can do this with the beside=TRUE keyword. The below shows you how to make a pretty version of this plot:

barplot(down.table, beside = TRUE,
        xlab = 'down', ylab = 'Probability', main = 'Play Choice by Down',
        col = c('coral', 'lightblue'), legend = rownames(down.table), ylim = c(0,1))


#_----


#* 3.10 Tips and Tricks --------------------------------------------------
# Now that we have learned all about exploratory data analysis (EDA), here are a few tips and tricks for doing EDA in R.

# Use the summary command:
summary(PPG)


# It also works for multiple columns or our data set.
# Here we get a summary of the 15-18 columns in the NBA per game stats data set.

summary(nba_pgs_all_players_2016[15:18])


# If your run this for a the whole data frame you will get a separate summary of each column in the data frame.


#_----


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


# ____----


# Chapter 4 Data Wrangling ------------------------------------------------
#* 4.1 What is Data Wrangling? -------------------------------------------
# Usually data sets require some work to extract the answers we are looking for.
# This is especially true for modern data sets which can be extremely large.
# These techniques are called data wrangling.

# In these notes we will learn how to use the R library dplyr to extract information from data sets.
# You can load this library in R using the command:
library(dplyr)

# It may print some warnings, but you don’t need to worry about these.


#_----



#* 4.2 NA’s and the Curse of Real World Data -----------------------------
# In real data sets we will often run into an issue where some of the data is missing.
# This can occur for a variety of reasons.
# example,
#   for scientific data the recorder may have messed up and not recorded that particular piece of data for some reason.
#   If we were measuring lizard tail lengths and a lizard had lost its tail we would not have anything to record for that piece of data.
#   In survey data the person filling out the survey may have skipped that question for some reason, etc.
#   Yet another reason might be that a column only makes sense to answer if your answer to a previous entry takes on a particular value.
#   If you are recording information about your employees in a spreadsheet the column child.ages only makes sense if the column has.children is true.

# Whatever the reasons behind it, when you are working with real-life data you will encounter this issue.
# R knows about these issues and uses a special term for missing data, “NA”.
# Whenever a piece of data is missing from a data set it will appear as an NA in the data set.

# Many ways exist for dealing with the issue of missing data.
# The simplest method however is to just remove the data where we are missing some component.
# For this we can use the na.omit function in R.
#   This function just removes all rows in the data set where one or more of the columns is missing a value.

# As an example lets consider the animal_sleep data set.
data("animal_sleep")
head(animal_sleep)

# Notice the missing values appear as NA’s. We can see the dimensions of the data frame using the dim command:

dim(animal_sleep)

# So we have data for 83 species and 11 columns of information.


# To remove the NA’s from this data set we can use the na.omit command:
trim_animal <- na.omit(animal_sleep)
head(trim_animal)

# Notice the NA’s have disappeared.
# However, we have gotten rid of most of the rows:
dim(trim_animal)


# Next we will see how we can use the select command to avoid dropping rows that we could have kept.

#   Select: Pick only a few columns

# Our primary data set in these notes will be the nflplays data set.
data("nflplays")

# This data set has data for over 275 thousands plays during NFL (football) games from 2009-2017.
# For each play we have recorded 43 pieces of information:
colnames(nflplays)

# You will want to use the help page to look up what a column actually stores ?nflplays

# For large data sets we may not be interested in all of the columns present in the data.
# We get only the ones we are interested in we can use the select command from dplyr.
#   example, if we are only interested in the Team and the Yards.Gained columns we can select those from our huge data frame:

team.offense <- dplyr::select(nflplays, posteam, Yards.Gained)    # Grab just the columns posteam and Yards.Gained
head(team.offense)    # Look at the first few rows in our new data 


# You can also grab a range of columns using the select command.
#   example, if we want only the columns from Date to Yard.Gained in the nflplays data set we could use:

test12 <- select(nflplays, Date:Yards.Gained)    # get columns from Date to Yards.Gained
colnames(test12)

# You can put multiple selectors into your command without issue.
#   example, if we want the Date through Yards.Gained and the Season column you can use:

test <- dplyr::select(nflplays, Date:Yards.Gained, Season)    # get columns from Date to Yards.Gained
colnames(test)


# A very common use of the select command is to use it in combination with the na.omit command.
#   example, we saw that applying the na.omit command to the whole animal_sleep data set left us with only 20 species (rows) where all 11 columns had been measured.

# However, if we are only interested in a few of the columns (for example species and brainwt) it doesn’t make sense to get rid of a row just because we don’t have its diet listed as we aren’t planning to use that anyways.

# The below command limits the data to what we are interested in first using the select command, and then removes any missing data.

trim_animal2 <- na.omit(dplyr::select(animal_sleep, name, brainwt))
head(trim_animal2)

# Notice that we now have a much larger data set:

dim(trim_animal2)


# We will see that the select command will also be useful when chained together with our other commands.



#** Exercise 4.1 ----
# Create a new dataframe from the nflplays dataframe which has only the PlayType, Yards.Gained, posteam columns using the select command.
dplyr::select(nflplays, PlayType, Yards.Gained, posteam)


#** Exercise 4.2 ----
# From the nflplays data frame use the select command to grab all columns from posteam to Fumble.
# How many columns are left in your reduced data frame?
dim(dplyr::select(nflplays, posteam:Fumble))


#** Exercise 4.3 ----
# Run the na.omit on animal_sleep and THEN select the name and brainwt columns.
# How many rows are left in this data set?
# Does the order of the commands matter? 
dim(dplyr::select(na.omit(animal_sleep), name, brainwt))
#   Yes


#_----


#* 4.3 Filter (select rows) ----------------------------------------------
# One of the most common things we want to do with a data set is pull out some of the rows.
#   example, in our nflplays set we might want to pull out only the rows where the play was a running play.
# We have seen how to do this already using the subset command.
# However, the more powerful library dplyr also has a function for doing this.

# First, notice that the type of play is stored in the PlayType column of the data set.
# The below command will produce a new data frame which contains the same information as the full data set except it will now only contain rows where the PlayType is “Run”.

running <- filter(nflplays, PlayType == 'Run')
dim(running)


# Notice that we use the double equal sign == here.
# We could grab all non running plays using:
  
tmp <- filter(nflplays, PlayType != 'Run')    # all plays besides running plays
dim(tmp)    # find the dimensions


# For numeric columns we can also filter using the greater than >, less than <, greater than or equal to >=, or less than or equal to <= operators.

#   example, if we want to look only for plays which gained more than 30 yards we could use:

bigplays <- filter(nflplays, Yards.Gained > 30.0)
dim(bigplays)


# For we could then look at the distribution of these long plays based on the teams:

barplot(table(bigplays$posteam), las = 2, main = 'Number of 30 Yard of More Plays Since 2009', ylab = 'Num of Plays', col = 'skyblue')


# Finally, say we wanted to grab only plays run by either the Dallas Cowboys or Green Bay Packers.
# For this purpose R has the special word %in%.
# The below tests whether the posteam is in the vector we created.

dallas.gb <- filter(nflplays, posteam %in% c('GB', 'DAL'))
table(dallas.gb$posteam)


#** 4.3.1 Compound Criteria ----
#*** 4.3.1.0.1 AND ----
# What if we want to grab rows with a more complicated criteria?
#   example, suppose we want to find all the running plays which were over 30 yards?

# From the data set we want the PlayType column to be equal to ‘Run’, AND we want the Yards.Gained column to be greater than 30.
# This is easy using the filter command as we just add that condition as we did for the first one.

big.running.plays <- filter(nflplays, PlayType == 'Run', Yards.Gained > 30.0)
dim(big.running.plays)


# This makes a new data frame where we only have runs over 30 yards.

# We can use the same column if we want to in our filter command.
#   example, the below gives plays which gained between 5 and 10 yards.

five.ten.plays <- filter(nflplays, Yards.Gained >= 5.0, Yards.Gained <= 10.0)
# Now count up the number of pass and run plays which produced 5-10 yards
table(five.ten.plays$PlayType)


# Whenever we have a series of conditions where we want only those rows where all of them hold we can use the filter command with each condition listed out with commas in between.


#*** 4.3.1.0.2 OR ----
# Now imagine we want to limit our data to just plays which happened on first or second down.
# he down is stored in the column down.

# If we use the comma notation we are looking for plays which occurred on first and second down.
# This would be true for exactly zero plays.

# Wrong way!
filter(nflplays,down  ==  1, down  ==  2)


# Clearly, we need a different approach.
# Instead of a comma we should use a vertical bar |.

tmp <- filter(nflplays, down == 1| down == 2)
prop.table(table(tmp$PlayType))


# We could compare this with the percentage of the play types on third down:

tmp <- filter(nflplays, down == 3)
prop.table(table(tmp$PlayType))

# Clearly, a pass is much more likely on a third down.


#*** Exercise 4.4 ----
# How many pass plays resulted in a fumble in the data set?
# How does this compare to the number of Run plays that resulted in a fumble?
# Use the filter command and the fumble column and the PlayType column.
table(select(filter(nflplays, Fumble == 1), PlayType))


#*** Exercise 4.5 ----
# How many pass plays resulted in a fumble OR an interception?
table(select(filter(nflplays, Fumble == 1 | InterceptionThrown == 1), PlayType))


#*** Exercise 4.6 ----
# How many pass plays did the New York Giants (NYG) run on third down? 
table(select(filter(nflplays, posteam == "NYG", down == 3), PlayType))


#_----  


#* 4.4 Chains/Pipes %>% --------------------------------------------------
# How about if we are interested in finding the yards gained on third down pass plays?

# Here is a quick way to get to this information:
nflplays %>% filter(down == 3, PlayType == 'Pass') %>% select(Yards.Gained) %>% head(10)


# This is our first example of the powerful chaining capability in dplyr.
# This is the weird notation %>% which means take the output of the last entry as the input to the next.
#   Of course, that is a complicated way of saying we formed a chain.
# We start with the full data set, then filter it to just the rows which match our conditions then we select the only column we care about from that filtered data set.
# All of the dplyr commands can be used in a chain.


#*** Exercise 4.7 ----
# Use a chain to find the order of animals in the animal_sleep data set from the smallest to largest brain weight (brainwt).
# Do this all in one command.
animal_sleep %>% select(name, brainwt) %>% arrange(brainwt)


#* Grouping Data ----
# Together Our nfl plays data set is based around recording data for each individual play.
# However, we might be more interested in grouping things by the player, team, league, play-type, etc.

#   example, lets try and find the average yards gained per play for each team:

nflplays %>% group_by(posteam) %>% summarize(av.yds.gained = mean(Yards.Gained))

# Let’s unpack what this command does.
#   It first groups the plays by the posteam column meaning grouped by the team with the ball.
# The group_by command is not terribly useful by itself, you will just about always want to use it in combination with the summarize command.
# The summarize command is used to create a summary of the data after it has been grouped in some way.
# It will create new summary columns in a new data frame.
#   In this case we compute the mean of the Yards.Gained column.

# Typically, we will want to group our data using a categorical column(s) in the data set.

# We can extend this basic command in many different ways.
#   example, we can group our data using more than one categorical variable.
#   The below command finds the average yards gained for each team and season.

nflplays %>% group_by(posteam, Season) %>% summarize(av.yards.gained = mean(Yards.Gained))

# Now we can see the average yards gained for each team and season from the results.

# In addition we could also calculate more columns in our summary.
#   example, in the below we find the mean yards gained, the median yards gained and the standard deviation.

nflplays %>% group_by(posteam, Season) %>% 
  summarize(
    av.yards.gained = mean(Yards.Gained),
    median.yds.gained = median(Yards.Gained),
    sd.yds.gained = sd(Yards.Gained)
  )


# The names you choose in the summarize command are up to you.
# Just name them something you will be able to remember for later.
# We can use any of our summary statistics commands learned in the EDA notes to find a summary of our grouped data.


# Sometimes you might want to just find the number of entries as well.
# For this we can use the n() function.
# This just counts up the number of entries in each group.
# The below adds a column which gives the number of plays.

nflplays %>% group_by(posteam, Season) %>% 
  summarize(av.yards.gained = mean(Yards.Gained), number.of.plays = n())


# Also, it is sometimes useful to add up a column for each group.
# We can do this with the sum() command in R.
# Let’s add a column to our data which has the total yards gained for each season/team.

nflplays %>% group_by(posteam, Season) %>% 
  summarize(av.yards.gained = mean(Yards.Gained), number.of.plays = n(), total.yards = sum(Yards.Gained))


#** 4.4.0.1 Example 1 ----
# Lets find the number of plays which were pass plays for each team in the NFL.

# First we want to filter to keep only rows which correspond to a pass play.
# Then we will group these by the teams and summarize by counting up the number of pass plays.

nflplays %>% filter(PlayType == 'Pass') %>% group_by(posteam) %>% summarize(num.pass.plays = n()) 


#** 4.4.0.2 Example 2 ----
# Lets find the average yards per rush attempt grouped by the player attempting the rush.
# ow we are grouping by the categorical variable Rusher instead of the team.

nflplays %>% filter(PlayType == 'Run') %>% group_by(Rusher) %>% 
  summarise(av.yards.per.carry = mean(Yards.Gained))


# Even this summary data set is rather large so we might want to refine it some more.
# It has some strange points because some of the players only carried the ball a few times.
# Let’s get rid of the players that carried the ball less than 200 times.

nflplays %>% filter(PlayType == 'Run') %>% group_by(Rusher) %>% 
  summarise(av.yards.per.carry = mean(Yards.Gained), num.carries = n()) %>% 
  filter(num.carries >= 200)


# We might want to sort this data to put it in some order based on the average yards per carry.
# We can do this with the arrange() command from dplyr.

nflplays %>% filter(PlayType == 'Run') %>% group_by(Rusher) %>% 
  summarise(av.yards.per.carry = mean(Yards.Gained), num.carries = n()) %>% 
  filter(num.carries >= 200) %>% arrange(av.yards.per.carry)


# To use the arrange command you just give it the column (numerical generally) that you want to use to sort the data.
# By default it will sort the data into ascending order (small to big).
# If we want to reverse that (big to small) we can use the desc() command.

nflplays %>% filter(PlayType =='Run') %>% group_by(Rusher) %>% 
  summarise(av.yards.per.carry = mean(Yards.Gained), num.carries = n()) %>%
  filter(num.carries >= 500) %>% arrange(desc(av.yards.per.carry))


#*** Exercise 4.8 ----
# Find the average yards gained for Run plays grouped by the team.
# You will need to add a filter command to the chain.
nflplays %>% filter(PlayType == "Run") %>% group_by(posteam) %>% summarise(avg_yd_gained = mean(Yards.Gained))


#*** Exercise 4.9 ----
# Find average yards gained for Pass plays grouped by the Passer.
# Eliminate those Passers who threw less than 300 passes and find the top ten passers
nflplays %>%
  filter(PlayType == "Pass") %>%
  group_by(Passer) %>%
  summarise(avg_yd_gained = mean(Yards.Gained), pass_count = n()) %>%
  filter(pass_count >= 300)


# For more information about data wrangling in R I recommend that you read (Wickham and Grolemund 2016).
# One topic that is missing from these notes and is pretty commonly needed is merging together two data frames of data.
# Many ways exist for merging two data set together.
#   If you need to do this then please see the discussion in (Wickham and Grolemund 2016) which is freely available online. 


#_----  


#* 4.5 Homework ----------------------------------------------------------
#** 4.5.1 Concept Questions ----
#*** 1. ----
# Explain what the dplyr commands select, filter, group_by, summarize, and arrange do.
#   select - select defined columns
#   filter - filter rows based on condition
#   group_by - group by defined columns
#   summarize - add summary columns bsaed on grouping variable
#   arrange - sort on defined column


#*** 2. ----
# (True/False) The na.omit command is used to remove all rows from a data frame which have any columns missing.
#   True


#*** 3. ----
# (True/False) The order we apply the select command and na.omit can change the results
#   True


#*** 4. ----
# (True/False) The group_by command is used to create groups of rows based on a categorical variable
#   True


#*** 5. ----
# True/False) The arrange command reorders the rows of the data using a given column from small to large (by default)
#   True


#*** 6. ----
# (True/False) The group_by command should always be paired the summarize command. The group_by command doesn’t really change anything by itself.
#   True


#*** 7. ----
# (True/False) The first step in looking for a relationship between two categorical variables is to make a contingency table using the table command.
#   True


#** 4.5.2 Practice Problems ----
#*** 1. ----
# Load the flightNYCFull data. This data has data for over 300,000 flights departing from NYC in 2013.
flightNYCFull

# Filter this data to contain only flights which came from the carriers AA or UA (american or united airlines).
flightNYCFull %>% filter(carrier %in% c("AA", "UA"))

# Filter this data to contain only flights from carrier ‘US’ and origin=‘JFK’
flightNYCFull %>% filter(carrier == "US", origin== "JFK")

# Find the average departure delays for the carrier ‘US’ with origin=‘JFK’
flightNYCFull %>% filter(carrier == "US", origin== "JFK") %>% summarise(mean(dep_delay))


#*** 2. ----
# Load the BirdCaptureData.
# This data set contains over 14000 recordings of captured birds at a bird station in California.
# Besides other information it contains the day of the year each bird was captured (JulianDay), the species code of the bird SpeciesCode and the Season (either Fall or Spring).
# The species in this study are migratory, so they are passing through when they are captured.
head(BirdCaptureData)

# Find the median capture day for each species in the two seasons.
BirdCaptureData %>% group_by(SpeciesCode) %>% summarise(median_capture_day = median(JulianDay))


#*** 3. ----
# Load the BirdCaptureData.
head(BirdCaptureData)

# Make the appropriate plot to look for a relationship between the Season column and the SpeciesCode.
BirdCaptureData %>% select(Season, SpeciesCode) %>% table()

# Find the percentages of the birds captured for each species in the two seasons.
BirdCaptureData %>% select(Season, SpeciesCode) %>% table() %>% prop.table(margin = 1)
BirdCaptureData %>% select(Season, SpeciesCode) %>% table() %>% prop.table(margin = 2)

# Is this roughly the same for all the bird species?
#   No


#** 4.5.2.1 Advanced Problems ----
#*** 1. ----
# Load the Young_People_Survey data, and look familiarize yourself with the data set using `?Young_People_Survey.
# Find the average weight (the Weight column) of grouped by they participants answer to the “Healthy Eating”" column.
# Make a barplot of this result.
# Hint:
#   You will need to remove the missing values NA from the data set using the na.omit command.
#   This will drop all rows which are missing values in any column in the data set.
# So your answer will start with:
Young_People_Survey %>% select(`Healthy eating`, Weight) %>% na.omit() 

Young_People_Survey %>%
  select(`Healthy eating`, Weight) %>%
  na.omit() %>%
  group_by(`Healthy eating`) %>%
  summarise(avg_wt = mean(Weight)) %>%
  barplot(avg_wt ~ `Healthy eating`, data = .)


#*** 2. ----
# Load the demographic_data data set.
# This has demographic information for over 11,000 cities in the US.
head(demographic_data)

# Find the average of the debt.proportion column for each state in the data set.
demographic_data %>%
  group_by(state) %>%
  summarise(avg_debt_prop = mean(debt.proportion)) %>%
  arrange(avg_debt_prop)

# What state has the smallest average debt proportion?
#   Puerto Rico


#*** 3. ----
# Load the wine_tasting data set.
colnames(wine_tasting)

# What country has the most number of wines which are priced above 100 dollars?
wine_tasting %>% filter(price > 100) %>% group_by(country) %>% summarise(count = n()) %>% arrange(desc(count))


#*** 4. ----
# Load the shot_logs_2014 data set.
# Notice you can find the percentage of shots are made for the whole data set using the command mean(shot_logs_2014$FGM).
# This is because the FGM column has a 1 if the shot was made and a zero if it was missed.
# The team playing defense on a given shot is stored in the Team.Defending column of the data set.
# Group this data by the team defending and find the allowed field goal percentage.
# Sort this data from smallest to largest.
# What team allowed the smallest of percentage of made baskets (best defense)?
shot_logs_2014 %>% group_by(Team.Defending) %>% summarise(FGP = mean(FGM)) %>% arrange(FGP)


#*** 5. ----
# Load the HR_Employee_Attrition data set.
# Each row contains information about one individual at a company.
# Group the employees by the Department and find the average and sd of the DailyRate for each department.
colnames(HR_Employee_Attrition)

HR_Employee_Attrition %>%
  group_by(Department) %>%
  summarise(avg_daily_rate = mean(DailyRate), sd_daily_rate = sd(DailyRate))


#*** 6. ----
# Load the flightNYCFull data set.
flightNYCFull

# Find the mean and median departure delay for each of the carriers.
flightNYCFull %>%
  group_by(carrier) %>%
  summarise(mean_dep_delay = mean(dep_delay), median_dep_delay = median(dep_delay))

# Now group the data using both the carrier and the origin and find the median departure delays.
# Arrange the data from the smallest median delay to the largest
flightNYCFull %>%
  group_by(carrier, origin) %>%
  summarise(median_dep_delay = median(dep_delay)) %>%
  arrange(median_dep_delay)


# ____----


# Chapter 5 Introduction to Clustering ------------------------------------
#* 5.1 What is Clustering? -----------------------------------------------
# Clustering properly belongs in a class on Machine Learning.
#   However, it is so useful we will cover just the basics in this class.
# The idea behind clustering is to look for groups or clusters of related data points in our data set.
#   example, we might have a data set which gives the purchase history of customers.
#   From this data we might want to extract classes of customers.

# Here is what we need to get started (plus my package as usual):
library(maps)
library(cluster)


#_----  


#* 5.2 Introduction to Kmeans clustering ---------------------------------
# The kmeans algorithm is pretty intuitive in nature.
# example,
#   lets suppose we have collected a data set with two variables and wish to create two clusters.
#   We could plot the data points using those two variables: 

# created my own cluster
practice_cluster <- bind_cols(
  x = c(rnorm(100, 0, 0.25), rnorm(100, 1, 0.25)),
  y = c(rnorm(100, 0, 0.25), rnorm(100, 1, 0.25))
)

plot(practice_cluster$y ~ practice_cluster$x, main = "K means Clustering Ideas")

#   We can intuitively see two clusters in this data set.
#   One is centered around (0,0) and the other is centered around (1,1).
#   We can then draw a circles with a radius large enough to contain those points which are close to those centers.
# This is the main idea behind the k means clustering algorithm.
# However instead of us trying to eyeball where the center of the circles are we let the algorithm do the work for us.
# The k means algorithm has to be told how many clusters we are looking for, it then proceeds to minimize the sum of distances of points in a cluster to those centers.

cluster_obj <- kmeans(practice_cluster, centers = 2, nstart = 25)
clusplot(practice_cluster, cluster_obj$cluster)


# This makes a two-dimensional plot of our data and which cluster each data point is assigned to.
# We can see that is this case the kmeans algorithm does a pretty good job of finding the two clusters in the data.


#** 5.2.0.1 Crime Clusters by State ----
# We are now going to look for clusters in a real data set.
# Lets load in a crime data set, which gives murder, assault and rape statistics for all 50 states in 1973.
# We are going to see if we can cluster these into groups of high and low crime states.
data("crime_cluster")

# Looking at the help page for this data we can see that we are given the number of arrests in each category per 100,000 residents.

head(crime_cluster)

#   You can see that there are many more assault arrests per 100,000 residents than the other two categories.
#   This can cause some issues with our clustering.
# Therefore, it is generally a good idea to standardize your variables.
# Recall, this means we just transform them so that each column has a mean of zero and a standard deviation of one.
# The scale command in R does this for us easily.
#   example,

ccs <- data.frame(sapply(crime_cluster, scale))    # this scales each column of the data and makes a new data frame ccs
rownames(ccs) <- rownames(crime_cluster)    # this makes sure the state names are in our standardized data set

# Now when we look at the data:
head(ccs)

# we can see that Alabama is about one standard deviation above the national average in the murder and assault rate and about average in the rape category.


# When performing a cluster abalysis on a data set you should consider standardizing your variables.
# This will allow for easier interpretations of the cluster centers and will prevent one variable (column) from dominating the cluster algorithm.

# We can make a map of our crime clusters of states in R, using a function I wrote called StatePlot.
source(paste(path2, "StatePlot", ".R", sep = ""))
cl2 <- StatePlot(2, ccs) ##2 is the number of clusters to look for, ccs is the data

# Notice this prints out the cluster centers.
# It looks like it has found two main groups: high crime and low crime.
# The high crime cluster are all about one standard deviation above the mean in each of the three categories.
# The low crime cluster is centered around being 0.6 standard deviations below the national average in all categories.

# We can explore the differences between the clusters further by making some box plots, splitting the states into their clusters.
#   example, the below box plot compares the normalized murder rates between the two clusters.

boxplot(ccs$Murder~cl2$cluster, main = 'Murder Rate for the Two Clusters', ylab = 'Murder Rate', xlab = 'Cluster', col = 'coral')


# We can also make a two-dimensional plot of our clusters using the clusplot command (in the cluster package).
# Since we have three variables this two-dimensional plot is a projection (shadow).
# R automatically chooses the best way to project the data onto two dimensions.

clusplot(ccs,cl2$cluster, labels = 3, color = TRUE)


# Looking at this plot lets us see which states are barely in the high or low crime clusters (and which are NOT!).
#   example, it looks like Missouri just barely makes the list of high crime states according to our analysis.


#_----


#* 5.3 How many clusters should we choose? -------------------------------
# A difficult question to answer when we are conducting a cluster analysis on data is:
# How many clusters should I pick to get the best representation of my data?
# Sometimes, we know that we are looking for some number of groups.
# example,
#   cancer genes and not cancer genes, or terrorist versus non-terrorist, etc.
# However, in many other cases it is not obvious how many clusters should be in our data.
# example,
#   how many customer types are shopping on your website, how many types of learners are in the classroom, etc.
# Part of the beauty of cluster analysis is that we let the data guide us to how many clusters to pick.

# To begin lets look at the crime data, and see what happens if we divide states into three groups.
# Here is a map if we cluster the states into three groups:
cl3 <- StatePlot(3, ccs)


# We can see that the new cluster mostly split the low crime states into very low and sort of low.
# Here is a look at the clusters if we split the data into four clusters.
cl4 <- StatePlot(4, ccs)


# In general, if we split the data into more clusters we can expect the data points to lie closer to the centers of the clusters.
# We can measure this by looking at the sum of all distances between the data points and the center of their clusters.
#   The kmeans function reports this value to use:
cl2$tot.withinss

cl3$tot.withinss

cl4$tot.withinss

# This will decrease as we increase the number of clusters.
#   If we allowed for 50 clusters we would just get one cluster for each state in our data set (giving a withinss value of zero)–
#     although this wouldn’t really tell us any useful information.
# Lets make a plot of the tot.withinss or distortion measurements against the total number of clusters.

ElbowClusterPlot(ccs)    # This is a special function written by me in the package HannayAppliedStats


# One common criteria for choosing the number of clusters to use is to look for the “elbow” for this plot.
# The elbow gives the smallest number of clusters which yields a big decrease in the total distance from the centers of the clusters.
#   For the crime clusters the elbow occurs for 2 clusters, as adding in a third cluster doesn’t really reduce the total error (distortion) by much.


# Use an elbow plot to look for the number of clusters you can form from a data set.
# This should be balanced against the number of clusters you expect to find in your data set.


#*** Exercise 5.1 ----
# Conduct a cluster analysis for the bad drivers data set.
# Load this data by typing data(bad_drivers_cluster).
data(bad_drivers_cluster)
colnames(bad_drivers_cluster)

# + Make a State plot of the bad drivers data set for two clusters.
# Does Texas belong to the better or worse driver cluster?
bdc <- StatePlot(2, bad_drivers_cluster)
#   Texas belongs to the worse cluster

# + Cluster the States into two clusters and make a boxplot comparing the perc_speeding values between the clusters
boxplot(bad_drivers_cluster$perc_speeding ~ bdc$cluster,
        xlab = "Cluster", ylab = "perc_speeding", main = "perc_speeding by Cluster")

# + Make an Elbow plot to determine the optimal number of clusters in the data.
# Does this plot have an obvious elbow? 
ElbowClusterPlot(bad_drivers_cluster)
#   There is no obvious elbow


#_---- 


#* 5.4 Clustering NBA Players --------------------------------------------
# As another interesting application of clustering lets consider clustering the top 100 NBA players by per game statistics.
# The below code forms two clusters among the top 100 players, using a built in data set:

data("nba_pg_2016")    #load the nba data
nba_clusters <- kmeans(nba_pg_2016, centers = 2, nstart = 25)
nba_clusters$centers

row.names(subset(nba_pg_2016, nba_clusters$cluster == 1))
row.names(subset(nba_pg_2016, nba_clusters$cluster == 2))


# Knowing something about the NBA it looks like the clustering algorithm has found the a cluster of the “star” players.
# We could also view this as high usage players versus low usage players.
# The star cluster gets more shot attempts, free throws, etc then the other cluster.
# Here is a two dimensional plot of the two cluster solution.

clusplot(nba_pg_2016, nba_clusters$cluster)


# Lets see what happens if we break into three clusters:
nba_clusters <- kmeans(nba_pg_2016, centers = 3, nstart = 25)
nba_clusters$centers

row.names(subset(nba_pg_2016, nba_clusters$cluster == 1))
row.names(subset(nba_pg_2016, nba_clusters$cluster == 2))
row.names(subset(nba_pg_2016, nba_clusters$cluster == 3))


# Looks like the “high usage” or stars split into two clusters (mid level stars and superstars) when we allow for three clusters.
# Conducting an elbow plot analysis shows that two or three clusters is probably the best choice in this case.
ElbowClusterPlot(nba_pg_2016, scale = FALSE)


#_---- 


#* 5.5 Requirements for Performing Cluster Analysis ----------------------
# In order to perform kmeans clustering analysis on a data set we need to have a a key property:
#   All the data used in the clustering must be either numerical in nature or at least an ordinal categorical variable (stored as a number, with a defined order).
#     You cannot use clustering analysis on data which includes nominal categorical variables as the distance between categories like (male/female) isn’t defined.
#     I have written a function called grabNumeric in my package which can be used to remove any non numerical columns from a data frame.
#     By default this will also drop the rows with missing values in the clustering variables.

# See the example below for how to use the grabNumeric function.

data("Young_People_Survey")
dim(Young_People_Survey)

yp <- grabNumeric(Young_People_Survey)
dim(yp)


#   The clusters found by the algorithm can be sensitive to the normalization of the data.
#     You should choose whether you want to standardize your variables (using scale) carefully.
#     Having variables which were measured on widely different scales can lead to erroneous clusters being found.


#_----  


#* 5.6 Homework ----------------------------------------------------------
#** 5.6.1 Concept Questions ----
# Are the following statements True or False? Why?
#*** 1. ----
# When performing a kmeans cluster analysis, the algorithm will automatically choose the optimal number of clusters for you.
#   False


#*** 2. ----
# Cluster analysis can be performed using nominal categorical variables.
#   False


#*** 3. ----
# When performing cluster analysis you should always standardize the variables.
#   True


#*** 4. ----
# Kmeans clustering seeks to minimise the distance from each point to the center of a fixed number of clusters
#   True


#** 5.6.2 Practice Problems ----
#*** 1. ----
# Give an example of a data set where clustering analysis might be interesting.
# This can be an imaginary data set, just explain the context.
#   Student data set with marks, number of days present, age


#** 5.6.3 Advanced Problems ----
#*** 1. ----
# Load the bad_drivers data set and perform a cluster analysis.
colnames(bad_drivers_cluster)

# Should we standardize the variables in this data set?
head(bad_drivers_cluster)
#   Yes. Insurance Premiums and Losses have larger scales.

# How many clusters should we choose for this data set?
ElbowClusterPlot(bad_drivers_cluster)
#   Test with 2-4 clusters

# Which states have the worst drivers?
# Give just a couple of examples of states in the cluster with the worst drivers.
kmeans(scale(bad_drivers_cluster), centers = 2, nstart = 25)$tot.withinss
rownames(subset(bad_drivers_cluster, StatePlot(2, bad_drivers_cluster)$cluster == 2))


#*** 2. ----
# Load the iris data set using data(iris).
data("iris")

# Look at the help page to see what this data set contains ?iris.
?iris

# How many iris species are in the data set?
NROW(unique(iris$Species))

# Can the Species column be used in a clustering analysis?
# Why or Why not?
#   No. Species is a nominal categorical variable where there is no ordering between each species.

# If the Species column can not be used in your estimation remove this column by running the command: iris$Species<-NULL.
iris$Species <- NULL

# How many clusters should we choose for this data set?
ElbowClusterPlot(iris)
#   2 clusters

# Run a clustering analysis and give the centroids of your clusters
cl <- kmeans(iris, centers = 2, nstart = 25)
cl$centers

# Make a clusplot of your clusters.
# How well are they separated?
# You will need the cluster package for this installed and loaded.
clusplot(iris, cl$cluster)
#   There is a bit of overlap.

# Make a box plot of the Sepal.Width for the different clusters found in your analysis.
boxplot(iris$Sepal.Width ~ cl$cluster,
        xlab = "Cluster", ylab = "Special Width", main = "Boxplot of Special Width by Cluster")


# ____----


# Chapter 6 Probability ---------------------------------------------------
#* 6.1 Sample Spaces and Events ------------------------------------------
#** 6.1.1 Introduction ----
# Now is the time to take a slight detour from the study of statistics into the sister field of probability theory.
# Probability theory provides much of the theoretical backbone for the study of statistics.
# The origins of probability theory come from gambling.
#   In particular, the first person to apply the analysis given here was Geralamo Cardano and Italian gambler in the 1500’s.
#   Cardano was the first person to analyze the outcomes of games of chance’’ in a structured and mathematical way.


#** 6.1.2 Sample Spaces ----
# Cardano’s great idea was the concept of the sample space which will denote as Ω.
# To determine the probability on a event occurring, Cardano’s idea is to make a list of all the possible outcomes from a random event.
# example,
#   a random event might be flipping a coin in which case the set of possible outcomes (the sample space Ω) is given by Ω={H,T}.
#   If the random event is rolling a six-sided dice the sample space is Ω={1,2,3,4,5,6}.
#   In blackjack the sample space is Ω={2,3,4,...21,B}, where the B stands for busting.


#*** Exercise 6.1 ----
# List out the possible outcomes from flipping a coin twice.
#   {{H,T}, {H,T}}


#*** Exercise 6.2 ----
# List out the possible outcomes for random event of choosing two finalists for an award with four applicants Ann, Jerry, Tom and Andy. 
#   {{Ann, Jerry, Tom, Andy}, {Ann, Jerry, Tom, Andy}}


#** 6.1.3 Law of Sample Spaces ----
# For the special case where all events from a random event are equally likely we can use the Law of Sample Spaces to calculate the probability of an event.


#*** Definition 6.1 (Law of Sample Spaces (LSS)) ----
# If all the outcomes of a random event are equally likely then
#   P(A) = |A| / |Ω| = Probability of event A occurring. 
#     Where
#     |A| is the number of outcomes in A and
#     |Ω| is the total number of events in the sample space.

# Use the Law of Samples Spaces to Calculate the probabilities below:
#*** Exercise 6.3 ----
# Probability a fair coin flip is heads
#   P(H) = |H| / {H,T} = 1/2


#*** Exercise 6.4 ----
# Probability a fair dice roll is greater than 3?
#   P(4:6) = |4:6| / |1:6| = 3/6 = 1/2


#*** Exercise 6.5 ----
# You are in a class with only four students.
# If you have to do a project with a partner what are the chances you are paired with your best friend.
# Assume the assignments are made entirely randomly.
#   P(F) = |F| / |class - you| = 1/(4-1) = 1/3


#*** Exercise 6.6 ----
# If you know that someones pin is 4 digits (0-9) long, what are your chances of guessing it?
#   P(4) = |correct pin| / |{0:9, 0:9, 0:9, 0:9 no repeat}| = 1/(10*8*7) = 1/5040


#*** Exercise 6.7 ----
# What are the odds that the sum of the rolls from two six-sided dice is 8?
#   P(sim = 8) = |{2,6} {6,2} {3,5} {5,3} {4,4}| / |{1:6, 1:6} = 4/36 = 1/9


# We can already see that the LSS turns probability calculations into a problem of counting stuff.
# As the numbers get larger it quickly becomes untenable to count things by hand.
#   example, if we try and list out all possible ways outcomes from flipping a coin ten times this would take about 84 days working for 12 hours a day! (over 3 million possibilities).
# In order to make better use of the LSS we need better techniques to count things.


#_---- 


#* 6.2 Combinatorics -----------------------------------------------------
#** 6.2.1 Basic Principle of Counting ----
# Combinatorics just means the mathematics of counting things.


#*** Definition 6.2 (Basic Principle of Counting) ----
# If two experiments are performed such that experiment 1 has N1 possible outcomes and experiment 2 has N2 possible outcomes then taken together we have N1×N2 possible outcomes.


# Use the basic principle of counting to find the number of outcomes for the following random experiments:
#**** Exercise 6.8 ----
# Two rolls of a six-sided dice.
#   P(1:6) * P(1:6) = 36


#**** Exercise 6.9 ----
# Flipping a coin three times.
#   P(H,T) * P(H,T) * P(H,T) = 2*2*2 = 8


#**** Exercise 6.10 ----
# How many DNA sequences are their which are 10 base pairs long? Hint: DNA has found bases A,T,C,G
#   P( {A,T,C,G}, {A,T,C,G} no repeat ) * 10 times = (4*3)^10 = 12^10


#**** Exercise 6.11 ----
# For a 100 meter dash final with 5 runners how many ways can the runners finish? 
#   5*4*3*2*1 = 120


#** 6.2.2 Permutations ----
# In the last exercise above we had to figure out how many ways we could order the five runners.
# Our logic for solving this generalizes to how many ways we can order any N distinct objects.


#*** Theorem 6.1 (Permutations) ----
# The number of ways to order N distinct objects is given by:
#   N × N−1 × N−2 × ... × 2 × 1 = N!
  
# We can use R to calculate permutations N! using the command:
factorial(N)    # calculate N!


#**** Exercise 6.12 ----
# If you bought ten cans of soup, each different types, and loaded them into the grocery bag randomly.
# What are the odds that when you pull them out of the grocery bag they come out in alphabetical order?
#   P(alphabetical order) = |correct order| / |10!| = 1/10!


#**** Exercise 6.13 ----
# How many ways can the cards in a standard deck (52 cards) be ordered?
#   52!


#**** Exercise 6.14 ----
# How many orders can 8 French nobles be executed in, if they are drawn randomly from a holding cell with 8 occupants?
#   8!


# In some cases we may want to know how many ways we can order a subset of elements.
# example,
#   how many four digit pins are possible if we can’t repeat the same digit more than once?
#   Well, we have 10 choice for the first digit, 9 for the second, 8 for the third and 7 for the fourth.
#   Therefore N=10×9×8×7.
#   Notice we can also write this as N = 10! / 6!
  

#*** Theorem 6.2 (Permutations of Subsets) ----
# The number of ways to order r distinct objects taken from a set of n distinct objects is:
#   P(n,r) = n! / (n−r)!


#**** Exercise 6.15 ----
# How many orders can 8 French nobles be executed in, if they are drawn randomly from a holding cell with 18 occupants? 
#   P(18,8) = 18! / (18-8)! = 18! / 12!


#** 6.2.3 Combinations ----
# We now want to consider the problem of counting outcomes for the case where the order doesn’t matter.
# example,
#   we may want to find the total number of five card poker hands.
#   Perhaps our first instinct is to use the permutations formulas from the last section.
#   We have 52 distinct objects and we want to know how many ways we can draw five of them.
#   This gives:
#     P(52,5) = 52! / 47! = 52 × 51 × 50 × 49 × 48 = 5,997,600.
#   However, their is a subtle error in our calculation.
#   Using the permutation formula means that we care about the order the cards appear in!
#   example,
#     the permutation way of counting means that the two hands:
#       2♡,3♠,8♣,2♠,Ace♢            Ace♢,2♡,3♠,8♣,2♠
#     are being counted as separate hands!
#     This isn’t what we really want to count as these two hands are entirely equivalent in a game of poker.

# To correct this over counting, we just need to divide by the number of equivalent entries in our count.
#   In this case we have 5! poker hands which are equilvalent.
#   Therefore, we have the total number of five card poker hands is:
#     P5 = 52! / (5! * 47!) = 2,598,960
#   So just about 2.6 million unique five card hands.
# As usual we can generalize our poker analysis to hold for general collections of objects.


#*** Theorem 6.3 (Combinations) ----
# The number of ways to draw k distinct objects from a set of N distinct objects is given by:
#   C(N,k) = (N   k) = N! / ((N−k)! * k!)

# In R we can calculate C(N,k)=(N   k) using the command:
choose(N,k)    # calculate C(N,k) 


#**** Exercise 6.16 ----
# How many ways can a jury of 12 people be chosen from a pool of 30 candidates?
choose(30,12)


#**** Exercise 6.17 ----
# A fire team of 4 junior Marines must be chosen from a platoon with junior 36 Marines for a patrol.
# Also a sergeant must be chosen to lead the fire team from a pool of 5 candidates.
# How many ways can the patrol be chosen with four juniors and one leader? 
choose(5,1) * choose(36,4)

  
#_---- 


#* 6.3 Axioms of Probability ---------------------------------------------
#** 6.3.1 Beyond the Law of Sample Spaces ----
# The LSS tells us that
#   P(E) = outcomes in E / total outcomes,
# but we have seen that the LSS doesn’t apply when the outcomes are not all equally likely.
# Outside of gambling scenarios not all outcomes are equally likely and the Law of Sample Spaces does not apply.


# Keep a lookout for the law of sample spaces being applied to scenarios where the outcomes are not all equally likely.
#   My favorite example of this is the protests of the opening of the Large Hadron Collider where one of the chief protestors argued that the LHC would either create a blackhole or not.
#   Therefore, the chances that the earth would be swallowed up by a man-made blackhole were roughly 50/50.


# To continue to make progress we need to move beyond the Law of Sample Spaces.


#** 6.3.2 Set Theory ----
# To go much further we need to learn a bit of set theory.
# A set is just a collection of unique objects.
#   example,
#     coin flip outcomes {H,T},
#     dice roll outcomes {1,2,3,4,5,6}.
# Now lets consider the different ways we can combine sets.

# Union of Sets:
#   Given two sets A and B the union of A and B which we write as A∪B consists of all the elements in A and all the elements in B.
#     example, let A={1,2,3} and B={3,4,5} then A∪B={1,2,3,4,5}.

# Intersection of Sets:
#   Given two sets A and B the intersection of A and B which we write as A∩B consists of those elements which are in BOTH A and B.
#     example, let A={1,2,3} and B={3,4,5} then A∩B={3}.

# Difference of Sets:
#   Given two sets A and B the A minus B written A∖B consists of those elements in A which are NOT also in B.
#     example, let A={1,2,3} and B={3,4,5} then A∖B={1,2}.

# Subsets:
#   We say that the set A is a subset of B written as A⊆B if every element of A is also in B.
#   The symbol A⊆B is similair to the less than or equal to (≤) sign.
#   It means that A is contained in B but the two sets may in fact be equal.
#   The symbol A⊂B means that A is a proper subset of B.
#   Meaning that there is some element of B which is not in A.

# Empty Set:
#   Occasionally it is useful to have a notation for a set which has no elements in it at all.
#   This is called the empty set and is denoted by ∅.
#     example, we could say that {1,2}∩{9,10} = ∅


#*** Exercise 6.18 ----
# Let Ω be the set of all students at Schreiner, and
# A be the set of students in this class and let
# M be the set of music majors at Schreiner.

# Is it true that A⊂Ω?
#   Yes
# What does the set Ω∖M contain?
#   all students who are not music majors
# What does the set A∪M contain?
#   set of students in this class + music major students


#** 6.3.3 The Axioms of Probability ----
# The axioms of probability are sort of like the mathematical version of the declaration of independence statement:
#   We hold these truths to be self-evident….
#   We can’t prove them but without agreeing on them it is impossible for us to have a productive conversation about probability theory.

# The probability of any event E in the sample space Ω [E⊆Ω] is between 0 and 1: 0 ≤ P(E) ≤ 1.
# The probability that at least one of the elemental events in the sample space occurs is 1: P(Ω) = 1.
#   This means that the sample space must contain at all possible outcomes.
# The probability of the union of two events occurring is given by: P(E1∪E2) = P(E1) + P(E2) − P(E1∩E2)


#** 6.3.4 The OR Rule ----
# The last axiom of probability actually can be very useful in calculations, I call it the OR rule of probability.
# Let’s break it down in some more detail.
#   P(E1∪E2) = P(E1) + P(E2) − P(E1∩E2)
# This tells us that the probability of the event E1 OR the event E2 occurring is the sum of the probabilities that E1 and E2 occur minus the probability that both E1 and E2 occur.

# Perhaps it is best to make sense of this using a simple example.
#   Suppose we are rolling a six sided dice.
#   Then the sample space Ω={1,2,3,4,5,6} and each outcome is equally likely.
#   Let E1={2,4,6} be the event and even number is rolled and let E2={1,2,3} be the event that an number less than or equal to three is rolled.
#   Then P(E1∪E2)) = P({1,2,3,4,6}) = 5/6 finding this directly.
#   Now the OR rule tells us we could also find this as
#     P(E1) + P(E2) − P(E1∩E2) = P({2,4,6}) + P({1,2,3}) − P({2}) = 3/6 + 3/6 − 1/6 = 5/6.

# Why does this work?
# Notice that when we break up the set E1∪E2 we end up counting the event that a two is rolled twice!
# It appears in both E1 and E2.
# Therefore, to correct for this we need to subtract off this double counting.

# The OR rule is especially simple and useful when E1 and E2 have no overlap, i.e E1∩E2=∅.
#   Sets with this property of no overlap are called disjointed sets.
# Then we have the following simple rule:

#*** Theorem 6.4 (Simple OR Rule) ----
# Let E1 and E2 be disjoint events (E1∩E2=∅) within some sample space Ω.
# Then we have that
#   P(E1∪E2) = P(E1) + P(E2)


#**** Exercise 6.19 ----
# Suppose 80% of the wizarding world supports restrictions on underage magic, and 55% support the use of dementors as guards at the wizarding prison Azkaban.
# If 50% support both dementors and underage magic restrictions, what percentage support either underage restrictions or dementors?
#   P(restriction)            = 80%
#   P(guards)                 = 55%
#   P(restriction & guards)   = 50%
#   P(restriction or guards)  = P(restriction) + P(guards) - P(restriction & guards) = 85%


#**** Exercise 6.20 ----
# A card is drawn randomly from a deck of ordinary playing cards.
# You win 10 dollars if the card is a spade or an ace.
# What is the probability that you will win the game?
#   P(ace) = P(spade) = 1/4
#   P(ace & spade) = 0
#   P(ace or spade) = 1/4 + 1/4 - 0 = 2/4 = 1/2


#** 6.3.5 The AND Rule ----
# We are now ready to discuss the powerful AND rule.
# This will allow us to find P(A∩B) easily under the special circumstances that the events A and B are independent’’.


#*** Theorem 6.5 (AND Rule) ----
# Let A and B be independent events within some sample space Ω then
#   P(A∩B) = P(A) × P(B).


# We will give a mathematical definition for independence in the next section of the notes.
# For now we will use the intuitive definition that two events A and B are independent if the occurrence of A has no effect whatsoever on the likelihood of B occurring and vice-versa.
#   example,
#     my hair color has nothing to do with the probability I am eaten by a shark.
#     Rolls of a dice, spins of a roulette wheel and many other gambling events are independent events.


#**** Example 6.1 ----
# If 100 people are on a dating site.
# If 30% of people are attractive to the user, then removing 70% leaves 30 candidates.
# If only 10% are honest then this leaves only 3 people who are both honest and attractive to the user.
# Using the AND rule the probability of finding an honest and attractive date on the site is:
#   P(H∩A) = P(H) × P(A) = 30/100 × 10/100 = 300/10000 = 0.03


#**** Example 6.2 ----
# If 10% of people are scared of flying and 20% of people have brown hair then what is the probability of finding a brown-haired person who is scared of flying?
# We expect that hair color will have no effect on a persons feelings about flying.
# Therefore, we can apply the AND rule.
#   P(B∩S) = P(B) × P(S) = 1/10 × 2/10 = 2/100


#**** 6.3.5.1 Exercise ----
# People vs Collins:
# In 1968 an old lady in Los Angeles, California was mugged and her purse was stolen.
# She didn’t get a good look at her assailants but the police did find one eye witness.
# Unfortunately, this witness didn’t get a good look at the mugger either.
# However, the witness did report seeing a black man with a beard/mustache running back to a yellow car with a blond haired white woman with her hair in a pony tail.
# This was very little to go on, however the police did find a couple which matched his description.
# Amazingly, using just this evidence they were brought to trial.
# At the trial a mathematics professor was brought in to testify for the prosecution.
# The professor presented the below table to the jury:
  
# Characteristic 	Probability
# Black man with beard            1/10
# Man with mustache               1/4
# White woman with pony tail      1/10
# White woman with blonde hair    1/3
# Yellow car 	                    1/10
# Interracial couple              1/1000

# The fact that this was presented by a math professor brings me great shame (for many reasons).
# Let’s examine the argument made by the professor.

# Using the AND rule what are the odds assuming these numbers are accurate in 1968 that a couple would match these all these characteristics?
#   P(Black man with beard/mustache) * P(blond haired white woman with her hair in a pony tail) * P(Yellow car) * P(Interracial couple)
#   = (1/10 + 1/4) * (1/10 * 1/3) * 1/10 * 1/1000
#   = 7/20 * 1/30 * 1/10 * 1/1000
#   = 7/6000000 = 7/6*10^6

# What is wrong with applying the AND rule to this data?
#   AND rule may not be correct since the assumption that the events are independent is incorrect (?)

# If there were 60 million couples in the LA area at the time, about how many couples will match this description?
#   7/6*10^6 * 60*10^6 = 70

# What is the probability that the couple that was arrested actually committed the crime? (Given your calculations above)
#   7/6*10^6

# This poor couple was convicted and it took years of appeals before the conviction was overturned.
# This is called the prosecutors fallacy.
# You will see another tragic case of this in your homework (Sally Clark Case).


#** 6.3.6 The Complement Rule ----
# One last rule to introduce for calculating probabilities.
# This is called the complement rule.
# The idea here is that sometimes it is easier to calculate the odds that an event does NOT happen, then to calculate the probability directly.


#*** Theorem 6.6 (Complement Rule) ----
# Let A be an event in a sample space, and let Ac = Ω∖A be the collection of all outcomes not in A.
# Then we have that
#   P(A) = 1 − P(Ac).

# example
#   if your doctor tells you that there is a 25% chance that you have a rare disorder based on your test results.
#   Then you could also phrase this as a 75% chance you do NOT have the disorder.


#**** Exercise 6.21 ----
# You have purchases a mortgage backed security, where you lose your money if at least one of the mortgages in the bundle fails.
# If each mortgage has a 5% chance of failing, independent of the rest, what is the probability you lose your money if you bundle 10 mortgages together? 
#   P(at least one fail) = 1 - P(no fail) = 1 - (95% ^ 10) = 0.4012631

#   If we check with 2 securities
#     SS = P(0) + P(1) + P(1) + P(2)
#     P(at least 1) = 5%*95% + 5%*95% + 5%*5%
#                   = 4.75% + 4.75% + 0.25%
#                   = 9.75%
#                 or
#                   = 1 - P(0) = 1 - 95%*95% = 1 - 0.9025 = 0.0975 = 9.75%


#_---- 


#* 6.4 Conditional Probability and Independence --------------------------
#** 6.4.1 Introduction ----
# Conditional probabilities allow us to include additional information into our calculation of probabilities.
# Let’s begin with some examples: 

#*** Example 6.3 ----
# What is the probability of a psychic being able to guess my birthday?
# + Call the event that the psychic guesses my birthday correctly B, then
#   P(B) = 1/365 = Number of Correct Guesses / Number of Total Possibilities.


#*** Example 6.4 ----
# What about if the psychic knows that I was born in December?
# + Well this information limits the number of choices down to the 31 days in December.
# Now we have that
#   P(B|M) = 1/31.

# This is much better odds of guessing the correct day.

# The notation P(B|M) should be read The probability of B given M.
# In the psychic problem B is the event of guessing my birthday correctly and M is the event that the month I was born in is December.

# In practical situations we deal with this type of situation, where we wish to calculate the odds of something we have partial knowledge of.
# example,
#   What is the probability your spouse is cheating on you, given the new information that you found strange text messages on their phone?
#   What is the probability of someone living past the age of 70? What about if you are given the added information that they smoke?
#   What is the probability of that you have the flu, given that you have a slight fever?


#** 6.4.2 Mathematical Definition ----
#*** Definition 6.3 (Conditional Probability) ----
# The conditional probability of some event A given the information that B has occurred is given by:
#   P(A|B) = P(A∩B) / P(B)


# We can get an idea for why this formula works by looking at a Venn diagram for conditional probability (Figure.~).

# Figure 6.1: Venn Diagram of a conditional probability calculation.
# The numbers indicate the number of outcomes in each category.
# Knowledge that C has occurred limits the possibilities down to 27 possible outcomes, and means only 13=B intersect C of the outcomes in B are possible 


#*** 6.4.2.1 Examples ----
# What is the probability of rolling a three with a dice, given that we know that an odd number was rolled?
# Let O={1,3,5} be the event an odd number is rolled and T={3} the event a three is rolled.
# Then by our conditional probability formula we have
#   P(T|O) = P(T∩O) / P(O) = |{3}∩{1,3,5}| / |{1,3,5}| = 1/3
#   Note that P(O|T) = P(T∩O) / P(T) = 1/6 / 1/6 = 1.
# This leads us to the important discovery:


#** Theorem 6.7 (Order Matters) ----
# In general for two events A and B:
#   P(A|B) ≠ P(B|A)
# that is probability of A given B is not the same as the probability of B given A.


# As another example of this non-equality,
#   let A be the event that someone is an professional basketball player and B be the event that someone is taller than 5.5 feet.
#   Then the probability of B given A, P(B|A), is quite large because most professional basketball players are much taller than 5.5.
#   That is if someone is a professional basketball player you would be very surprised if they were shorter than 5.5 feet tall.
#   However, if we consider the probability that someone in a professional basketball player given that they are taller then 5.5ft, that is P(A|B), we can see it is quite small.
#   This is because there are very few professional basketball players and many people taller than 5.5ft.
#   Therefore, concluding every above average height person you meet is on the San Antonio Spurs is going to be wrong most of the time.

# The lesson here is that knowledge of A can tell us much more about B then vice versa.


# Forgetting that the order matters in conditional probability statements is a classic mistake in probability.
#   It has been named the inverse fallacy.
# This is very commonly applied in political and legal arguments.
# The proper way to reverse the order of a conditional probability is to use Bayes Law discussed at the end of this chapter.

# Say 5% of a particular emergency room patient arrive with pain in their lower right abdomen and must be rushed to surgery, and
#   1% of the people arriving have appendicitis and pain in their lower right abdomen.
# If a new patient comes with pain in their lower right abdomen what is the probability they have appendicitis?
# Let A be the event they have appendicitis, and P be the event they have abdominal pain.
# Then we want to compute the probability
#   P(A|P) = P(A∩P) / P(P) = 0.01 / 0.05 = 1/5 = 20%


#*** Exercise 6.22 ----
# In 2016 the Cleveland Cavaliers had the following record in home and away games:
# Outcome 	Home 	Away
# Wins      31    20
# Losses    10    21

# Using this table find the probability of the Cavaliers winning a game P(W) in 2016.
#   P(W) = (31 + 20) + (31 + 20 + 10 + 21) = 51/82 = 62%

# Then find the conditional probabilities P(W|H), the probability of winning given
#   the game is a home game, and
#   P(W|A) the probability of them winning a game given it is an away game. 
#     P(W|H) = (31) / (31 + 10) = 31/41 = 76%
#     P(W|A) = (20) / (20 + 21) = 20/41 = 49%


#** 6.4.3 Independence ----
# Now that we have a knowledge of conditional probability we can return to the question of independence of random events.


#*** Definition 6.4 (Indepedence) ----
# We say two events A and B are independent if and only if:
#   P(A|B)=P(A)   or    P(B|A)=P(B).

# Practically this means that the probability of A occurring is not changed whatsoever by the knowledge that B has occured.
# example,
#   the probability of me being struck by lightning is is no way effected by the color of my hair.

# If two events are independent then using the definition of conditional probability gives:
#   P(A) = P(A|B) = P(A∩B)P(B)
#   P(A∩B) = P(A) × P(B)

# This is called the AND rule of calculating probabilities because if A and B are independent events then the probability of A AND B occurring P(A∩B) is the product of the probabilities.


#** 6.4.4 Multiplicative Rule ----
# If A and B are dependent (that is not independent) then we can use the multiplicative rule of probabilities to find P(A∩B).
# This is a more general AND rule.


#*** Theorem 6.8 (Multiplicative rule of probabilities) ----
# For two events A and B which may be dependent we have that
#   P(A∩B) = P(B|A)P(A) = P(A|B)P(B)


#*** Example 6.5 ----
# Suppose you have 6 white socks, 4 red socks and 2 blue socks in a drawer.
# What is the probability that the first two socks you draw out of the drawer in the dark are white socks?
#   Let W1 be the event the first sock is white and W2 the event the second sock is white.
#   We want
#     P(W1∩W2) = P(W2|W1)P(W1),
#   using the multiplicative rule for probabilties.
#   Now, P(W1) = 6/12 = 0.50, but P(W2|W1) = 5/11 because after drawing the first sock out we keep it.
#   Therefore, their are only 11 socks left in the drawer, 5 of which are white.
#   herefore, we have
#     P(W1∩W2) = P(W2|W1)P(W1) = 6/12×5/11 = 0.227
#   Notice that P(W1∩W2) ≠ P(W1)×P(W2) = 1/4, this tells us that drawing the socks are not independent events.
#   This is because we keep the first sock in our hand before drawing the second.
# This is called sampling without replacement and this can often break independence between events.


# Be on the watch for sampling without replacement as this is a common way to break independence between events. 


#** 6.4.5 Law of Total Probability ----
# The law of total probability allows us to use break down a complex probability calculation into a series of simpler calculations using conditional probabilities.
# To use the Law of Total Probability we need to form what is called a partition of our sample space.


#*** Definition 6.5 (Partition) ----
# A partition of the sample space ω is a collection of disjoint events (no overlap) B1,B2,...BN whose union is Ω.
# Such a partition divides any set A into N disjoint pieces.

# The Venn diagram of a partition is shown in Fig~.
#   Figure 6.2: Here we partition the sample space into 6 disjoint components B1,B2,....B6


#*** Theorem 6.9 (Law of Total Probability) ----
# Suppose we have a sample space Ω which can be broken into N subsets Bk each of which are disjoint (no overlap) and
#   the union of these subsets gives the entire sample space (i.e ∪Nk=1Bk=Ω).
# Then if we want to find the probability of an event P(A) we have:
#   P(A) = P(A|B1)P(B1) + P(A|B2)P(B2) + ... + P(A|BN)P(BN)

# The law of total probability tells us we can compute the probability of an event by breaking it into a series
#   of disjoint slices then adding up the contributions of these slices to get the total back.
# This will come in useful when the slices have probabilities which are easy to find.


#*** Example 6.6 ----
# Suppose we have a well shuffled deck of cards what is the probability that the second card drawn is an ace?

# Let A be the event that the first card is an Ace and Ac the event that the first card is not an ace.
# These two events are a partition of our sample space as the first card is either an Ace or not an Ace and it cannot be both.
# Therefore, we can use the Law of Total Probability to find the probability the second card is an Ace, call this event S.
# We have that,
#   P(S) = P(S|A)P(A) + P(S|Ac)P(Ac)

# We can find each of these probabilities easily:
#   P(A)    = 4/52  = Probability the first card is an Ace
#   P(Ac)   = 48/52 = Probability the first card not an Ace
#   P(S|A)  = 3/51  = Probability the second card is an Ace, when the first was an Ace
#   P(S|Ac) = 4/51  = Probability the second card is an Ace, when the first card isn not an Ace

# Now plugging these back into our law of total probability
#   P(S) = 3/51×4/52 + 4/51×48/52 = 4/52


#*** Example 6.7 ----
# Lets say that Chick-Fil-B has two chicken supply providers:
#   Old McDonalds Chicken Inc and Sick Chickens Inc.
# Old McDonalds provides 70% of the chicken and Sick Chickens Inc provides the other 30% of the chicken.
# Unsurprisingly, Sick Chickens Inc has a spotty record and 40% of their chickens give people food poisoning.
# Old McDonalds has a much better record with only 5% of their chickens making people sick.
# If you eat at Chick-Fil-B what are the chances you get sick?

# Let S be the event the chicken makes you sick.
# Let M be the event the chicken came from Old MacDonalds Chicken Inc and SC be the event it came from Sick Chicken Inc.
# Since the chicken had to come from one of those two suppliers, and can not have come from both we have a partition of our sample space.
# Then the law of total probability tells us that:
#   P(S) = P(S|M)P(M) + P(S|SC)P(SC) = 0.05×0.70 + 0.40×0.30 = 0.155 = 15.5%


#**** Exercise 6.23 ----
# Fred has never had MATH 2330 and thinks its a good idea to join a underground game of Russian roulette.
# To make things more interesting he has two pistols to choose from.
# Each of the guns has six chambers (six places to insert a bullet), although you know that one of the guns has two bullets loaded and the other only has a single bullet.
# Assuming he has to choose between the guns randomly what is the probability he survives?
#   S = survives
#   G1 = gun with 1 bullet
#   G2 = gun with 2 bullet
#   P(S) = P(S|G1)P(G1) + P(S|G2)P(G2) = 5/6*1/2 + 4/6*1/2 = 9/12 = 3/4


#_---- 


#* 6.5 Bayes Rule --------------------------------------------------------
# From our knowledge of conditional probability we know that
#   P(D|M)P(M) = P(M∩D) = P(M|D)P(D).
# From this observation we can get a rule for reversing a conditional probability order.
# This is called Bayes Law or Bayes Rule.


#** Theorem 6.10 (Bayes Law)  ----
# P(M|D) = P(D|M)P(M) / P(D) = P(D|M)P(M) / ∑P(D|Mi)P(Mi)

# Notice I used the law of total probability to write P(D)=∑P(D|Mi)P(Mi).
# This is the most common way to use Bayes law.

# You may have noticed I switched from using the notation A and B for events to using M and D for Bayes rule.
# This change was intentional as we can think of the M as the model and D as the data.
# In this way we may update our belief in a model (scientific theory, business conclusion) as we add additional data (D).
# In this way Bayes rule encompasses the scientific method by allowing us to measure the strength of evidence for a particular theory against the available evidence.

# example,
#   lets suppose that I have a been handed a coin which was randomly chosen from a bag with contains 1/2 fair coins and 1/2 biased coins.
#   The fair coins will come up heads 50% of the time.
#   The biased coins will come up heads 55% of the time.
#   I am trying to figure out which type of coin I have been handed.

# To investigate this I will collect data by flipping the coin say 5 times and recording the outcomes.
# Let’s say I flip this coin 5 times and I find that it comes up heads all five times.
# Let F be the event the coin is fair and B the event it is biased.
# D represents the data we have collected (five heads).

# We may use Bayes rule to calculate the probability P(F|D): 
#   P(F|D) = P(D|F)P(F) / ( P(D|F)P(F) + P(D|B)P(B) )

# We can fill in this data:
#   P(D|F) is the probability of observed the data given the model (fair coin) this is given by (1/2)^5 = 1/32.
#   P(F) this is the probability the coin we were handed is fair.
#     Since we know the bag with the coins in it has a 50/50 mix of fair/biased coins we can say this equals P(F)=0.50,
#     For the same reasons we have that P(B)=0.50
#   The only remaining entry to find is the P(D|B) term.
#   This is the probability we get 5 heads in a row using the biased coin thus P(D|B)=0.5510


# P(F|D)  = P(D|F)P(F) / ( P(D|F)P(F) + P(D|B)P(B) )
#         = 0.50^5 × 0.50 / (0.50^5 × 0.50 + 0.55^5 × 0.50)
#         = 0.383 = 38.3%
# Likewise we can find P(B|D) as:
# P(B|D)  = P(D|B)P(B) / ( P(D|F)P(F) + P(D|B)P(B) )
#         = 0.55^5 × 0.50 / (0.50^5 × 0.50 + 0.55^5 × 0.50)
#         = 0.617 = 61.7%

# Given this data Bayes law tells us it is more likely that we have a biased coin.
# Notice that if we flipped the coin 10 times and found heads everytime then we would find:
# P(B|D)  = P(D|B)P(B) / ( P(D|F)P(F)+P(D|B)P(B) )
#         = 0.55^10 × 0.50 / (0.50^10 × 0.50 + 0.55%10 × 0.50)
#         = 0.721 = 72.1%

# This should make sense the more heads we find in collecting our data the more likely it is that the coin is biased towards heads.


#_---- 


#* 6.6 Homework ----------------------------------------------------------
#** 6.6.1 Concept Questions ----
#*** 1. ----
# What is the Law of Sample Spaces and when does it apply?
#   P(A) = number of outcomes in A / total outcomes in sample space
#   when all outcomes are equally likely


#*** 2. ----
# What is the condition for applying the OR rule of probabilities?
#   the two events must be disjointed


#*** 3. ----
# What is the condition for applying the AND rule of probabilities?
#   the two events must be independent


#*** 4. ----
# Is it true that P(A∩B)≤P(A)?
#   True


#*** 5. ----
# Is it true that P(A∪B)≥P(A)?
#   True


#*** 6. ----
# For conditional probabilities does P(A|B)=P(B|A)?
#   No


#** 6.6.2 Practice Problems ----
#*** 1. ----
# How many 7-place license plates are possible if the first two places are letters and the last 5 places are numbers?
#   P(2 letters + 5 numbers) = P(2 letters) + P(5 numbers) = 26P2 + 10P5 = 30565


#*** 2. ----
# Twenty workers are assigned to 20 different jobs, how many different assignments are possible?
#   20P20 = 20!


#*** 3. ----
# How many ways can a wedding table of 5 people be selected from a wedding party of 12 people?
#   12C5 = factorial(12) / factorial(5) = 3991680


#*** 4. ----
# Two fair dice are thrown and let E be the event that the sum of the dice is odd and F be the event the sum is less than 6

#   Create the sets in Excel

# Define E and F and the sample space Ω.
#   Q = {1:6, 1:6}                                = 36 events
#   E = {{odd, even} {even, odd}}                 = 18 events
#   F = {{1, 1:4}, {2, 1:3}, {3, 1:2}}, {4, 1}}   = 10 events

# Are E and F disjoint sets?
#   No

# Find P(E) and P(F)
#   P(E) = 18/36 = 1/2
#   P(F) = 10/36 = 5/18

# Find E∪F and P(E∪F)
#   E∪F = {{1,(1:4,5)}, {2,(1:3,5)}, {3,(1, even)}, {4,1}, {5,even}, {6,odd}} = 22 events
#   P(E∪F) = 22/36 = 11/18

# Find P(E∩F)
#   E∩F = {{1,(2,4)}, {2,(1,3)}, {3,2}, {4,1}} = 6 events
#   P(E∩F)  = 6/36 = 1/6
#           = P(E) + P(F) - P(E∪F)
#           = 9/18 + 5/18 - 11/18 = 3/18 = 1/6

# Are E and F independent events?
#   P(E|F) = P(E∩F)/P(F) = 3/18 / 5/18 = 3/5 <> P(E)
#   P(F|E) = P(E∩F)/P(E) = 3/18 / 9/18 = 1/3 <> P(F)
#   No


#** 6.6.3 Advanced Problems ----
#*** 1. ----
# Advertising Decisions:
# You are trying to decide how effective your product advertisements are.
# You find that 61% of your customers are on Facebook, and 32% are on Twitter with 16% on both Facebook and Twitter.
# If you decide to pay for advertising on both Facebook and twitter what percentage of customers do you expect to reach?
#   P(F) = 61%
#   P(T) = 32%
#   P(F∩T) = 16%
#   P(F∪T) = 61% + 32% - 16% = 77%


#*** 2. ----
# DNA Evidence:
# In a murder trial and expert witness is called to testify about DNA evidence found at the crime scene.
# They say that the probability of a person randomly matching the DNA fragment found at the crime scene is approximately 1 in a million.
# In the cross examination the defense attorney asks what the probability of a lab mistake is during the processing of the evidence (contamination, human error, etc), to which the expert witness replies about 5% of the time.
# If we are a juror, we are interested in the probability the DNA evidence linking the defendant to the crime scene is false. Lets call this event F.
# Call the event that the defendant is unluckily enough to share the DNA sequence with the real killer R, and call the event that the lab screwed up and the match is false L.
#   P(random match) = P(R) = 1/10^6
#   P(mistake) = P(L) = 5%
#   The two events are independent
#   P(F∩T) = P(R) * P(L) = 5/10^8

# How can we express F in terms of R and L?
#   F = R∪L

# Using the numbers given by the expert witness find P(F) in this case.
#   P(F) = P(R∪L) = P(R) + P(L) - P(F∩T) = 1/10^6 + 5% - 5/10^8 = (100 + 5000000 - 5)/10^8 = ~5%

# Is this beyond your reasonable doubt? How would you explain this to your fellow jurors who aren’t skilled in probability theory?
#   No. Explain that Probability of random match is nearly impossible and if consider that the probability of L is only 5%,
#     then the chance of evidence being false is only 5%, which is what we got above.

  
#*** 3. ----
# The Simpson Trial:
# During the O.J. Simpson trial the prosecution argued that the history of domestic abuse by O.J. towards his ex-wife Nicole Brown showed a pattern of escalating violence which culminated in her murder.
# To make the point the chief prosecutor famously used the line A slap is a prelude to homicide’’.
# Predictably, the defense argued this history of domestic abuse meant nothing.
# The defense used the following statistics to make their argument:
#   over 4 million women were victims of domestic abuse in 1992 and only 1,432 of these were killed by their significant others.
#   Therefore the probability, in 1992, that an abuser murders their spouse is less than 1/2500.
#   Therefore, they argued that very few wife beaters actually go on to murder their wives.

# Write the defense’s statistic in terms of a conditional probability where
# M is the event that the women is murdered by their abuser, and
# A is the event that they were previously abused.
#   P(M|A) = P(M∩A)/P(A) = 1432/(4/10^6) = 0.000358 ~< 1/2500


# What key piece of information is the defense conveniently forgetting to condition on?
# Hint: Is it relevant to consider the probability that O.J. will murder Nicole at some future date?
#   Yes. The defense only considered the murder that took place in 1992, but abuse can occur over several years and the murder might take place in a later year.

# If I told you that 90% of the time when an abused women is murdered, the murderer was the abuser (this is true).
# How would you respond to the defenses argument?
#   P(M|A) = 90%
#   P(A∩M) = P(M|A) * P(A) = 0.90 * (4*10^6) = 3.6+e06
#   So respond to defence that the figure is not 1432 but 3.6 million.


#*** 4. ----
# Sally Clark Case:
# Sally Clark was a women in England who in 1999 was convicted of killing her two children.
# The first child’s untimely death was put down to Sudden Infant Death Syndrome (SIDS).
# However, when two years later another seemingly healthy child suddenly died, Sally was accused of murdering the two children.
# The thrust of the prosecutions argument hinged on the fact that SIDS, thankfully, is relatively rare.
# The odds of a randomly chosen baby, dying from SIDS is about 3 in 5000.

# If the two deaths are independent then what is the probability of having two children who die of SIDS?
#   P(SIDS) = 3/5000
#   P(2 SIDS) = 3/5000 * 3/5000 = 0.00000036

# If 130 million babies are born worldwide each year, about how many will die from SIDS using the 3:5000 odds?
#   SIDS = 130*10^6 * 3/5000 = 78K

# If 50,000 mothers have another child after having a child die of SIDS about how many will have a second child die from SIDS assuming the two deaths are independent?
#   P(SIDS | SIDS) = P(SIDS) = 3/5000
#   50000 * 3/5000 = 30

# Using you answer from part(c) how would you defend Sally in court?
#   Given that 30 out of 50K mothers lose 2 children to SIDS, it is possible that Sally was part of this statistic.
  

#*** 5. ----
# If two events A and B are disjoint (i.e. A∩B=∅) does this mean they are independent?
# If not give an example of a case where this fails.
# Hint: Consider A and Ac.
#   No. Ac is formed based on the events in A. Therefore, Ac is dependent on A.
#   E.g.
#     If a 6-sided dice is thrown and A is the event of even numbers then Ac is the event of odd numbers.
#     However, if A is now event of numbers less than 4, then Ac changes to numbers 4 and above.
#   Therefore, even though A and Ac are disjoint they are not independent.


# ____----


# Chapter 7 Discrete Random Variables -------------------------------------
#* 7.1 Random Variables --------------------------------------------------
#** Definition 7.1 (Random Variables) ----
# Random variables are functions which map from the sample space Ω of a random experiment to numerical values.

#   The diagram below shows the random variable mapping a coin flip to the numbers {0,1}.

# Random variables are called discrete when the outputs taken on a integer (countable) number of values,
#   (e.g. (1,2,3), (-2,-1,0,1,2,3,4,5, …).
# Countable in the mathematical sense just means the values can be arranged in some ordered list which doesn’t leave any values out.

#*** Example 7.1 ----
# For a coin flip with Ω={H,T} we could define a random variable X such that X(T)=1 and X(H)=0, this is shown in the above diagram.


#*** Example 7.2 ----
# If our random experiment is flipping a coin ten times we could define a discrete random variable X
#   which gives the number of heads that appear in the experiment.
#     X(HTHTTTTTTT)=2, etc. 


#*** Example 7.3 ----
# If our random experiment is a baseball game, a random variable B could be the number of base hits during the game.

# Notice we haven’t talked yet about probability, in our discussion of random variables.
# When we want to know the probablity of a random variable taking a certain value we need to introduce the idea of a probability distribution.


#_---- 


#* 7.2 Probability Distributions for Discrete Random Variables -----------
# To specify a random variable completely, we need to specify all the values the random variable can take
#   (this is called the range of the random variable)
#   and the probability that it takes each of those values.


#*** Example 7.4 ----
# For example, let’s consider a random variable X which gives the number of flips of a fair coin until the first head appears.

# What possible values can our random variable X take?
#   Well we know it will take at least one flip of the coin to get our first heads to appear, and it could be any number of flips until the first head appears.
#   So the range of X is {1,2,3,4,5,6,.....}.
#   That is all the positive integers.

# The probability that it takes each of those values?
#   Let’s start with the probability that the first flip is heads, which would mean that X=1.
#   We denote this quantity P(X=1), the probability that the random variable X takes the value 1.
#   Since it is a fair coin we have that P(X=1)=1/2.
#   To find P(X=2) is the probability that we flip a tails and then flip a heads HT.
#     This two flips are independent so we can multiply these two probabilities to get P(X=2)=12×12=14
#   In general, the probability of the first heads coming up on the kth flip of the coin is: P(X=k)=(12)k.

# We can also present the probability distribution of a discrete random variable as a graph.
# The probability distribution for our random variable X for the first 11 values is shown in Fig. below. 
X <- seq(1,11,1)
p_X <- rep(NA, length(X))
for (i in X) {
  p_X[i] <- (1/2)^i
}
barplot(p_X ~ X, col = "darkgreen",
        xlab = "Number of Flips until First Heads", ylab = "Probability", main = "Coin Flips until First Heads")


#*** Example 7.5 ----
# As another example of a random variable let Y be the sum of the rolls of two six sided dice.

# What possible values can our random variable Y take?
#   Here Y can has to be a integer between 1 and 12 {2,3,4,5,6,7,8,9,10,11,12}.

# The probability that it takes each of those values?
#   We have calculated these odds before for individual values.
#   Now, we store the results in a random variable function.
#   To get the probabilities we can make a table of the values each of the dice produce. 
d1 <- d2 <- seq(1,6,1)
d1_d2 <- matrix(NA, nrow = length(d1), ncol = length(d2))
for (i in 1:length(d1)) {
  for (j in 1:length(d2)) {
    d1_d2[i,j] <- i + j
  }
}
hist(d1_d2, breaks = seq(1,12,1), freq = FALSE, yaxp = c(0,0.2,20),
     xlab = "m", ylab = "P(m)", main = "Catan Probabilities")


# By counting the number of times the various sums appear in the table, we can get the probability distribution of our random variable Y.
# We can specify this distribution in two pieces:
#   P(Y=k)  = (k−1)/36    k≤7
#   P(Y=k)  = (13−k)/36   k>7

# A plot of the probability distribution is shown in the figure.


#*** Example 7.6 ----
# Another application, (perhaps the original application), of the concept of a random variable is to gambling.
# In this context the numerical outputs of the random variable may be used to store the payoff for various bets.
# As a concrete example, consider the game of roulette.
# According to wikipedia,
#   “To determine the winning number and color, a croupier spins a wheel in one direction, then spins a ball in the opposite direction around a tilted circular track running around the circumference of the wheel. The ball eventually loses momentum and falls onto the wheel and into one of 38 (in American roulette) colored and numbered pockets on the wheel.”

# In the simple case a player bets $1 on the ball landing on a single number.
# If it lands on their number they receive $36 dollars back, otherwise they lose the one dollar bet.
# Let the random variable X be the winnings from the bet.
# Then P(X=−1) = 37/38 ≈ 97.3% (this is probability of losing one dollar on the bet) and P(X=36) = 1/38 = 2.63%.


# You may have noticed that we have seen plots which look pretty similar to the probability distribution plots in our examples.
# These were the histogram plots from our study of exploratory data analysis.
# The histogram is an estimate of the probability distribution based on a data set, rather than one calculated using the laws of probability.
# This is the difference between the study of statistics, where we use data to try and learn the probability of events and probability theory where we calculate the probability of events. 


#*** Exercise 7.1 ----
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


#_---- 


#* 7.3 Properties of Probability Distributions ---------------------------
# Directly from the axioms of probability covered in the last chapter we get the following properties of a probability distribution for a random variable:


#** Theorem 7.1 (Properties of Probability Distributions) ----
# Any probability distribution P(X=k) of a discrete random variable X has the properties:
#   P(X=k) ≥ 0        for any value k in the range of the random variable.
#   [∑k]P(X=k) = 1,   where we sum over all possible values of the random variable. 

# These two properties come from the axiom that
#   the probability of any event in the sample space must be between zero and one, and
#   that the probability that anything in the sample space occurs is one [P(Ω)=1].


#** 7.3.1 Expected Values of Discrete Random Variables ----
# Just as we found the mean of data sets in EDA as a measure of the central tendency of data, we can find the mean of a probability distribution to measure its central tendency.


#*** Definition 7.2 (Expected Value/Mean) ----
# The mean or expected value of a discrete random variable is given by:
#   μ = E[X] = ∑yP(X=y),
#     where the sum goes over all possible outputs of the random variable.


#*** law of large numbers ----
# The name expected value is a bit of a misnomer, as usually the expected value of a discrete random variable will be outside the range of the random variable.
# So on any given sample from the random variable the expected value’’ may never occur!
# However, in the long-run (infinite trials) the average of the random variable will converge to the expected value.
#   This is called the law of large numbers.

# Figure 7.4: The Law of Large Numbers: This plot shows different simulations of flipping a fair coin 1000 times and calculating the fraction of heads observed after so many flips of the coin. The average number of heads converges to 0.50 as the number of flips increases. This is called the Law of Large Numbers. 


#*** Example 7.7 ----
# Find the expected value (mean) of a bet on a single number in American roulette.
#   E[X] = ∑yP(X=y) = (−1)(3738) + (36)(138) = $−0.02
# So the expected return on a 1 dollar bet is about negative 2 cents.
# The expected value for all games at a casino will be negative, as this is how the casino makes money.
# The casino will make about two cents on every dollar bet on roulette in the long-run. 


#*** Example 7.8 ----
# We can also use the expected value to get an idea of the long-term cost of something.
# For example, lets say I am trying to compare the prices between two cell phone companies, say Monopoly Wireless and Cut-Rate Communications.
# Monopoly wireless charges me $70 dollars a month, with an overage cost of $20 dollars if I use to much data for that month.
# However, Cut-Rate communications charges only $60 dollars a month, with an overage charge of $50 dollars if I go over on the data.
# If I estimate that I will exceed my data allocation for three months in a given year, what is the expected monthly cost for the two companies?

# Let us start with Monopoly Wireless and let M be the random variable describing the monthly bill.
# Then M is either 70 dollars or 90 dollars depending whether I go over on my data, with P(M=70)=9/12 and P(M=90)=3/12.
# Therefore the expected cost is
#   E[M] = ∑kP(M=k) = 70(912) + 90(312) = 75

# Now consider Cut-Rate Communications and let C be the random variable describing the monthly bill.
# Then C is either 60 dollars or 110 dollars depending on whether I go over on my data.
# We have that P(C=60)=9/12 and P(C=110)=3/12.
# Therefore, the expected monthly bill will be:
#   E[C] = ∑kP(C=k) = 60(912) + 110(312) = 72.5

# Therefore, we should choose Cut-Rate Communications as in the long-run (over the course of many years) we can expect to save $2.5 dollars a month. 


#*** Exercise 7.2 ----
# Greg is trying to decide whether to live on campus for next semester.
# He estimates it will cost 3 dollars a day for gas, but he has to travel through the Center Point speed trap on his commute to class.
# From experience he knows that about 3% of the time he forgets to slow down when traveling through Center point and gets a $300 speeding ticket.
# What is the true cost of his daily commute when living off campus?
#   Let X be random variable describing commute cost
#   P(X = 303)  = 3%
#   P(X = 3)    = 97%
#   E[X] = 3*97% + 303*3% = 12


#*** Exercise 7.3 ----
# You are offered the chance to enter a raffle by purchasing a $2 dollar ticket and the prize is a $2000 jet-ski.
# 500 tickets will be sold.
# What is your expected return on purchasing a ticket in this raffle?
#   Let X be return on ticket
#   P(X = -2) = 499/500
#   P(X = 2000) = 1/500
#   E[X] = -2*499/500 + 2000*1/500 = 2.004


#_---- 


#* 7.4 Expected Value of Sums of Random Variables ------------------------
# Let X1 and X2 be random variables then Y=X1+X2 is also a random variable.
# example,
#   we could let X1 be the roll of one dice and X2 be the roll of a second dice.
#   Then the random variable Y would be the sum of these two dice, as we considered earlier in these notes.
#   For random variables which can be written as the sum of multiple of another random variable we have the following property:


#** Theorem 7.2 (Sums and Constant Multiples of Random Variables) ----
# Let X1 and X2 be random variables, and a,b are constant numbers then if Y=aX2+bX2 we have that:
#   E[Y] = aE[X1] + bE[X2]


#*** Example 7.9 ----
# Lets consider finding the expected value of the sum of two dice.
# Remember this will give is the long term average if we repeated the rolls thousands of times.
# Then as given earlier Y=X1+X2 with X1 giving the roll of the first dice and X2 the roll of the second dice.
# Then,
#   E[Y] = E[X1] + E[X2] = 1/6*(1+2+3+4+5+6) + 1/6*(1+2+3+4+5+6) = 3.5 + 3.5 = 7

# Notice we got this answer in a much easier way then finding the probability distribution of Y and computing the expected value directly from that.

# If we want to find the expected value of any function of a random variable f(X), we have the following theorem:


#** Theorem 7.3 ----
# Let X be a random variable, then the expected value of f(X) is given by:
#   E[f(X)] = ∑f(y)P(X=k)

# example,
#   if we want to know the expected value of the random variable Y=X2 where X is the result of a random roll of a six-sided dice.
#   Then we have that
#     E[Y] = E[X2] = 1/6 * (1^2 + 2^2 + 3^2 + 4^2 + 5^2 + 6^2) = 15.16667


#*** Exercise 7.4 ----
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


#_---- 


#* 7.5 Variance of Random Variables --------------------------------------
# We may also get a measure for the width of the probability distribution of a random variable.
# For this we compute the variance of the random variable:


#** Definition 7.3 (Variance of a Discrete RV) ----
# The variance of a random variable X, with expected value E[X]=μ is given by:
#   Var(X) = E[(x−μ)^2] = ∑(k−μ)^2 * P(X=k) = E[X^2] − (E[X])^2

# Note that the variance for a random variable is always non-negative (Var(X)≥0).


#*** Example 7.10 ----
# Find the variance of the random variable X describing the betting results from a roulette wheel.
# We found earlier that E[X]=−0.02, so to get the variance we only need to find E[X2]:
#   E[X^2] = (−1)^2 * (37/38) + (36)^2 * (1/38) = 35.07

# Therefore the Var(X) = E[X^2] − (E[X])^2 = 35.07 − (−0.02)^2 = 35.06. 


#*** Example 7.11 ----
# Find the variance of the random variable X given by the roll of a fair six sided dice.
# Well, E[X] = 1/6 * (1+2+3+4+5+6) = 3.5 and we calculated above that E[X^2] = 15.16667.
# Therefore the variance is Var(X) = E[X^2] − (E[X])^2 = 15.1667 − 3.5 = 11.6667.

# We may also define the standard deviation σ of a random variable as the square root of the variance.
#   σ = √Var(X).

# The standard deviation of a random variable has the advantage of having the same units as the outputs of the random variable X.
# Recall that we can use the mean and standard deviation to get prediction intervals for discrete random intervals using either the empirical rule (for mound-shaped distributions) or Chebyshev’s rule for non-mound shaped distributions.


#** 7.5.1 Variance of Sums of Random Variables ----
# We may find the variance of the sum and constant multiple of independent random variables using the following theorem.


#*** Theorem 7.4 (Variance of a Sum of Random Variables) ----
# Let Y=aX1 + bX2 be a random variable which is the sum of two independent random variables X1 and X2 with a,b constant numbers.
# Then we have:
#   Var(Y) = Var(aX1 + bX2) = a2Var(X1) + b2Var(X2).


# example
#   if we consider the random variable Y = X1 + X2 given by the sum of the results of two dice rolls again.
#   Since the two dice rolls are independent we have that Var(Y) = Var(X1) + Var(X2) = 11.6667 + 11.6667 = 23.333.


#_---- 


#* 7.6 Bernoulli Random Variables ----------------------------------------
# The simplest discrete random variable is called a Bernoulli random variable.
# Despite their simplicity we may use them as building blocks towards more complex random variables.


#** Definition 7.4 (Bernoulli Random Variable) ----
# A random variable X is called a Bernoulli random variable if:
#   It takes on only the values 0 and 1 (two possible outcomes)
#   P(X=1) = p and P(X=0) = q = 1−p.

# We often think of a Bernoulli random variable as a test, which is successful (equal to 1) with probability p and fails (equals 0) with probability q = 1−p.

# We can easily compute the expected value and variance of a Bernoulli random variable:


#** Theorem 7.5 (Properties of Bernoulli Random Variables) ----
# If X is a Bernoulli random variable then:
#   E[X] = p
#   Var(X) = pq
#   σX = √pq = √p(1−p)

# P(X = 1) = p
# P(X = 0) = q
# E[X]  = 1*P(X - 1) + 0^2*P(X = 0)
#       = P
# E[X^2]  = 1^2*P(X = 1) + 0^2*P(X = 0)
#         = p
# Var(X)  = E[X^2] - (E[X])^2
#         = p - p^2
#         = p(1-p)
#         = pq


#*** Exercise 7.5 ----
# As a doctor you prescribe an experimental drug to a patient, which will cure the disease with a probability p=0.20.
# Write this as a Bernoulli random variable and find the variance of this random variable.
# Also, find the formula for the expected value and variance of a Bernoulli random variable from the definitions
#   X = random variable describing if cure is successful
#   P(X = 1)  = 0.2
#   P(X = 0)  = 0.8
#   E[X] = P(X = 1) = 0.2
#   Var(X) = 0.2*0.8 = 0.16


#_---- 


#* 7.7 Binomial Random Variables -----------------------------------------
# Consider a random variable that counts the number of successes in N Bernoulli trials.
# We could write this random variable X as 
#   [X=N∑j=1]B[j]
#     where B[j] are independent identically distributed Bernoulli random variables.
# Since a Bernoulli random variable returns a 1 whenever the event is successful’’, the sum of these will give the number successes in N attempts.
# X is called a Binomial Random Variable and will take values in the range [0,1,2,...N].
# The following theorem gives the probability distribution of a binomial random variable.


#** Theorem 7.6 (Binomial Random Variable) ----
# A probability distribution for a Binomial random variable X is given by
#   P(X = m) = (N m)p^m(1−p)^(N−m)
#     where
#       N is the number of trials
#       m is the number of successes
#       p is the probability of success on each trial.

# We can compute the expected value and variance of a binomial random variable X using the definition that:
#   X = [N∑j=1]B[j]
#     with each B[j] being an independent Bernoulli random variable with a probability of success of p.
#   E[X] = E[[N∑j=1]B[j]] = [N∑j=1]E[B[j]] = [N∑j=1]p = Np.
# The variance can be found in a similar manner
#   Var(X) = Var([N∑j=1]B[j]) = [N∑j=1]Var(B[j]) = [N∑j=1]p(1−p) = Np(1−p) = Npq.
# Let’s record these results as a theorem:


#** Theorem 7.7 (Expected Value and Variance of Binomial Random Variables) ----
# If X is a binomial random variable with N trials with a probability of success of each trial p then:
#   E[X] = Np
#   Var(X) = Np(1−p) = Npq


#*** Example 7.12 ----
# Karl is guessing on a true/false quiz with ten questions.
# Find the probability distribution for the number of questions he gets correct.
# This is a binomial random variable with N=10 and p=1/2.
# Therefore
#   P(X=m) = (10  m) * (0.5)^m * (0.5)^(10−m) = (10 m) * (0.5)^10


#*** Example 7.13 ----
# In the NBA finals they play a seven-game series of games.
# The team who wins four (or more) games wins the championship.
# The Golden State Warriors are heavy favorites and the probability they win a given game against the Cleveland Cavaliers is p=0.6.
# Lets assume that the games are independent.
# What is the probability that the Cavaliers win the series?
# The Cavs will win the series if they win four or more games out of 7.
# Let the number of Cavs wins be the random variable X.
# This is a binomial random variable with N=7, p=0.4 (the chances the Cavs win is 1-0.6=0.4) and the want P(X≥4).
# Using the binomial distribution we have: 


# P(X≥4)  = [7∑m=4](7  m) * (0.4)^m * (0.6)^(7−m)
#         = (7  4) * (0.4)^4 * (0.6)^3 + (7   5) * (0.4)^5 * (0.6)^2 + (7   6) * (0.4)^6 * (0.6)^1 + (7   7) * (0.4)^7 * (0.6)^0
#         = 0.2897
# So even with a heavy favorite and a seven game series the inferior team still wins about 29% of the time.
# This distribution is shown in Fig.7.6.


#*** Exercise 7.6 ----
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


#_---- 


#* 7.8 Binomial Random Variable in R -------------------------------------
# A binomial random variable X gives the number of successes in N independent Bernoulli trials each with a probability p of success.
# Recall that probability distribution function for a binomial random variable is given by 
#   P(X = k) = (N   k) * p^k * (1−p)^(N−k)
#     where N is the number of trails and p is the probability of a success on any given trial.
# (N, p) are called the parameters for a binomial distribution.
# R provides several tools for studying binomial random variables.


#** 7.8.1 Probability Distribution in R ----
# First, we may find the probability of an event using the dbinom command.
# example,
#   if we want to know the probability of having 3 successes in 10 trials, with a probability of success on each trial of 0.4 we would type:
dbinom(3, size=10, prob=0.4)    # Find the probability of having 3 success out of 10 for binomial with N=10, p=0.4


# The size=10 tells R that N=10 and prob=0.4 sets the p=0.4.
# If we want to make a plot of a binomial distribution we can use the barplot feature:
x <- 0:10    # make a vector of numbers from 0 to 10
y <- dbinom(x,size=10, prob=0.4)    # calculate the probability of each value using dbinom
barplot(y, names.arg=x, ylab='Probability', xlab='Number of Sucesses', main='Binomial Distribution Plot', col='coral')    # make a barplot


#** 7.8.2 Cumulative Distribution Calculations in R ----
# When finding probabilties we very often want to answer questions like P(X≤m).
# example
#   we may want to know the probability that I see less that 40 heads when flipping a fair coin 100 times.
# We could get this answer the long way by doing a long sum.
#   P(X≤m) = [m∑j=1]P(X=j)


# However, this can get cumbersome quickly.
# It is better to use the pbinom function in R which calculates this sum for us.
pbinom(40, size=100, prob=0.5)


# The argument 40 tells R we want the probability that X≤40.
# For the coin flipping example we can see that only about 2% of time will we see less than or equal to 40 heads appear.

# Equivalently, if we want to find probabilities like P(X>m), we can use the formula
#   P(X>m) = 1 − P(X≤m).

# For example, we can find the probability we see more than 55 heads using:
1 - pbinom(55, size=100, prob=0.5)
#   so only around 13% of the time will we see more than 55 heads.


#*** 7.8.3 Random Binomial Distribution in R ----
# We may also generate random numbers drawn from a binomial distribution, using therbinom function.
# The below code draws 10 random numbers from a binomial distribution with N=100 and p=0.5
rbinom(10, size=100, prob=0.5)


# Each of these numbers gives the results of flipping a fair coin one hundred times and counting the number of heads that come up.
# Each time we do this we would get different answers.
# However we draw large samples we can see the law of large numbers start to take effect, where the average of our samples is very close to the theoretical average Np for a binomial distribution.
rs <- rbinom(10000, size=100, prob=0.5)
mean(rs)

# In addition for large sample sizes the histogram of the random samples approaches the theoretical probability distribution.
rs <- rbinom(10000, size=10, prob=0.4)
hist.data <- hist(rs, freq=FALSE, breaks=10, main='Histogram of Random Samples from a Binomial Dist', col='coral')


# This histogram should look close to the barplot of the distribution we made above.
# However, any random sample won’t match the theoretical probability distribution exactly due to sampling error.
# Sampling error is a huge topic in statistics so much more on this later.


#_---- 


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


# ____----


# Chapter 8 Continuous Random Variables -----------------------------------
#* 8.1 Introduction to Continuous Random Variables -----------------------
# We will now consider continuous random variables, which are very similar to discrete random variables except they now take values in continuous intervals.
# example,
#   the time you have to wait for a bus could be considered a random variable with values in the interval [0,∞).
#   That is you could wait for any amount of time before the bus arrives, including a infinite amount of time if you are not waiting at a bus stop.

# Much of what we have learned about discrete random variables carries over to the study of continuous random variables.
# example,
# to specify a continuous random variable fully we still want to define two characteristics:
#   1. The range of values the random variable can take (this will now be a continuous interval instead of a list)
#   2. The probability of the random variable taking on those values
#       (this is called the probability density function fX(y)).
#       This gives the probability density at each point, which is not quite the same thing as the probability.

# Continuous random variables differ from discrete random variables in a one key way:
# 1. The P(X=y) for any single value y is zero.
#   This is because the probability of the random variable taking on exact value out of the infinite possible outcomes is zero.
#   Therefore we asking about probabilities for continuous random variables we ask for the probability the random variable produces a value in some range (a,b) of values
#     P(a≤X≤b)
#   Graphically, the probability the random variable taking values in the range (a,b) is given by the area under the probability density curve between a and b.

# The calculation of these probabilities from the probability density functions by hand typically involves Calculus.
# Since Calculus is not a prerequisite for this course we will have to gloss over some of the details for continuous random variables and lean on R to help us calculate some quantities.

# The total area under the probability density function fX(y) will be one.
# This comes from the axioms of probability: The sample space must cover all possible outcomes.


#_---- 


#* 8.2 Uniform Random Variable -------------------------------------------
# The simplest continuous random variable is the uniform distribution U.
# This random variable produces values in some interval [c,d] and has a flat probability density function.
# Below we plot the uniform probability distribution for c=0 and d=1. 

# The probability density function for the uniform distribution U on the interval [c,d] is given by
#   fU(y) = 1 / (d−c),  c≤y≤d.
# The uniform distribution has a probability density of zero for values outside of its range [c,d].

# The probability that the uniform random variable U takes values in a range (a,b) is given by
#   P(a ≤ U ≤ b) = (b−a) / (d−c).

# For a uniform distributed random variable on the interval [c,d] we have
#   E[U] = μ = (c+d) / 2
#   σ^2 = 1/12 * (d−c)^2


#*** Exercise 8.1 ----
# Find the mean and variance of the uniform random variable on the interval [−1,1]
#   mean = (c+d)/2 = 0
#   var = (d-c)^2 / 12 = 4/12 = 1/3


#*** Exercise 8.2 ----
# Is the uniform random variable symmetric?
#   Yes


#*** Exercise 8.3 ----
# What is the median of a uniform distribution on [0,1]? 
#   median = mean = (1+0)/2 = 1/2


#_---- 


#* 8.3 Normal Distribution -----------------------------------------------
# The most common distribution used in statistics is the Normal Distribution.
#   It is also known as the Gaussian Distribution or the bell curve.
# The reasons that the normal distribution comes up so frequently in statistics will be revealed in the next chapter.
# For now, we note that random errors typically follow a Normal distribution.
# Below we plot the probability density function for the Normal distribution.

# You can see that the Normal probability density function is a mound-shaped distribution and is symmetric about its mean value.
# In fact, the normal distribution is the mother of all mound shaped distributions.
# The techniques we learned about in EDA for mound-shaped distributions are based on the assumption that the distribution is normally distributed.
# More on this below.

# To specify a normal distribution we need two parameters the mean μand the standard deviation σ.
# These give the center of the hump and the width of the normal distribution respectively.
# The probability density function for a normal random variable N is given by
#   fN(y) = 1/√2πσ^2 * e^[−(y−μ)^2 / 2σ^2].
# Since the two parameters for a Normal distribution are the mean μ and standard deviation σ we don’t need any separate formulas for the mean and standard deviation of a Normal random variable.


#** 8.3.1 Cumulative Distribution Function (CDF) for Normal Random Variables ----
# Within R we can easily find a probability of the form P(−∞ ≤ N ≤ b).
# Probabilities of this form are used so frequently they are given a special name, the "cumulative probability density" of a normal random variable
#   FN(x) = P(−∞ ≤ N ≤ x) = P(N ≤ x).
# The below plot depicts the cumulative distribution function value FN(2) for a normal random variable with μ=0,σ=1.

# We can also plot the Normal CDF by itself: 

# We can see that FN(x) for a normal random variable with μ=0,σ=1 goes to one as x becomes large and goes to zero as x goes toward −∞.
# This should make sense as the probability of a random number from the normal distribution being less than a very large number is very high.
# The probability of being less than say −100 will be tiny.

# Within ‘R’ we can find the CDF for a normal distribution easily using the pnorm function:

pnorm(1.5, mean=1.0,sd=2.0) # find the probability N < 1.5 for a normal r.v. with mean=2.0 and standard deviation=2.0

# Graphically, this means the blue area is 0.5987063 in the below plot: 

# Notice we can also find the probability of seeing a random number larger than some value using
#   P(N > x)= 1 − P(X ≤ x) = 1 − FN(x).
# Therefore, if we want to know the probability of seeing a value greater than 5 for a Normal random variable with μ=0,σ=2.5 in R we could type:
1 - pnorm(5, mean=0.0, sd=5.0)


#** 8.3.2 Finding Probabilities for the Normal Distribution ----
# We are now ready to calculate the probability of the form P(a≤N≤b) for a Normal random variable N.
#   P(a ≤ N ≤ b) = FN(b) − FN(a).
# Therefore, in R if we want to find the probability of a random sample lying within the interval [1,2] for a normal random variable with μ=1,σ=3.0 we can type:
pnorm(2.0, mean=1.0, sd=3.0) - pnorm(1.0, mean=1.0, sd=3.0)


#*** Exercise 8.4 ----
# For a normal random variable with μ=5.0,σ=1.0 find P(3.0≤N≤7.0) using R.
pnorm(7.0, mean = 5.0, sd = 1.0) - pnorm(3.0, mean = 5.0, sd = 1.0)
#   Note: this is prob of NRV between 2 sd of mean


#*** Exercise 8.5 ----
# For a normal random variable with μ=0.0,σ=1.0 find P(−1.0≤N≤1.0).
pnorm(1.0, mean = 0.0, sd = 1.0) - pnorm(-1.0, mean = 0.0, sd = 1.0)
#   Note: this is prob of NRV between 1 sd of mean


#*** Exercise 8.6 ----
# For a normal random variable with μ=0.0,σ=2.0 find P(|N|>1.5).
1 - pnorm(1.5, mean = 0.0, sd = 2.0)


#_---- 


#* 8.4 Standard Normal Distribution (Z -----------------------------------
# The Normal distribution with μ=0,σ=1 is called the standard Normal distribution.
# The standard normal distribution is used so often that it gets its own symbol Z.
# Notice we can transform any Normal random variable to the standard normal random variable by setting
#   Z = (X − μ)/σ.

# The benefit of doing this transformation is that asking the question P(−1≤Z≤1) tells us the percentage of the population which lies within one standard deviation of the mean for ANY normal random variable.
# Likewise, P(−2≤Z≤2) gives us the fraction of the population within two standard deviations of the mean for ANY normal random variable, etc.

# We can find those numbers easily in R
pnorm(1.0, mean=0, sd=1) - pnorm(-1.0, mean=0, sd=1)

# For two standard deviations we find:
pnorm(2.0, mean=0, sd=1) - pnorm(-2.0, mean=0, sd=1)


# These numbers (68%, 95%) should be somewhat familiar as we saw they earlier in the context of the empircial rule for forming prediction intervals for mound-shaped intervals.
# We can now see that these values were derived from the standard normal distribution.
# This is what I meant by the Normal distribution being the mother of all mound-shaped distributions.
# When we learned about tools for analyzing mound-shaped distributions we were assuming the distribution had a Normal distribution.

# For example the outlier rule for mound-shaped distributions (that any data point with |z|>3 can be considered an outlier for mound-shaped distributions) comes from the calculation:
pnorm(3.0) - pnorm(-3.0)

# This tells us that for a Gaussian distribution we expect more that 99.7% of the data to lie within 3 standard deviations of the mean.
# Hence the z-score based outlier classification we learned.
# You will notice I didn’t specify the mean and standard deviation is the above command.
# This is because R assumes the distribution is the standard normal Z unless told otherwise.


#** 8.4.0.1 Note ----
# Before we had computers the values in the CDF calculations we did above had to be looked up in tables.
# Since books can’t have infinite pages they couldn’t make tables for normal distributions with every possible mean and standard deviation.
# Therefore, the practice was to convert all normal random variables to standard normal values Z, and then look the values up in the table for the standard normal random variable.

# Many statistics instructors still teach and advocate for the use of statistical tables.
#   In my mind this is very old fashioned and is less accurate then using a computer.
#   You won’t be expected to look these numbers up in tables.
#   However, you may run into table advocates at some point in your life.
#   They will be extremely smug about using tables to look-up values, until you point out this is less accurate than using a computer


#_---- 


#* 8.5 Assessing Normality -----------------------------------------------
# We have already seen in our study of EDA that we can use more powerful tools when distributions have a mound-shape (Normal distribution).
# This will be a major theme in the class.
# If you can identify that a data set has a normal distribution then you can use more powerful tools to analyze it.

# Now that we have learned about the normal distribution we can develop some tools for determining whether a given distribution is normally distributed.
# These tools are still somewhat subjective but are a definite improvement over just looking at a histogram and trying to decide if it looks kinda like a mound as we did in our EDA chapter.


# Steps for Assessing Normality in a Data Set
#   1. Look at the histogram (does it even roughly look like a mound? If yes continue, if no you are done)
#   2. Find the IQR and sample standard deviation s for the data. If the data is approximately Normally distributed then you should have: 
#     IQR / s ≈ 1.3
#   3. Make a Quantile-Quantile plot of the data set. If the data is approximately normally distributed this should be approximately linear (lie along a straight line).

# The only really new concept is this procedure is making a Quantile-Quantile plot or QQ plot.
# This plots the z-scores
#   z = (x − ¯x) / s
#   of the data points quantiles against the quantiles of a standard normal distribution.
#   If the quantiles are the same then the plot will fall along a straight line.
#   The quantiles agreeing means the two distributions have roughly the same shape at up until that point.

# For a first example we will analyze a fake data set which we know should have a mound-shape distribution:
fake.data <- rnorm(100) # Generate 100 random numbers from the standard normal distribution

# First we make a histogram of the data:
hist(fake.data, breaks = 12)

# Indeed this looks roughly mound-shaped, so we proceed to the second test:
IQR(fake.data) / sd(fake.data)

# This is close to the target value 1.3.

# Now we make make a QQ-plot:
qqnorm(fake.data)
qqline(fake.data, col='red')

# The data points are shown as circles and we used the command qqline to add a line.
# We can see almost all the points lie along the line, meaning that the distribution is very close to being exactly normal.
# Indeed this should be the case because we generated the data from a normal distribution!

# We can redo this analysis for fake data which is drawn from a uniform distribution.
# A uniform distribution is decidedly NOT mound-shaped.
# Therefore we expect we should fail at every step.
fake.unif <- runif(100) # Generate 100 random numbers from the uniform distribution on [0,1]

# First we make a histogram of the data:
hist(fake.unif)

# Not very mound-shaped like, but if we ignored that and proceeded to the next step we get:
IQR(fake.unif) / sd(fake.unif)

# This is not close to the target value of about 1.3.

# Now we make make a QQ-plot:
qqnorm(fake.unif)
qqline(fake.unif, col='red')


#*** Exercise 8.7 ----
# Assess the Normality of the Hong-Kong Children Data Set for the weight column.
head(hkhw)
hist(hkhw$Weight.lbs)

IQR(hkhw$Weight.lbs) / sd(hkhw$Weight.lbs)

qqnorm(hkhw$Weight.lbs)
qqline(hkhw$Weight.lbs, col = "red")

#   All test passed. weight follows normal distribution.


#_---- 


#* 8.6 Regression to the Mean --------------------------------------------
# Now lets talk about an important application of the intuition we have been developing for probability.
# The below plot in Figure below shows the points scored in each game of the 2016 season by Lebron James.
Lebron_James_2016 %>%
  mutate(game_number = row_number()) %>%
  select(PTS, game_number) %>%
  filter(!is.na(PTS)) %>%
  ggplot(aes(x = game_number, y = PTS)) +
  geom_line() +
  geom_point() +
  geom_hline(
    yintercept = Lebron_James_2016 %>%
      filter(!is.na(PTS)) %>% select(PTS) %>% summarise(mean(PTS)) %>% flatten_dbl(),
    color = "red"
  ) +
  labs(x = "Game Number", y = "Points Scored", title = "Lebron James Points Scored 2016")

# Figure above:
#   Regression to the mean in points scored in games by Lebron James in 2016.
#   Notice how his best games tend to be followed by worse performances.
#   His worst games are usually followed by an improvement.
#   The horizontal red line shows his season average. 

# For the sake of argument lets assume that the points scored by Lebron James in a given game are independent random draws from his distribution of points scored.
# The probability density function of his point scored is shown below a estimated from the data.
Lebron_James_2016 %>%
  mutate(game_number = row_number()) %>%
  select(PTS, game_number) %>%
  filter(!is.na(PTS)) %>%
  ggplot(aes(x = PTS)) +
  geom_density() +
  labs(x = "Points Scored", y = "Probability Density", title = "Lebron James: Point Scored PDF")

# Given this if Lebron scored 35 points in his last game, what is the probability that he will score fewer points in the next game?
# We can visualize this on our PDF plot as:
p <- Lebron_James_2016 %>%
  mutate(game_number = row_number()) %>%
  select(PTS) %>%
  filter(!is.na(PTS)) %>%
  as.data.frame() %>%
  ggplot(aes(x = PTS)) +
  geom_density()

d <- ggplot_build(p)$data[[1]]

p +
  geom_area(data = subset(d, x <= 35), aes(x = x, y = y), fill = "red", alpha = 0.6)


#_---- 


#* 8.7 Final Thoughts on Random Variables --------------------------------
# Many other random variables exist which we do not have time to cover in this class.
# In general if a random variable exists and is useful to more than two people then R has it.
# For any given random variable you should be able to use R to find P( a ≤ X ≤ b) using the cumulative distribution function.

# example,
#   the Cauchy distribution is often used in physics and chemistry.
#   It has two parameters called the location and scale.
#   We will use the standard Cauchy distribution with a location=0 and scale=1.
#   It is continuous with a probability density function:
x <- seq(-5,5,0.01)
y <- dcauchy(x)
plot(x, y, type='l', main='Cauchy Distribution')

# We can find the probability that a random number drawn from a Cauchy distribution lies in the interval [−1,1] as:
pcauchy(1) - pcauchy(-1)


#_---- 


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


# ____----


# Chapter 9 Introduction to Sampling Distributions ------------------------
#* 9.1 Why Sample? -------------------------------------------------------
# We have learned about the properties of probability distributions such as the Normal Distribution.
# Up until now we assumed we are given a probability distribution and learned how we can extract information from knowledge of the distribution.
# example,
#   given that a process follows a binomial distribution how can we calculate the mean? This is probability theory.

# Now we are going to start learning Statistics where we are concerned with estimation of parameters from random samples.

# Example:
#   Lets say we want to estimate the mean height of Schreiner students.
#   Heights follow some distribution function, so one way to do this would be to collect the heights of every Schreiner students and take the average of this list to get an answer.
#   This approach has the advantage of giving an exact answer.
#   However, collecting all that information would be a huge investment of time.

# For the Schreiner heights example it would be a hassle to collect all the data.
# In other situations it may be practically impossible to collect all that information.
# Imagine a medical study where instead of asking someone how tall they are you have to pay them 30,000 dollars to participate in a drug trial.
# No way the drug company is going to pay everyone in the United States to take a drug, or even everyone at Schreiner.

# Collecting information is both expensive and time-consuming so we need a better approach.


#** 9.1.1 Average Height Example ----
# To illustrate the idea behind sampling lets imagine we did ask every student their height.
# To simulate this process I create a list of random height values which is 1200 students long.
# We can then find the average value of the list to get an exact answer for the average height of Schreiner students.
heights <- rnorm(1200, mean=5.5, sd=4/12.0)
mean(heights)

# Thus we find that average height of Schreiner students is exactly 5.4915223 feet.
# We can also make a histogram our our fake height data for Schreiner students.
hist(heights, col='coral',
     main='Heights of Schreiner Students', ylab='Proportion of Students', xlab='Height (ft)', freq=FALSE)

# But lets say that I also gave the task of finding the average height to a lazy person (not an Applied Stats student, but maybe after this lesson).
# They start going around to ask everybody their heights, but get bored and quit after only asking N number of people.
# When it comes time to report the answer they panic and just average up the people they did ask and turn that in.

# How wrong would they be?
# We can examine this using the sample() command in R.
# The below command simulates us randomly choosing N people, recording their heights, and then averaging.
N = 50; # The number of people they ask before quitting
mean(sample(heights, replace=FALSE, size=N)) # the panic answer

# A very important point is that if we did this again we would get a slightly different answer this time:
mean(sample(heights, replace=FALSE, size=N))

# The answer we get if we quit early will depend on who exactly we asked.
# example,
#   if we happened to run into the basketball team and recorded their heights and then quit we would end up with a very wrong answer for the mean height of a Schreiner student!
#   However, notice that if we choose only 50 students at random above we get an answer which is pretty close to the exact answer 5.4915223 we would find if we went to the trouble of asking every single student on campus their height.


#*** 9.1.1.1 Analysis ----
# Wow that is not so bad!
# Unless they are very unlucky they can give a pretty good answer after only doing a fraction of the work.
# Note however that every time we run the lazy person sample it changes a little bit.
# This has to do with the order that they ask people in.
# If they just so happen to ask a few tall people first and then quit the answer can be farther off.
# However, if they keep asking people this bad luck will be balanced out fairly quickly.


#*** 9.1.1.2 Why does this work? ----
# First, notice that their is something magical about the mean.
# Lets say I have asked 100 students and have an estimate of 5.4 feet for the average height.
# If we let h1,h2,...h100 be the heights then we can write this as: 
#   s100 = (h1 + h2 + ... + h100) / 100 = 5.40

# I decide to quit, but as I am walking back to my dorm I pass one more person and decide to collect their height as well.
# It just so happens to be Kevin Durant (a professional basketball player) who is 7 feet tall.
# If I include him in my sample how does that effect it?
#   s101 = ((h1 + h2 + ... + h100 + 7.0) / 101) = (100 / 101)((h1 + h2 + ... + h100)/100 + (7.0/100)) = 0.990(s100 + 0.07) = 5.4158

# So adding a 7 foot person to your sample only changes it by less than 0.02 feet.
# This is because we divided the 7.0 number by the number of samples.
# It is hard to change the average value after the sample size is large enough.
# It is resistant to random effects when the sample size is large.

# Note, this is our friend the Law of Large Numbers again.
# Since we are looking for the expected value (average) of the sample we expect this value to become more predictable as we increase the number of people included in the sample.


#_---- 


#* 9.2 Inferences and Point Estimators -----------------------------------
# We have seen that it is possible to make some inference about the average height of Schreiner students from a sample taken from the whole student body.
# We expect this value to be vary slightly with the sample we take.

# In more general terms we are trying to make an inference about the mean of the population distribution.
# We call the true probability distribution the population distribution.
# The population distribution for the heights example was shown in our first histogram where we asked every student their height:
hist(heights, col='coral', main='Heights of Schreiner Students', ylab='Proportion of Students', xlab='Height (ft)', freq=FALSE)

# As noted the population distribution is often unobtainable in a practical sense but as the height example shows we may be able to get an idea of its properties by sampling from it.
# We hope to infer properties of the whole population from a relatively small sample.
# The process we are engaged in is called statistical inference.

# In many practical cases we may be interested in estimating some descriptive statistic, instead of the entire population distribution function.
# example,
#   we have seen an example where we were looking for an estimate of the mean of the height distribution.
#   We didn’t have to turn in all our height measurements, just the average of them, if you had to turn-in the whole list it would be more obvious who had been lazy and only asked a few people.

# When we are only interested in a single number (mean, variance, median, etc) then we are talking about a point estimator ^θ.
# If we had been looking for the median height of Schreiner students we might have used the median of our sample to estimate the population median.
# It is vital to understand that a point estimator ^θ is a random variable, because each time we collect a sample we will get a slightly different answer.
# The population parameter we are trying to estimate θ is NOT a random variable, but a fixed value we are trying to estimate.
# There is an average height of Schreiner student!
  
# Since ^θ is a random variable we can use probability theory to analyze its properties.


#_---- 


#* 9.3 The Distribution of Sample Means ----------------------------------
# We are now ready to use probability theory to analyze the properties of the point estimator ^θ random variables.
# We will focus on a the special point estimator ¯X which uses the sample mean to form an estimate for the population mean.
# The random sample and then average procedure we have been using can be written in terms of random variables. 
#   X = (1/N) * [N∑j=1]X[j].

# Here ¯X is the random variable describing the outcomes from sampling N values from a population which follows the random variable Xj.
# Each of the random variables Xj are independent and identically distributed.
# For the heights of Schreiner students example, each Xj is the height of a randomly chosen student.

# Since ¯X is defined as the sum of random variables we can use our property of expected values E[aX+bY]=aE[X]+E[Y] to find the expected value of the random variable ¯X.
# In particular we have that, 
#   E[¯X] = E[(1/N) * [N∑j=1]X[j]] = (1/N) * [N∑j=1]E[Xj] = Nμ/N = μ.

# Where μ is the population mean.
# If the expected value of the point estimator ^θ equals the population parameter it is trying to estimate E[^θ]=θ we say that the estimator is an unbiased estimator for θ.
# In turn if an estimator does not have this property we say that the estimator is biased.

# Another important property of a statistical estimator is the variance of the sampling distribution.
# This measures how variable the answers will be depending on the random sample we take from the population distribution.
# For the sample mean estimator ¯X we can find the variance of our random sample using the properties 

# Var(aX + bY) = a^2Var(X) + b^2Var(Y) for independent random variables X and Y.
# Var(¯X) = σ^2[¯X] = Var[(1/N) * [N∑j=1]X[j]] = (1/N^2) * [N∑j=1]Var[X[j]] = Nσ^2 / N^2 = σ^2 / N
# σ¯[X] = σ / √N

# The standard deviation of the point estimator is called the standard error of the estimator σ¯X.
# Notice that no matter how large the population standard deviation σ is, the standard error of the sample mean estimator goes to zero as the sample size goes to infinity.
# Therefore, if we take large enough samples the sample mean will become very close to the population mean.
sample.size <- 50;
store <- replicate(10000, mean(sample(heights, size=sample.size, replace=TRUE)))
hist(store, col='coral', xlab='Sample mean', main='Distribution of Sample Means N=50')
sd(store)

# The standard deviation of this distribution is σ¯X=0.0470108 found through simulation above.
# If we used our formula for the standard error we get 
#   σ¯X = σ / √N = (4/12) / √50 = 0.047

# Thus our random sampling will produce a very accurate and consistent answer for the population mean if we only ask 50 out of the roughly 1200 students are Schreiner!

# It is very important to remember that our formula for the standard error for the sample mean point estimator ONLY applies if we take a truly random sample, where each data point is exactly independent of all the others.
# If we did our “random” sample by standing outside the gym after basketball practice gets out we will get much,much worse results.


#*** Exercise 9.1 ----
# What is the standard error for our height sampling problem if we ask 100 randomly chosen students?
(4/12) / sqrt(100)


#*** Exercise 9.2 ----
# How many samples should I take if I want to σ¯X<0.01, if I am sampling from a population with σ=1?
#   σ¯X = σ / √N
#   0.01 > σ¯X
#   0.01 > 1 / √N
#   √N > 100
#   N > 10000
1 / sqrt(10000); 1 / sqrt(10001)


#*** Exercise 9.3 ----
# Do the above results depend on the distribution of the random variables Xj? 
#   No


#_---- 


#* 9.4 Distribution of Sample Means --------------------------------------
# You may notice that our distribution of sample means above looks suspiciously like a normal distribution.
# Lets investigate this will our tools for assessing normality learned in the last chapter.
# We have already made a histogram and it looks like a normal distribution to me, so we proceed to step 2:
IQR(store)/sd(store)

qqnorm(store)
qqline(store, col='red')


# This plot shows that the distribution of sample means is very well approximated by a normal distribution.
# It turns out this will be true whenever the population distribution follows a normal distribution N(μ,σ), the distribution of sample means will also follow a normal distribution with the same mean μ and a standard deviation which decreases with the sample size N(μ,σ/√N).
# We can use this information to calculate the probability of obtaining results in our sampling.
# example,
#    the odds that we ask 50 random Schreiner students their heights and our sample mean is less than 5.3 is given by:
m <- mean(heights) # mu the population mean
my.sd = sd(heights)/sqrt(50) # the standard deviation of sample means, with sample size 50
pnorm(5.4, mean=m, sd=my.sd)


#** 9.4.1 The Central Limit Theorem ----
# What if the population distribution we are sampling from is NOT a normal distribution?
# Can we say anything about the distribution of sample means in that case?

# To investigate this lets create a population of heights which is uniform.
heights.uniform <- runif(1200,min=5.0, max=6.0)
hist(heights.uniform, col='lightblue', main='Uniform Population Distribution of Heights')

# Just like before we could simulate asking 50 students their heights and then averaging using the sample command.
mean(sample(heights.uniform, size=50))

# Each time we do this we would get a slightly different answer:
mean(sample(heights.uniform, size=50))

# If we imagine repeating this experiment many times, asking 50 random students their heights and then averaging, we can get an idea of the distribution of sample means.
sample.size<-50;
sample.uniform<-replicate(10000, mean(sample(heights.uniform, size=sample.size, replace=TRUE)))
hist(sample.uniform, col='coral', xlab='Sample mean', main='Distribution of Sample Means for a Uniform Pop Dist N=50')

# Surprisingly this looks a lot like a Normal distribution!. Lets investigate this further:
IQR(sample.uniform)/sd(sample.uniform)

# This is relatively close to the Normal distribution value of 1.3. So we proceed to make a QQ plot:
qqnorm(sample.uniform)
qqline(sample.uniform, col='red')

# Thus our sampling distribution is well approximated by a normal distribution.
# This result is known as the central limit theorem.


#** Theorem 9.1 (Central Limit Theorem) ----
# Consider a random sample of n observations selected from a population (any population) with a mean μ and standard deviation σ.
# Then when n is sufficiently large the sampling distribution of ¯x for the sample mean will be approximately normal with mean μ and standard deviation σ¯x=σ√n.
# The larger the sample size the better the normal approximation will become. 
# Key Points
#   This is the most powerful tool in statistics.
#   Notice that sufficiently large is purposely vague in the statement.
#     It will vary with how bizarre our population distribution may be.
#     A rule of thumb is that a sample size of n≥30 is generally enough for the CLT to provide an accurate answer.
#   The CLT applies only to the sampling distribution of sample means.
#     If we want to estimate the median, variance, IQR, etc of the population we can’t use the CLT.


# Whenever you are considering a statistical result you should ask is the central limit theorem being applied to produce this result?
# If yes then make sure the conditons have been satisfied.

# Misuse of the central limit theorem is perhaps the most common abuse of statistics.
# Usually, it is applied to data with small sample sizes N<30. 


#*** Exercise 9.4 ----
# Repeat the above analysis for estimating the mean value of a uniform population, using a sample size of only 10.
# Does the sample mean distribution pass the evaluations for normality in this case? 
sample.size <- 10
sample.uniform <- replicate(10000, mean(sample(heights.uniform, replace = TRUE, size = sample.uniform)))
hist(sample.uniform, col='coral', xlab='Sample mean', main='Distribution of Sample Means for a Uniform Pop Dist N=50')

IQR(sample.uniform) / sd(sample.uniform)

qqnorm(sample.uniform)
qqline(sample.uniform, col = "red") # passes the evaluations for normality


#*** Exercise 9.5 ----
# If we randomly sample 36 data points from a population which has a mean μ=0 and a standard deviation of σ=3.0.
# Estimate the probability that we get a sample mean greater than 7, i.e. P(¯X>7)
n <- 36
m <- 0
my.sd <- 3 / sqrt(n)

1 - pnorm(7, mean = m, sd = my.sd)


#_---- 


#* 9.5 Other Point Estimators --------------------------------------------
# We have focused mainly on the point estimator for the sample mean.
# This is because we can find a formula for the standard error and expected value for that point estimator.
# Additionally, we have the power of the central limit theorem at our disposal.
# However, let us not forget that many other interesting point estimators ^θ exist.
# example,
#   if we wanted to estimate the variance of the heights of Schreiner students, we could randomly sample the heights and estimate the population variance using this sample variance.
var(sample(heights, size=50))

# If we do this again we will get a slightly different answer:
var(sample(heights, size=50))

# If we do this many times we can get a distribution of sample variances, which we can plot as a histogram:
sample.size <- 50;
store.var <- replicate(10000, var(sample(heights, size=sample.size, replace=TRUE)) )
hist(store.var, col='coral', xlab='Sample SD', main='Distribution of Sample Variance N=50')

# The mean of this distribution of sample variances is 0.1119407 which is close to the population variance of 0.1123128.
# The standard error for this point estimator is approximately 0.0235871, estimated by finding the standard deviation of the sampling distribution in the above histogram.

# For these exercises we will use the applet “SamplingDemo”.
# If your version of my RPackage has been updated then you can launch this applet with the command:
runHannayApp(paste(path_shiny, 'SamplingDemo', ".R", sep = ""))


# Answer the following questions using this applet.
#*** Exercise 9.6 ----
# Set the population distribution to Normal and sample size to 30.
# Does the sampling distribution look normally distributed when the point estimator used is the:
# + Mean + Median
#   + Mean - Yes
#   + Median - depends on the sample picked.


#*** Exercise 9.7 ----
# Use the mean point estimator with samnple size greater than 30.
# Does the sampling distribution look normally distributed when the population is uniform, beta, binomial ?
# What theorem can we use to tell us this?
#   Yes for all 3
#   Central Limit Theorem


#*** Exercise 9.8 ----
# What happens to the standard error as the sample size increases for any of these point estimators?
#   sd decreases for all as sample size increasees


#*** Exercise 9.9 ----
# The dashed red lines in the sampling distribution plot show the 2.5% and 97.5% quantiles of the sampling distribution.
# How often do we expect that the population parameter (blue line) will fall outside these limits? 
#   P(X <= 2.5%) + P(X >= 97.5%)


#_---- 


#* 9.6 Sampling Distribution for the Sample Proportion -------------------
# You suspect a coin may be biased and want to estimate the fraction of flips which come up heads by collecting data.
# That is we want to infer the population parameter p from finite samples.
# You could think of estimating the fraction of heads from the data using the point estimator 
#   ^p = 1/N * [∑j=1]X[j]

# where each Xj is a Bernoulli trial (comes out 1 if a heads appears, and 0 if a tails appears.)
# Since N is finite we expect that each time we flipped the coin N times we will get a slightly different answer.
# Therefore, ^p is a random variable.

# We can find the expected value of the ^p point estimator 
#   E[^p] = E[1/N * [N∑j=1]X[j]] = 1/N * [N∑j=1]E[X[j]] = Np/p = p

# This tells us that ^p is an unbiased estimator for the population parameter p.
# The variance of our estimator σ2^p for our estimator is given by: 
#   Var[1/N * [N∑j=1]X[j]] = 1/N^2 * [N∑j=1]Var[X[j]] = Npq/N^2 = pqN


# using that the variance of a Bernoulli trial is p(1−p)=pq.
# Therefore, the standard error of a our point estimator ^p is given by: 
#   σ^p = √pq/N = √p(1−p)/N

# Thus, as expected the standard error decreases with the sample size N considered.
# In addition, for large sample sizes this estimator is approximately normal.
# A good rule of thumb for using the normal distribution as an approximation is given by:
  
# Rule of Thumb for ^p Normal Approximation:
#   1. N^p ≥ 15
#   2. N(1 − ^p) ≥ 15


#** 9.6.0.1 Example: ----
#*** 1. ----
# To figure out how popular a city proposal is, we conduct a survey of 100 randomly chosen people.
# If 40 people are in favor of the proposal then estimate the fraction of the whole city which support the proposal.
# Estimate odds that the true percentage is greater than 50?
# Our best estimate for the fraction of people of that support the proposal is 40/100=0.40, with a standard error of σ^p=√p(1−p)/N, using R to compute this gives:
sqrt(0.40 * 0.60 / 100)

# To find the odds that the true percentage is greater than 50% we can use the normal approximation.
# This is justified here because N^p = 100 ∗ 0.40 = 40 ≥ 15 and N(1 − ^p) = 100 ∗ 0.60 = 60 ≥ 15.
# To find these odds we can use pnorm with mean=^p and standard deviation given by the standard error we found above.
N <- 100
p_hat <- 40/N
se <- sqrt(p_hat * (1 - p_hat) / 100)
N*p_hat >= 15; N*(1 - p_hat) >= 15
1 - pnorm(0.50, mean=p_hat, sd=se)

# So based on our sample the odds that the true percentage of support in the population exceeds 50% is about 2%.


#*** Exercise 9.10 ----
# The San Antonio Spurs have won 40 of their first 55 games of the NBA season.
# We would like to estimate their winning percentage p giving the probability that they will win any given game using this data.
# Find an interval which should contain the Spurs true winning percentage about 95% of the time
# (Hint: Use the Normal Approximation and the Empirical Rule) 
N <- 55
p_hat <- 40/N # winning percentage
se <- sqrt(p_hat * (1 - p_hat) / 100)
N*p_hat >= 15; N*(1 - p_hat) >= 15
p_hat - 2*se; p_hat + 2*se # using emperical rule - mean +- 2sd





# The basis for all statistical reasoning is random sampling.
# When a sample is not drawn truly randomly the entire statistical procedures that follow are suspect.


#_---- 


#* 9.7 Tales in Sampling: Poincare’s Baker -------------------------------
# The french mathematician Jules-Henri Poincare visited the same baker each day to get his daily loaf of bread.
# He began to suspect that the loaves he was recieving were less than the 1000 grams advertised.
# To see if this was really the case he began weighing his daily bread loaves and kept a detailed bread journal of the results.
# The poor baker had no idea that Poincare was keeping a bread journal and just grabbed a loaf randomly each day to give him.

# Unfortunately, Poincare’s bread data has been lost to history at this point.
# However, I have recreated data with the same key components that he found.
head(poincare_bread)
summary(poincare_bread$bread.before)

# After collecting data for one year he found that the average bread loaf he recieved was only 950 grams.
# He also looked at the distribution of bread weights and observed a roughly normal distribution.
hist(poincare_bread$bread.before, main="Poincare Bread Police Part I", ylab="Number of Loaves", xlab="Weight (g)", col='brown')

# Poincare promptly contacted the police and the baker was cited for selling underweight loaves.


#*** Exercise 9.11 ----
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

#*** ----
# Amazingly, the story continues and Poincare continued to get his bread from the same baker and he maintained his weighing and bread journal.
# However, now the baker knew that Poincare had reported him to the bread police.

# Once again Poincare was able to find an anomaly in his bread data.
# Although the average weight of his loaves was now sufficient when he plotted a histogram of his bread weights since the initial police visit they did not show a mound shaped distribution.
# In fact, they now had a distinct lean to them.
# His new bread distribution had a surplus of heavy loaves and a relative sparsity of lighter loaves.
hist(poincare_bread$bread.after, main="Bread Weights after first Police Visit", ylab="Number of Loaves", xlab='Bread Weights', col="brown")


#***  Exercise 9.12 ----
# Why did the distribution change?
# What has the baker been doing?
# Hint what would you do in the baker’s shoes…
#   Probably created special loaves which were 1000+


#*** ----
# Poincare reported the baker once again to the bread police.
# Not sure what happened after this point, but I think we can assume that the baker either (i) quit baking bread (ii) stopped serving Poincare or (iii) corrected his recipes.


#_---- 


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


# ____----


# Chapter 10 Confidence Intervals -----------------------------------------
#* 10.1 Introduction NYC Flights Dataset ---------------------------------
# To introduce the idea of a confidence interval we will look at the NYC flights data set.
# This data set has flight data for over 30k flights which left the three NYC airports in 2013.

# The below commands load this data set into R and looks at the columns names.
# Remember you can also use the ?flightNYC and View(flightNYC) commands to get an idea of what is in this data set.
colnames(flightNYC)

# For the purposes of this lecture we will focus on the column flightNYC$dep_delay which gives the length of departures delays (in minutes) for each flight.
sample.size <- length(flightNYC$dep_delay)

# We can see this data set has 5000 measurements of the flight delays at takeoff.
# To begin we will focus on estimating the mean delay time of flights leaving NYC.


#_---- 


#* 10.2 Mean Flight Delays -----------------------------------------------
# As expected the first step to any exploratory data analysis is make a graph of the distribution, since the dep_delay column is a continuous statistical variable:
hist(flightNYC$dep_delay, col='coral', xlab='Departure Delay (min)')

# We can see that most of the delays are relatively small, with a few which are very large.
# Also, notice the distribution of delays is distinctly NOT mound shaped.
# From the data we can also calculate the sample mean of the delays.
mean(flightNYC$dep_delay)

# However, we expect that if we are trying to forecast future delays and collected data again for the next year we would expect this mean delay time to change!
# The next year would have different flights with different weather conditions, etc.
# This could cause problems as science is founded on the idea that other should be able to repeat our experiments and arrive at the same conclusions.

# This produces a logical conundrum, because if we just report the sample mean that we found, we are virtually guaranteed that if someone repeated our analysis they would find a different answer!
# Even more importantly, the sample mean is most likely not exactly equal to the population mean we are trying to estimate.
# This leads us to the important idea of a confidence interval.
# We can use confidence intervals to report an interval (a,b) of values which we can be confident contains the population mean.
# Instead of reporting a single value for the mean delay we give a range of values.
# This also ensures we don’t oversell the precision of our results.

# Perhaps, the most intuitive way of coming up with our confidence interval is to repeat the analysis many times and report the range of values (min to max) as the confidence interval.
# If the answer changes quite a lot each time we conduct the analysis then we should feel less confident about our results and therefore give a wider interval.
# In real-life repeating experiments may be impossible, impractical, expensive, boring, etc.
# For the flight data case we don’t have the time to collect 100 years of data and examine how variable the annual average of flight delays is.

# However, using the power of computers we can simulate this process quite easily.
second.study <- sample(flightNYC$dep_delay, 5000, replace=TRUE) # 5000 because that is the number of flights we have data for
mean(second.study)

# Notice that we I simulated this process I used the keyword replace=TRUE this is important as otherwise our simulation of recording flight delay times would have exactly the same flights as the original data!
# This keyword means we are allowed to measure the same flight twice and makes our simulation different on each run.

# If we repeated his simulation of measuring delays many times we would get a distribution of values, representing the results from thousands of replications of the analysis.
many.studies <- replicate(10000, mean(sample(flightNYC$dep_delay, 5000, replace=TRUE))) # measure the sample mean for 5000 flights 10 thousands times
hist(many.studies, col='coral', xlab='Flight Delays in Minutes', main='Histogram of Possible Mean Flight Delays NYC') 

# As a side note you may notice that this distribution of sample means looks very mound-shaped (Normal distribution).
# This is the central limit theorem at work!!
# Recall that the sample mean has the special property that sampling errors follow a normal distribution for large enough sample sizes.
# More on this observation in a minute.

# Now that we have an idea about all the possible values our analysis could have produced we can compute an interval containing say 95% of these sample mean outputs.
# We call this interval the 95% confidence interval.
# We can find this using the quantile command quite easily:
quantile(many.studies, c(0.025, 0.975))

# What does this confidence interval actually mean? Well we can’t really say that there in a 95% chance that our interval above contains the true population mean μ.
# This is because the true population mean of flight delays at NYC is a fixed but generally unknown number.
# The interval either contains the true mean or it doesn’t! However, here is what we can say about our confidence interval.
# If we have a long career in business analytics and form many thousands of 95% confidence intervals for various measurements, then we can expect that about 95% of our CIs would contain the true population parameter.
# We can’t say which ones were right and wrong for sure, but we can be confident that if we make enough of 95% confidence intervals we will be right about 95% of the time.

# The simulation and re-sampling process we used above to generate confidence intervals is called bootstrapping in statistics.
# To use it you don’t need to remember any formulas or theorems and it will work for whatever point estimator we could possibly want.
# example,
#   we could find the 95% confidence interval for the median flight delays using the commands:
many.median.studies <- replicate(10000, median(sample(flightNYC$dep_delay, 5000, replace=TRUE))) 
quantile(many.median.studies, c(0.025, 0.975))

# Notice that the only change was to change the mean of each sample to the median.
# This versatility makes bootstrapping one of the most useful processes in statistics.

# As a side note you will notice that performing a bootstrap analysis involves running two commands in R.
# One to run the simulations and one to form the confidence interval.

#*** Exercise 10.1 ----
#   File - Chapter 10.R


#*** Exercise 10.2 ----
#   File - Chapter 10.R


#*** questions ----
# To learn more about how to interpret confidence intervals open the app “ConfidenceIntervals” by running the command:
#*** 1. ----
#   File - Chapter 10.R


#*** 2. ----
#   File - Chapter 10.R


#*** 3. ----
#   File - Chapter 10.R


#*** 4. ----
#   File - Chapter 10.R


#*** Exercise 10.3 ----
#   File - Chapter 10.R


#_---- 


#* 10.3 Shortcut Using the Central Limit Theorem -------------------------
# As noted above the distribution of sample means is expected to follow a Normal distribution as a consequence of the Central Limit Theorem.
# In addition we know that this normal distribution will have a standard deviation equal to the standard error 
#   σ¯X = σ / √N.

# Therefore, the empirical rule tells us that 95% of the outcomes in this normal distribution will occur in the interval 
#   (¯X − 2σ¯X, ¯X + 2σ¯X).

# Moreover, if we wanted to have a 99% guarantee we could form the interval 
#   (¯X − 3σ¯X, ¯X + 3σ¯X)

# We already have ¯X (the sample mean) as:
mean(flightNYC$dep_delay)

# However, to use the formula for the standard error σ¯X=σ√N we need to know the population standard deviation σ.
# This is difficult because if we don’t know what the mean flight delays is, in all likelihood we don’t know what the standard deviation is either!
  
# One way around this logical trap is to use the sample standard deviation s as an estimate for the value of the population standard deviation σ.
# In R we can find this value as
sd(flightNYC$dep_delay)

# This is what is often done in practice and in old fashioned statistics.
# However, since the sample standard deviation is based on a sample it will change each time we conduct the experiment as well (as you saw in the exercise above).
# Fortunately, we have a fix for this issue.
# Instead of using a normal distribution we can use a distribution called the Student t distribution.
# This distribution accounts for the fact that our sample standard deviation is not a perfect estimate for the population standard deviation used in the CLT.

# As usual if we use R we can avoid having to deal with the student t distribution directly.
# This brings us to perhaps the most important R command of the entire course:
t.test(flightNYC$dep_delay)

# This produces a lot of output which we will be learning about over the next few weeks.
# For now we can ignore all the output except the line which gives us the confidence interval.
# By default R will find a 95% confidence interval. Notice that this confidence interval is pretty close to the one we found using simulations above.
# This is because the distribution of sample means is close to a t distribution.

# We could do a 99% confidence interval by changing one of the options to the t.test function.
t.test(flightNYC$dep_delay, conf.level=0.99)

# Notice we could get almost the same thing using bootstrapping (with less assumptions).
many.mean.studies <- replicate(10000, mean(sample(flightNYC$dep_delay, 5000, replace=TRUE))) 
quantile(many.mean.studies, c(0.005, 0.995))

# The Student t distribution becomes very close to the Normal distribution for large sample sizes.
# Therefore, most old-fashioned statistics textbooks usually define an entirely different test (called the z-test) for use with large sample sizes.
# If we are willing to use R then it makes no sense to use the z-test just to save the computer some work.
# Make the computer do the hard work!


#** 10.3.0.1 Conditions for using t.test for CIs ----
# Let us quickly review what the required conditions are to use a student t distribution to find a confidence interval:
#   1. Must be using the the sample mean ¯X estimator to estimate the population mean
#   2. Either a large enough sample size n≥30 for the Central Limit Theorem to apply, or for small sample sizes you need to know (assume) the population distribution is roughly mound-shaped.
#       This is because the confidence intervals formed using the t distribution assume that ¯X is approximately normally distributed.

# If either of these conditions are not met, then you need to use bootstrapping technique to estimate the confidence interval for the population mean.
# For the mean flight delay problem we are fine to use the t test approach because our sample size is 5000>30.


# A very common mistake is to use the student t distribution and CLT approach to form confidence intervals when these assumptions are violated.
# Most commonly when we have small sample size N<30 or when trying to form a confidence interval for a point estimator which is not the sample mean ¯x. 


#*** Exercise 10.4 ----
#   File - Chapter 10.R


#*** Exercise 10.5 ----
#   File - Chapter 10.R


#_---- 


#* 10.4 Additional Practice: Comparing Airports --------------------------
# We began work on the flights data set using all the measurements as one data set.
# However, we are often more interested in comparing the outputs for data covering different conditions.

# In particular, for the flights data set, we may interested in estimating the mean flight delays between the three airports in the NYC area.
# Recall that we can easily filter data in R.
# First, lets take a look at the different airports in our data set.
# Using the table command to look at how many flights we have from each airport in the data set.
table(flightNYC$origin)


# Now lets create three weight data sets for each of these origin airports:
delays.ewr <- subset(flightNYC$dep_delay,flightNYC$origin == 'EWR') # give the depature delays for flights out of EWR only
delays.jfk <- subset(flightNYC$dep_delay,flightNYC$origin == 'JFK')
delays.lga <- subset(flightNYC$dep_delay,flightNYC$origin == 'LGA')


# Since each of these data sets are relatively large we can use the t.test command to form the confidence intervals for the population mean.
t.test(delays.ewr) 
t.test(delays.jfk)
t.test(delays.lga)


# We can see that the confidence intervals EWR shows flights there tend to be delayed a bit longer on average.
# We will learn in the next chapter about how we can use statistics to find differences between groups.


#_----


#* 10.5 Population Proportion Confidence Intervals -----------------------
# Suppose that we want to estimate the fraction of the total flights which are delayed on departure going out of NYC.
# These are the flights which have a positive value in the dep_delay column.
# Lets make a new column on the data frame which tracks this:
flightNYC$is.delayed <- ifelse(flightNYC$dep_delay>0, 'Delayed', 'Not Delayed') # make a new column 
prop.table(table(flightNYC$is.delayed))


# So our first estimate for this might be that about 39% of the the flights out of NYC take off late.
# However, how confident should we be in this answer? How reliable is this estimate?
# For this we would like to find a confidence interval for our proportion.

# Let us start by simulating repeating this analysis using simulations.
# The below command finds the fraction of delayed flights in a simulated year of flights:
sum(sample(flightNYC$is.delayed, 5000, replace=TRUE)=="Delayed")/5000


# We could run this simulation again and we will get a slightly different answer:
sum(sample(flightNYC$is.delayed, 5000, replace=TRUE)=="Delayed")/5000

# Now lets do it thousands of times to get an idea about the sampling distribution of the proportion of delayed flights.
many.studies.delayed <- replicate(10000, sum(sample(flightNYC$is.delayed, 5000, replace=TRUE)=="Delayed")/5000)
hist(many.studies.delayed, col='coral', main='Fraction of Delayed Flights in a Simulated Year')


# We saw in the last chapter that the standard error of this sampling distribution is given by
#   σ^p = √p(1−p) / N.

# For the flights case we have N=5000 and p≈0.3898 this gives:
sqrt(0.3898*(1-0.3898)/5000)

# From our simulations we can estimate the standard error as the standard deviation from our simulated experiments:
sd(many.studies.delayed)

# We can see that our simulation results agree closely with the theoretical prediction for the standard error σ^p.
# Now we can find the 95% confidence interval using the quantile command again:
quantile(many.studies.delayed, c(0.025,0.975))

# Here are the two commands for bootstrapping the 95% confidence interval for ^p together:
many.studies.delayed <- replicate(10000, sum(sample(flightNYC$is.delayed, 5000, replace=TRUE)=="Delayed")/5000)
quantile(many.studies.delayed, c(0.025,0.975))

# So we could conclude that the true proportion delayed flights out of NYC is highly likely to be in the interval (0.37, 0.40).

# We could also estimate the 95% confidence interval using the command prop.test in R.
# This is similar in nature to the t.test command we say earlier for estimating the population mean.
# The main difference is that we have to do a little bit of processing before we give the information to the prop.test command.
delayed.table <- table(flightNYC$is.delayed)
print(delayed.table)

# We can hand this table directly over to the prop.test command.
prop.test(delayed.table)

# Just like the t.test command this gives us a bunch of information that we don’t really need right now.
# Notice the answer is almost exactly what we found using the bootstrapping approach.
# If we want a different confidence interval we just have to change the conf.level option to prop.test:
prop.test(delayed.table, conf.level = 0.99)

# This gives the 99% confidence interval.


#** 10.5.0.1 Conditions for using prop.test for CI ----
# For our confidence interval for a population proportion to be valid the following must be true:
#   To use the prop.test command we should have at least 5 successes AND 5 failures in our data set.
#   All trials should be independent and identically distributed in our data set.

# Otherwise the confidence interval formed will be unreliable.

# For the flight example this means we need to have at least five delayed flights and at least five not delayed flights.
# Moreover, we are assuming that the flights were collected randomly with no biases in terms of the likelihood of recording either outcome.


#** 10.5.0.2 Additional Examples of Proportion Tests ----
# 1.
#   Suppose we conducted a survey to see what proportion of the population supports a candidate in the upcoming election.
#   If we asked 300 people and 76 supported the candidate then form a 95% confidence interval for the fraction of the population who supports the candidate.

# This doesn’t require any real processing before we hand it over to prop.test, because we are given the number of successes (76 here) and the total number of measurements (300).
# We also are good to use the prop.test command because we have at least 5 successes (76) and at least five failures (300-76>5).
prop.test(76,300)  # format is the number of successes and the number of trials


# 2.
#   If the San Antonio Spurs have played 41 games and won 35 of them.
#   Find a 99% confidence interval for their winning percentage.
# Successes:35 and Total Attempts: 41
# We have at least 5 successes (35) and at least 5 failures (6).
prop.test(35,41, conf.level=0.99)


#_---- 


#* 10.6 Extra Practice Problems ------------------------------------------
# Sometimes we are not provided with the entire data set but we still want to be able to form a confidence interval for the mean value.
# Suppose for example that we want to form a confidence interval for the mean concentration of a chemical in our water supply.
# From a government website we find some data telling us that in a sample of 74 glasses of water they found an mean of 0.6 moles of this chemical and a standard deviation of s=0.056.
# We could use our large sample confidence interval formula to form this using the CLT and the empirical rule.
#   x ± 2s/√N   95\% Confidence interval
#  ¯x ± 3s/√N   99\% Confidence interval

# However, for smaller samples this doesn’t take into account the variation induced by using the data to estimate both the mean and standard deviation. This is where we want to use the student t distribution.
# The below command forms a confidence interval for the population mean using just the sample mean, sample standard deviation and the number of samples taken.
t.test.hand(0.6, 0.056, 74, conf.level = 0.99)


#_---- 


#* 10.7 Homework ---------------------------------------------------------
#   File - Chapter 10.R


# ____----


# Chapter 11 Introduction to Linear Regression ----------------------------
#* 11.1 Statistical Models -----------------------------------------------
# We are now ready to start studying relationship between variables (columns) in our data.
# To begin our study of this vast topic we will consider the NYC flight data again. 
# First lets read this data into R.
data("flightNYC")
colnames(flightNYC)

# Lets begin is a simple example by considering the relationship between the distance (flight distance in miles) and the air_time (flight time in minutes).
# From high school physics we know these should linearly related in theory, and this is easy enough to examine by making a scatter plot of these two variables:
plot(flightNYC$distance, flightNYC$air_time / 60.0,
     xlab = 'Flight Distance in Miles', ylab = 'Flight Time in Hours', main = 'Flight Distance versus time',
     col = 'blue', cex = 0.5)

# This plot shows the expected trend that longer distance flights generally take longer to complete, and intuitively in describing this trend we might draw a line through this cloud of points. 
# However, notice that we have some significant variation in the flying times which are going about the same distance. 
# This may have to do with many possible factors (weather, aircraft type, seasonal effects, airport approach requirements, etc).

# Also notice that we the vast majority of the flights are less than 3000 miles and we have a large gap in out data set for flights between 3000-5000 miles. 
# Since we don’t have any data in this interval it is best that we remove the very long flights from the data and focus on the less than 3000 mile flights.
flightNYC <- subset(flightNYC, flightNYC$distance <= 3000)

# This leads to the following set of questions we would like to answer about this data set:
#   1. How can we tell is this effect is real or just us seeing trends in random data?
#     (This is obvious in this case…..but not always the case!)
#   2. If the effect is real, and how can we measure the strength of this effect?
#   3. How much information does knowledge of the distance give us about the flying time?
#   4. Given the flight distance can we we make an accurate prediction for the flight time?
  
# To answer these questions we need to build a statistical model for the flying time based on the distance. 
# A simple model for the effect of distance on flight time is a linear model:
#   Tflight = βD + α + ϵi

# This is called a linear model because it takes the form of y=mx+b. 
# In this case α is the y-intercept and β is the slope of the line. 
# The ϵi is an assumed noise term which allows for random errors in the measurements. 
# We assume these errors have a normal distribution with mean zero and standard deviation σr. 
# For our flight model we call Tflight the response variable (y axis) and D is the called the explanatory variable (x axis).

# To specify the model we will need to find the slope β and y-intercept α.


#*** Exercise 11.1 ----
#   File - Chapter 11.R


#*** Exercise 11.2 ----
#   File - Chapter 11.R 


#*** Exercise 11.3 ----
#   File - Chapter 11.R 


#* Note ----
# When we interpret a linear model of the form y = βx + α,
#   α is the value the y variable takes when x is zero, 
#   β gives the amount that y will increase(decrease) when x increases by one. 


#_---- 


#* 11.2 Fitting a Linear Model in R --------------------------------------
# It turns out that a very way to choose the best α and β is to minimize the sum of square distance between the data points and the model predictions. 
# Suppose, we have a model with N data points (x1,y1),(x2,y2),...(xN,yN), then we can measure the Cost of the model for one data point yj by finding the distance (squared) between this data point and the predicted value ^yj(xj)=α+βxj. 
# Summing up all these errors or residuals gives us a measure of how well the model describes the data. 
#   Cost(α,β) = N∑[j=1]r^2[j] = N∑[j=1] [y[j] − (α + βx[j])]^2

# The below plot shows the residuals as green arrows for a guess of α=10, β=1.5 for the flight model. 
# The total cost is also printed below for this parameter choice. 
# Note, I reduced the number of data points (circles) in this plot just for the purpose of being able to see the green arrows (residual) values more clearly.

# Now I want to show you how to use R to fit a linear model and view the results. 
# Here is the command to build a linear model for our flying data and view a summary of the results.
res.flying <- lm(air_time ~ distance, data = flightNYC) ##notice the format y~x response~explanatory
summary(res.flying)

# We will learn what all this output (stats poop) means later. 
# Let’s see what our residual plot looks like for these optimal values:

# Notice that the cost (sum of all the residuals squared has decreased by quite a bit from our initial guess). 
# This is the best (optimal) values of α and β we could possibly choose. 
# Any other choice of α,β would give a larger cost value. 
# Now we can look at the the estimates for the α and β parameters that R finds:
res.flying$coefficients

# The β slope parameter is what is most important for our flying model. 
# The best point estimate for β is ≈0.126. 
# In the context of the model this means that for every 1 mile increase in distance we should expect the flying time to increase by about 0.12 minutes. 
# We can see how well the value of β is determined by the data by finding the confidence interval for β:
confint(res.flying, level = 0.99)

# We can also make a plot of the line that R fit to our flying data. 
# We can see that the line captures some of the big picture trends in the data.
plot(flightNYC$distance, flightNYC$air_time,
     main = 'Flying Distance versus Time Linear Model', xlab = 'Distance (Miles)', ylab = 'Time (Minutes)',
     col = 'red', cex = 0.3)
abline(res.flying, col = 'blue')

# The α term (y-intercept) here tells us that flights which go no distance at all (0 miles) should be expected to take somewhere between 17-19 minutes. 
# This is a bit more difficult to interpret as presumably nobody is booking flights which take off and go nowhere. # However, we could regard this value as a measurement of the inevitable inefficiency of airports where planes must take turns to take-off and land and can only approach from particular directions. 
# This effect generally adds something like twenty minutes to flights out of NYC.


#** 11.2.0.1 House Sales Price vs Square Footage ----
# Lets consider a more interesting problem. In this section we will use linear regression to understand the relationship between the sales price of a house and the square footage of that house. 
# Intuitively, we expect these two variables to be related, as bigger houses typically sell for more money. 
# The data set comes from Ames, Iowa house sales from 2006-2010. 
# First, lets read this data in and make a scatter plot of the sales price versus the square footage.
data("AmesHousing_Regression") # from HannayAppliedStats package
house <- AmesHousing_Regression # rename this data
house <- dropLowFactors(house, factor.column = 3, threshold = 30) # from HannayApplied Stats drop all neighborhoods with less than 30 data points
head(house)

# We can see this has the log10 of the selling price, the square footage and the number of bathrooms in the house.
plot(house$Square.Feet, house$SalePrice,
     main = 'Real Estate Prices in Ames Iowa (Color by Neighborhood)', xlab = 'Square Footage (log10)', ylab = 'Sale Price ($) log10',
     col = house$Neighborhood, cex = 0.5)

# As expected we can see from the plot that square footage is somewhat important in determining the sales price of the house, but we can see that their is significant variation in the sales price for any given sqft size. 
# Let’s try and build a linear model for the relationship between the sqft of the houses and the sales price.
res.house <- lm(SalePrice.log10 ~ Square.Feet.log10, data = house)
summary(res.house)

# Lets look to see if the slope we found is significant (relative to a slope of zero):
confint(res.house, level = 0.99)

# We can say that the slope is significantly greater than zero with a significance level α=0.01 since this 99% confidence interval doesn’t include zero. 
# Finally, lets plot our regression line on the scatter plot:
plot(house$Square.Feet, house$SalePrice,
     main = 'Real Estate Prices in Ames Iowa (Color by Neighborhood)', xlab = 'Square Footage (log10)', ylab = 'Sale Price ($) log10',
     col = house$Neighborhood, cex = 0.5)
abline(res.house$coefficients)

# Note, since we are dealing with the logarithms of the price and square footage here we these results tell us to expect a 1% increase in the square footage of the house to increase the Sales price by about 1% as well. 
# In terms of the non logarithm transformed variables our model looks like 
#   Price = α[0] * (Sqft)^β.

# By taking the logarithm of both sides of this we get a linear equation 
# log(Price)=log(α0)+βlog(Sqft)
plot(10^house$Square.Feet, 10^house$SalePrice,
     main = 'Real Estate Prices in Ames Iowa (Color by Neighborhood)', xlab = 'Square Footage', ylab = 'Sale Price ($)',
     col = house$Neighborhood, cex = 0.5)
x <- seq(0, 5000, 1)
alpha0 <- 10^2.35
y <- alpha0 * x^0.90
lines(x, y, type = 'l')


#*** Exercise 11.4 ----
#   File - Chapter 11.R 


#_---- 


#* 11.3 Assumptions of Linear Regression ---------------------------------
# Recall the form of our statistical model for linear regression is:
#   y[j] = β[1]x[j] + α[0] + ϵ[j]
# 1. Linearity:
#   The most important assumption of linear regression is that the response variable y is linearly dependent on the explanatory variable.
#   This assumption forms the bedrock for the rest of our analysis, so when it is violated the entire model is invalid.
#   The good news is that many relationships in nature are at least approximately linear.
#   We can examine this assumption by looking at a scatter plot of the two variables, and by examining the residual plot.
# 2. Independence of Errors:
#   We assume that the errors added to our model (the ϵj terms) are all independent.
# 3. Equal Variance of Errors:
#   We assume the standard deviation of the errors is the same for all values of the explanatory variable xj. 
#   Without this assumption we would need to perform what is called a weighted least squares on our data- which generally requires more data than a normal linear regression. 
#   This won’t be covered in the class. The residual plot will reveal if this assumption is at least approximately valid.
# 4. Normality of Errors: 
#   The least important assumption is that the errors are normally distributed. 
#   If this is violated it doesn’t have a effect on the best fit parameters, only in the estimation of the confidence intervals for those parameters. 
#   We can verify this assumption by making a QQ plot of the residuals.


#** 11.3.1 Successful Linear Regression ----
# In this notebook we will examine some metrics to test for how well our linear regression has performed for a set of data.

# To begin we make some fake data which fits the assumptions for linear regression analysis:
beta0 <- 2.0;
beta1 <- 1.0;
x <- seq(0,10,0.05);
y <- beta0 + beta1*x + rnorm(length(x), 0.0, 1.0); ## random, independent normally distributed noise
plot(x,y)

# We may know run a linear regression in R using the lm command,
lm.results <- lm(y~x);

# we store the results of the linear regression in the lm.results object.
# If we want a quick summary of the results we can use the summary command:
summary(lm.results)

# We may get confidence intervals on the parameters by running:
confint(lm.results, level=0.95)

# The following command is part of my package (HannayIntroStats) and makes a few plots automatically which are useful in determining whether linear regression is working on a data set.
diagRegressionPlots(lm.results)

# As expected since we created this fake data so that it satisfies each of the assumptions of regression it passes each of our tests. 
# Starting with the histogram and QQ plot of the residuals. 
# We can see from these two plots that the errors are approximately normally distributed (mound shaped histogram, and QQ plot roughly along the line).

# The top right plot shows the residual values as a function of the explanatory variable. 
# We will see this plot will help us check for equal variance in the errors. 
# In this case the width of the residuals is approximately the same as the x variable increases. 
# This indicates the variance in the noise terms is constant. 
# This plot also shows a flat tube of points centered around zero. 
# If this is not the case then this indicates the first assumption (linearity) is violated.

# The bottom right plot shows the data plotted against the regression line model.


#** 11.3.2 What Failure Looks Like ----
# Now we will see what it looks like when the assumptions of linear regression are violated, and how we can tell from our diagnostic plots. 
# These topics are roughly in the order of how serious these errors are.


#*** 11.3.2.1 Not a Linear Relationship between Variables ----
# The most serious error occurs when we attempt to fit a linear regression line to data which clearly does not show a linear pattern. 
# Many times this can be avoided by making a scatter plot of the data before you attempt to fit a regression line. # example,
#   in the below plot we can see that their clearly is a nonlinear relationship between the variables x and y.
y <- beta0 + beta1*sin(x) + rnorm(length(x), 0.0, 1.0);
plot(x, y)

# Let’s assume we ignores this and fit a linear model anyway.
lm.fail.notlinear <- lm(y~x)
summary(lm.fail.notlinear)

# Now we can make some diagnostic plots for linear regression.
diagRegressionPlots(lm.fail.notlinear)

# Notice that the residual plot in the top right shows a clear pattern. 
# This is a sign that the relationship between the variables is nonlinear, and a linear model is not appropriate.


#*** 11.3.2.2 Errors are not independent ----
# The next most important assumption for linear regression models is that the errors are independent. 
# If this isn’t the case then the errors can give false trends when we fit the model.
noise <- generateCorrelatedErrors(n=length(x), lag=5, sigma=2.0)
y <- beta0 + beta1*x + noise
plot(x, y)

# Lets make the linear model as usual.
lm.fail.notind <- lm(y~x)
summary(lm.fail.notind)

# Now we can make some diagnostic plots for linear regression.
diagRegressionPlots(lm.fail.notind)

# Notice that the residual plot has a weird shape/pattern to it. 
# This is because the noise terms are not independent! 
# These not independent random effects invalidate our linear model in this case. 
# Typically, we can look for non-independence by looking for any non-random effects on the residual plot.


#*** 11.3.2.3 Unequal Variance in Residuals ----
# The next assumption of linear regression analysis is that the variance (or standard deviation) of the error terms is constant across all values of the explanatory variable. 
# This is easily checked by looking at the residual plot. 
# If the variance is not constant then the residual plot rectangle will change widths as the explanatory (x) variable changes.
noise <- rnorm(length(x), sd=0.1)*(1.0+x)
y <- beta0 + beta1*x + noise
lm.fail.var <- lm(y~x)
diagRegressionPlots(lm.fail.var)

# In the above plot the residuals variance increases with x. 
# This issue is correctable if we use weighted least squares analysis.


#*** 11.3.2.4 Non-Normality in Noise ----
# This is not a huge concern for most linear regression models as they are not very sensitive to this assumption. 
# However, our error terms need to be roughly mound shaped and continuous in nature to apply linear regression. 
# If these are violated severely it will appear in the QQ plot and histogram of the residuals.

# For the example below I use a error (noise) term which follows a t distribution with two degrees of freedom (this has heavier tails then the normal distribution). 
# Since our assumed regression model has less density in the tails our model will underestimate the chances of having large deviations from the curve.
noise <- rt(length(x), 2) #rbimodalNormal(length(x),sigma1=0.25, sigma2=0.25)
y <- beta0 + beta1*x + noise
lm.fail.normal <- lm(y~x)
diagRegressionPlots(lm.fail.normal, cex=0.5)


#*** Exercise 11.5 ----
#   File - Chapter 11.R 


#*** Exercise 11.6 ----
#   File - Chapter 11.R


#_---- 


#* 11.4 Goodness of Fit --------------------------------------------------
# The last topic we will discuss for linear regression are some measures of the goodness of fits for our models. 
# These measurements are focused on how well the model performs in predicting the response variable in terms of the explanatory variable.


#** 11.4.1 Correlation and Slope ----
# You may have heard the term correlation used before. 
# I have focused mainly on the slope of a regression model β for measuring the strength of a linear relationship between two continious variables. 
# However, the correlation coefficient is also a meaure for this. 
# In fact the two of them are explicity related: 
#   β = ρ*σ[Y]/σ[X]     ⟹     ρ = β*σ[X]/σ[Y]
#   ρ = Pearson's correlation coefficient
#   σ[Y] = Standard deviation of the response variable
#   σ[Y] = Standard deviation of the explanatory variable
# Notice that if we have σX=σY then ρ=β. 
# An easy way to get σ[X] = σ[Y] is to scale both the explanatory and response variables. 
# Recall that the scale command in R subtracts the mean of a column from the values and divides by the standard deviation. 
# The end result is a value which has mean zero and standard deviation equal to one σ[x] = σ[y] = 1.
at2 <- scale(flightNYC$air_time)
dist2 <- scale(flightNYC$distance)
#Fit a linear model and show only the computed slope
lm(at2~dist2)$coefficients[2]

# We can find the correlation between two variables using the corr command in R.
cor(flightNYC$air_time, flightNYC$distance)

# The correlation coefficient will always have the property that −1≤ρ≤1. 
# Values near 1 indicate a strong positive linear relationship, and values near -1 indicate a strong negative relationship.

# The correlation coefficient is especially useful when trying to compare the strength of a linear relationship between regression models. 
# Suppose we have formed two models y=βx1+α and y=βx2+α and we want to know which of these exhibits a stronger linear relationship. 
# Comparing the slopes directly isn’t a good idea as the two explanatory variables x1 and x2 may have different units. 
# Looking at the correlation coefficients removes the units and allows for a direct comparison.


#** 11.4.2 R2 Coefficient of Determination and Measuring Model Fits ----
# The residual standard error is given by 
#   σ = √∑[N i=1] * r**2[i] / (N−k)
#   where
#     N is the number of data points and
#     k the number of parameters estimated.
# This quantity gives us an idea about the raw accuracy of the regression model in its predictions. 
# In other words the residual standard deviation is a measure of the distance each observation falls from its prediction in the model.

# We can also describe the fit of a model using the R2 value, which gives the fraction of the response variance explained by the statistical model. 
# The unexplained variance is the variance of the residuals σ**2[R], and let σ**2[Y] be the variance of the response variable data, then 
#   R**2 = 1 − σ**2[R] / σ**2[Y] = ρ**2.

# This quantity is just the correlation coefficient ρ squared.

# If the model tells us nothing about the relationship we expect to find R2=0 meaning none of the variation in the response variable is explained by the model. 
# On the other hand if the y values lie perfectly along a line we would have ^σ=0 which gives R2=1. 
# In general the values of R2 will lie somewhere between zero and one.

# One final note about the goodness of fit measures. 
# They are often incorrectly used as a total measure of the utility of a model. 
# While it is true that a linear model with a small R2 value cannot precisely predict the response variable, these models can still tell us important things about our data (and life in general). 
# As an example lets consider some (fake) data on the life expectancy of people given how many pounds of bacon they have consumed.
head("bacon_data")
plot(bacon_data$bacon.lbs, bacon_data$life.expectancy)
lm.bacon <- lm(life.expectancy ~ bacon.lbs, data=bacon_data)
summary(lm.bacon)

confint(lm.bacon)

plot(bacon_data$bacon.lbs, bacon_data$life.expectancy)
abline(lm.bacon, col='blue')

# In this analysis of the effect of eating bacon is on life expectancy, we don’t expect for the amount of bacon to completely explain why one person lives longer than others. 
# Therefore, we expect the bacon consumption will have a low R2 value. 
# Indeed we can see above that it does have a low value. 
# However, we also find that for every pound of bacon we eat we expect to lose between 51 days and 21 days of life. 
# According to our fake data bacon doesn’t predict how long you are going to live, but it does have important effects on your life expectancy.

# The lesson here is that we use linear regression to understand complex phenomena we should not expect to have high R2 values (no free lunches). 
# This doesn’t always mean those models are useless– it depends on what you are trying to learn by forming the model!


#_---- 


#* 11.5 Using Regression Models to Make Predictions ----------------------
# In many cases you do want to use linear regression on a data set to forecast the response variable (y) given a value for the explanatory variable (x). 
# In the most basic sense we can do this by just plugging the new x variable into our best-fit regression model. 
# example, 
#   let’s think out the flight data set again and say we want to predict the flight time for a flight which will travel 1400 miles. 
#   Well our best fit values for the intercept and slope are:
res.flying$coefficients


# Therefore, we can plug in our x value to the linear model: 
# T = βD + α = 0.1264∗(1400) + 18.19
# which gives an estimate of 195.15 minutes of flying time.

# However, we can do better than just providing a single best estimate for the flying time. 
# Our statistical model can also give a prediction interval which is likely to contain the true flying time. 
# This involves factoring in the size of the error terms ϵi in our regression model 
#   y[i] = βx[i] + α + ϵ[i].

# Of course we have assumed that the ϵi terms are normally distributed with a mean 0 and a constant standard deviation σϵ.

# Therefore, a good start is to form the 95% prediction interval using the empirical rule 
#   (βx[new] + α − 2σ[ϵ],βx[new] + α + 2σ[ϵ]) ≈ 0.95.

# However, this is slightly more complicated by the fact that we have some uncertainty in both the slope and y-intercept parameters (β,α) in addition to our imperfect knowledge of σϵ. 
# For one this means we should be using a t distribution instead of the empirical rule if we want to be precise: 
#   (βx[new] + α − t(0.025,N−2)se(y[new]),βx[new] + α + t(0.025,N−2)se(y[new])) ≈ 0.95.

# The standard error of ynew is given by the rather complicated formula: 
#   y[new] = se * √1 + 1/N + (x[new] − ¯x)**2 / (N−1)s**2[x]
#   where 
#     N is the sample size, 
#     ¯x is the mean of the x variable, 
#     sx is the standard deviation of the x variable and 
#     se is the standard error of the residuals.

# Thankfully, we should not ever have to compute this by hand (or remember this formula). 
# However, notice that se(ynew)≈se when xnew≈¯x and otherwise the size of the prediction interval will grow. 
# This tells us we can make the most accurate predictions for x near the average value of x in the data set. 
# Also, notice that se(ynew)≈se for very large data sets N→∞. 
# In these cases we can use the simplified rule of thumb for prediction intervals: 
#   Rule of Thumb: ynew ± 2se

# We can find se (the standard error for the residuals) for our model using the command:
sd(res.flying$residuals)

# or by finding the correct line in the summary:
summary(res.flying)

# Therefore for our flying case we can estimate our prediction interval for the flying time for a 1400 mile trip as 195.15±2∗12.86=(169.43, 220.87).

# If we require more accuracy (want to use the more complicated formula) then we can use the software to form the prediction interval. 
# In R we can find the prediction interval with the following command:
predict(res.flying,data.frame(distance=1400), interval='predict', level = 0.95)

# Notice this is almost exactly the same interval that our rule of thumb produced. 
# If we want to form prediction intervals for a range of x values we can do this as well. 
# The below code forms the prediction intervals and plots them alongside the data.

##How to make prediction intervals for flight times
values.predict = seq(100,3000,10) ##make a sequence of value to predict
predict.flying = predict(res.flying, data.frame(distance=seq(100,3000,10)), interval='predict', level = 0.95);
plot(flightNYC$distance, flightNYC$air_time, 
     main='Flying Distance versus Time Linear Model', xlab='Distance (Miles)', ylab='Time (Minutes)', 
     col='blue', cex=0.3)
lines(values.predict, predict.flying[, "lwr"], col='black')
lines(values.predict, predict.flying[, "upr"], col='black')


#*** 11.5.0.1 Some Warnings about Prediction Intervals ----
# Some caution is advised when forming prediction intervals for regression models. 
# Here are some warnings:
#   - Prediction intervals are very sensitive to the assumptions of linear regression being strictly satisfied. 
#     example, 
#       the residuals really need to have a normal distribution for our intervals to form accurate intervals.
#   - Be careful using prediction intervals for value of the x values which are outside the range of observed values. 
#     Just because the assumptions of linear regression are satisfied for the data shown doesn’t mean they will be outside the range shown.


#_---- 


#* 11.6 Homework ---------------------------------------------------------
#** 11.6.0.1 Concept Questions: ----
#   File - Chapter 11.R


# ____----


# Chapter 12 Regression with Categorical Variables ------------------------
#* 12.1 Introduction -----------------------------------------------------
# Thus far in our study of statistical models we have been confined to building models between numeric (continuous) variables. 
#   y[i] = β*x[i] + α + ϵ[i].
# However, we don’t actually need to restrict our regression models to just numeric explanatory variables. 
# To extend our models to include categorical explanatory we will use a trick called one-hot-encoding of our categorical variables.


#_---- 


#* 12.2 One Hot Encoding -------------------------------------------------
# Let’s consider the food_college data set contained in the class R Package.
data("food_college")

# This data set contains 125 survey responses from college students on their food choices. 
# For now we will focus on two columns the weight column gives us the self reported weight of each student (or at least the 120 students who answered that question) and the Gender column which is categorical with levels (Female and Male).

# Suppose we want to look for a difference in the average weight of the students based on the gender variable. 
# We are thus looking for a relationship between a continuous and categorical variable. 
# Therefore, we should make a boxplot to look for this relationship graphically:
boxplot(food_college$weight~food_college$Gender, col="skyblue", 
        main='Weight of College Students', xlab="Gender", ylab="Weight (lbs)")

# Based on this boxplot it looks like (as we might expect) the average weight of Males is greater than the average weight of Females. 
# However, as usual we want to consider the possibility that random chance could have generated the effects we see. 
# Let’s see how many samples we have in each of the categories:
table(food_college$Gender)

# Looks we have a healthy sample size in each category. 
# As you might have gathered from the title of this chapter we can adapt our regression techniques to study this data set. 
# We want to build a model of the form: 
#   y[i] = β*x[i] + α
# but we can’t use the names “Female” and “Male” as our x variable directly as β∗Female + α doesn’t make sense!
  
# The trick here (called one hot encoding) is to recode our categorical variables with N levels into N−1 indicator variables δ[L i] which give the value 1 if observation i is in category L and zero otherwise. 
# Thus we could write our regression as:
#   weight[i] = β1*δ[Female i] + β2*δ[Male i] + α

# However, we will see that we only really need 1 (or generally N-1) indicator variable for our system. 
# After all in our data set if you are NOT male then you must be female. 
# Thus we can simplify our model to:
#   weight[i] = β*δ[Male i] + α

# This model will give the value α if the subject is female and β(1) + α = β + α if the subject is male. 
# Thus, 
#   α will be the mean weight of the 0 category (Females here) and 
#   β will be the "difference in weights between the two categories".

# R will perform this encoding of categorical variables for you automatically as long as it knows that the variable being put into the regression should be treated as a factor (categorical variable). 
# You can check whether R is treating a variable as a factor (categorical) using the class command:
class(food_college$Gender)

# Since this variable is already stored as a factor type R will take care of the encoding for us automatically. 
# Let’s go ahead and fit our simple model now:
lm(weight ~ Gender, data = food_college)

# Just as with simple regression we can take a look at the summary of the linear model.
lm.weight = lm(weight ~ Gender, data = food_college)
summary(lm.weight)

# More importantly, we can compute the confidence intervals for the slope and intercepts. 
# Remember that the intercept gives an estimate for the mean weight of females in our data set and the slope gives the difference in weights between the males and females (on average).
confint(lm.weight, level = 0.99)


# Based on this conference interval we can see that the slope parameter is somewhere between 20.72 and 47.3 pounds. 
# Therefore, we expect that if we repeated this sample we would still find that Males out weight females (on average) by somewhere between these values. 
# Generally, a slope confidence interval which contains zero means that if we repeated the experiment we might find the reverse trend as presented in our boxplot.

#   Later in this class we will see that performing a regression of this type (continious variable compared across two categories) is equivalent to performing a statistical hypothesis test called a t test under the assumption that the variance of both groups is equal. 


#*** Exercise 12.1 ----
#   File - Chapter 12.R 


#** 12.2.1 Example: Exercise and Weight ----
# Now lets consider the effect of (self-reported) exercise on weight in college students. 
# xercise information is stored in the exercise column of the food_college data set. 
# It is a categorical variable with five levels. 
# The students were asked the question: how often do you exercise in a regular week?
#   + 1: Everyday 
#   + 2: Twice or three times per week 
#   + 3: Once a week 
#   + 4: Sometimes 
#   + 5: Never

# Let’s take a look at how many observations we have our each level of this variable.
table(food_college$exercise)

# Here is a boxplot of this data:
boxplot(food_college$weight ~ food_college$exercise, 
        main = "Exercise and Weight", ylab = "Weight (lbs)", xlab = 'Exercise', col = 'cyan')

# Also, the below code discovers that we have sum(is.na(food_college$exercise)) who did not answer this question. 
# They will need to be removed from consideration.
sum(is.na(food_college$exercise))

# Create a new data set with missing entries removed
f2 = food_college %>% select(exercise, weight, Gender, GPA) %>% na.omit()

# Notice that only the first three options were reported on in this data set (nobody answer with the 4 or 5 options in the survey). 
# To build our regression model we want something of the form: 
#   weight[i] = β1*δ[E2 i] + β2*δ[E1 i] + α

# The works out daily (exercise==1) describes everyone that doesn’t workout 2-3 times or once a week and is therefore included in the α term.

# To make sure that R treats the exercise variable as a categorical one in our regression model we should check what R thinks this variable is:
class(f2$exercise)

# Notice R thinks this is a discrete numeric variable (incorrectly). 
# Therefore we should correct this before performing a regression. 
# This can be done with the as.factor function.
f2$exercise = as.factor(f2$exercise)

# Now we can proceed with the regression analysis in R.
lm.exercise = lm(weight ~ exercise, data = f2)
summary(lm.exercise)
confint(lm.exercise)

# This confidence interval shows us that we can’t conclude we have any difference in the average weight of these three categories as the confidence intervals contain both positive and negative values. 
# It also gives us a confidence interval for the average weight of those in category 1 (exercise everyday), as this is the intercept.

#   Later we will see that a comparison between a continious response variable and a categorical response variable with more than two levels is called an ANOVA analysis (one-way). 
#   ANOVA is an acronym for ANalysis Of VAriance. 
#   This is a very common statistical technique used in science and business applications. 
#   For us this is just a special type of regression. 


#*** Exercise 12.2 ----
#   File - Chapter 12.R 


#** 12.2.2 Housing Prices by Neighborhood ----
# As another example, let’s consider the Ames housing data set again. 
# We will build a regression model for the Sales Price (log10) as iot depends on the Neighborhood.

# We can begin by building a boxplot of this.
data("AmesHousing_Regression")
boxplot(AmesHousing_Regression$SalePrice.log10 ~ AmesHousing_Regression$Neighborhood, 
        main='Sales Price for Different Neighborhoods', cex=0.5, las=2, col='skyblue', ylab='Sales Price log10', xlab='')

# Based on this plot we might ask if we have sufficient evidence to conclude that the neighborhood effects the sales price of houses?

# We can write this as a multiple linear regression model, like-so:
lm.houseNeig = lm(SalePrice.log10 ~ Neighborhood, data = AmesHousing_Regression)
summary(lm.houseNeig)

# Let’s take a look at the 95% confidence intervals for the coefficients. 
# Those Neighborhoods whose CI are all negative we have considerable evidence that they tend to be priced lower than the reference neighborhood (Blmngtn). 
# Those will all positive values tend to be priced higher on average.
confint(lm.houseNeig)

# Later in the course we will learn about statistical hypothesis testing, then we can look at the last line last-line for the F-statistics. 
# This tells us if we have sufficient evidence that the mean sales price differs based on the neighborhood (as that is our only explanatory variable now). 
# The small p-value here tells us to reject this null hypothesis here. 
# Apparently, the real-estate agents are correct the location does matter.


#** 12.2.3 Advanced: Exercise and Gender Together ----
# In our above example we had an obvious confounding variable (gender). 
# We have already shown that the gender of the participants matters quite a bit in determining their weights. 
# Lets see how many males and females we have for each of the three exercise categories.
table(f2$exercise, f2$Gender)

# Looking at this table we can see that the dip in the mean weight for exercise group 2 might not be caused by any real effect of exercise but just the fact that this group has a larger percentage of female participants (who tend to weight less).

# In studying the effect of exercise frequency on the weight of our participants we should also account for the natural weight differences between genders.

# We can account for this by adding the two models we have developed together.
#   W[i] = β1*δ[Male i] + β2*δ[E2 i] + β3*δ[E3 i] + α
# Notice that α will now be the average weight of a female who exercises daily (exercise category 1). 
# The β1 term will show the effects of gender on weight without accounting for exercise. 
# The exercise coefficients give the shifts in the mean weights caused by exercise at that frequency (relative to the weight of a female who exercises daily).

# Before you run more complicated models like this one it is generally a good idea to think about what you expect to see in the results. 
# Here I am assuming that exercise more frequently will reduce weight. 
# For this model I would expect to see that β1≈30 because that is the difference in the mean weights between the genders. 
# If exercising more frequently has a strong effect on weights we would expect that β2,β3 are positive. 
# Moreover, if the frequency matters quite a bit then β3>β2.

# Now that we have designed our model we are ready to create it. 
# This is pretty fast and easy in R.
lm.control = lm(weight ~ Gender + exercise, data = f2)
summary(lm.control)

# From this we can see the best fit parameters follow our expectations in that β3>0 and β3>β2. 
# However, we still see that β2<0. 
# Moreover, we really shouldn’t look to closely at these best fit values as they are certain to change if we recollect our data.

# Looking at the confidence intervals we can see that we can’t conclude much about exercise frequency based on this data set.
confint(lm.control)

# Both of our confidence intervals for exercise contain zero. 
# This means that we don’t have enough data to see a consistent effect OR perhaps no consistent effect exists. 
# Also, notice these confidence intervals are pretty wide, especially for the exercise3=β3 parameter. 
# This is because we only have a very small sample in this category (6 females and 4 males).

# Notice, as we include more factors in our models we will steadily reduce the samples we have in each category. 
# This will in turn lead to larger standard errors and confidence intervals for the parameters. 
# It might seem like a good idea to include many components in our models but you need to exercise some prudence in doing so. 
# Including too many components will whittle our data set into small chunks which won’t be large enough for us to distinguish much from the data.

#   This type of analysis with two categorical explanatory variables is also a type of ANOVA. 
#   This time it is called a two-way ANOVA. 
#   Once again we see it is just a special case of regression. 


#*** Exercise 12.2 ----
#   File - Chapter 12.R 


#_---- 


#* 12.3 Diagnostics ------------------------------------------------------
# When we use form regression models where the explanatory variables are categorical the same core assumptions 
# (Linearity, Independence of Errors, Equal Variance of Errors and Normality of Errors) 
# are being used to form the model. 
#   y[j] = [L−1∑i=1]β[i]*δ[ij] + α + ϵ[j]

# We can still evaluate these by looking at histograms, qqplots of the residuals (Normality of the Residuals) and the residuals plotted as a function of the explanatory variable (Residual plot). 
# In the residual plot (which should now be a box plot instead of a scatter plot) we should see no obvious trends as well as roughly equal variance (spreads) as a function of the explanatory variable.

# The required plots should still be formed by using the diagRegressionPlots command in my R package. 
# Test this out for yourself and see how you might expect violations of the conditions to manifest in the diagnostic plots.

# However, note the bottom right plot is no longer useful for categorical explanatory variables. 
# Below I show the diagnostic plots for the exercise versus weight regression we performed above.
diagRegressionPlots(lm.exercise)

#   The bottom right plot in oour regression diagnostics is not useful for categorical explanatory variables. 


#_---- 


#* 12.4 Homework ---------------------------------------------------------
#   File - Chapter 12.R 


# ____----


# Chapter 13 Multiple Regression Models -----------------------------------
#* 13.1 Introduction to Multiple Regression Models -----------------------
# We have learned about simple linear regression where we have a single explanatory and response variable, which we assume are related in a linear manner. 
# This gives us a model of the form: 
#   y = α + β*x + ϵ[i]
#   where 
#     y is our response variable, 
#     x is the explanatory variable. 
# The parameters (α,β) the y-intercept and slope respectively are fit to the data to minimize the least-square error. 
# Finally, the term ϵi is the random noise which is assumed to be Gaussian (Normal) distributed with equal variance.

# However, in analyzing data we are often interested in building a model for a system where more than one input of explanatory variable may be important. 
# example, 
#   when building a model to predict the value of a stock-price we would want to include several economics indicators (market measures, GDP, etc). 
# To build a model of the size of the freshman class at Schreiner we would want to include many factors such as the number of high school graduates in the area, economic health of Texas, etc.

# Models with more than one explanatory variable are called multiple regression models. 
# They take the general form: 
#   y = α + β1*x1 + β2*x2 + ... + βn*xn + ϵ[i]

# Often the most important decision to make when building a multiple regression model is deciding what explanatory variables (x1,x2,...xn) to include in the model. 
# It is sometimes tempting to just include everything that you feel might be relevant. 
# However, this will lead to very complex models which are difficult to interpret, and can lead to exceptionally poor models due to the dangerous condition called over-fitting. 
# A model which has been over-fit can be exceedingly dangerous as it will appear to be very precise when considering the collected data but may generate exceptionally poor estimates when used to make new predictions.

# A key decision in building a regression model is to deciding what variables to include in the model.

# The starting point for this decision should always be common sense. 
# You should never include an explanatory variable which you don’t have good reason to suspect will have any effect on the response variable (output). 
# example, 
#   if we are building a model to predict the Schreiner freshman class size, it would make no sense to include an explanatory variable of the number of ice cream cones sold in Texas the previous year. 
#   Ice cream sales should be totally unrelated to the freshman class size, so anything we find would likely be spurious.

# We also need to ensure that any explanatory variables we include are at least approximately linearly related to the response variable. 
# We checked for this in simple linear regression using a scatter plot of x versus y. 
# If this scatter plot looks roughly like a line then it makes sense to build a simple regression model.

# For multiple regression we have a simple plot we can make to look for relationships between our variables. 
# To make this plot we need to be considering numeric variables (just like a scatter plot), therefore in the below command I am using the command grabNumeric from my package. 
# This takes a data frame (spreadsheet) and removes any categorical variables from it, leaving only the numeric values.

#   Models can also suffer from a condition known as underfitting this occurs when some significant explanatory variable(s) are not included in the model. 
#   This to can lead to poor predictions when use to predict new data. 

# For these notes I will be using the Ames Housing data set from my package. 
# The columns of this data set are:
colnames(AmesHousing_Regression)

# The Neighborhood column is categorical, the others are numeric. 
# The goal is to build a model which can predict the sales price of a house using the SQFT, Bathrooms and Neighborhood information. 
# It makes logical sense that the size, number of bathrooms and neighborhood would each effect the sales price of a house.

plot(AmesHousing_Regression[, sapply(AmesHousing_Regression, is.numeric)], 
     cex = 0.3, main = 'Multiple Regression EDA', col = 'lightblue')

plot(grabNumeric(AmesHousing_Regression), cex=0.3, main='Multiple Regression EDA', col='lightblue')

# This plot shows the relationship between each of these factors and the sales price, and also looks for relationships between the variables themselves. 
# Since we have three numeric variables here we get a 3 by 3 grid of plots. 
# The plot in the first row, second column shows the SQFT on the y-axis and the sales price on the x-axis (notice how you can see this from looking at the diagonal labels).

# Now that we know how to read this plot, what are we looking for? 
# Well first, we want to check if our response variable (sales price) at least approximately linearly depends on the explanatory variables (bathrooms and SQFT). 
# This is shown in the 2nd row of our grid. 
# Each of these look roughly like we could fit a line to the trends.

# The next thing we want to look for is any strong relationships between our explanatory variables (SQFT and Bathrooms). 
# This is shown in row 1, column 3 as bathrooms versus SQFT and in row 3, column 1 as SQFT vs bathrooms. 
# From these graphs it looks like we have a pretty solid relationship between the number of bathrooms and the square feet of the house. 
# This also makes some logical sense as bigger houses usually have more bathrooms.

# This relationship between these two variables means that we should really only include one of them in our multiple regression model. 
# This condition is called multicollinearity between these two variables. 
# In general, this is a bad thing and this means we really shouldn’t include both of these variables together in our regression models (we will ignore this below for the sake of demonstration).

# Practically, this means that adding bathrooms to our model won’t really improve our predictions much: 
#   if we know the square footage we have a pretty good idea of the bathrooms already.

# We can also get an idea of the multicollinearity of our model using a correlation matrix. 
# Here we find the linear correlation between all sets of variables in the data set. 
# The correlation is a numerical measure of how much our scatter plot looks like a line. 
# It will range between the values of [-1,1] with positive one meaning all the data lies along a perfect line with positive slope and -1 meaning the data lies along a line with a negative slope (decreasing relationship)

# The below code forms a correlation matrix for the housing data.
cor(grabNumeric(AmesHousing_Regression))

# As you can see all of these variables are positively related. 
# The diagonal values will always be all ones, as every variable is perfectly correlated with itself.

# We can form a graphical version of this correlation matrix using:
library(corrplot)

corrplot(cor(grabNumeric(AmesHousing_Regression)))

# You may need to run the command:
install.packages('corrplot')

# to be able to make a correlation plot yourself. 
# You will only need to do this one time.

#   Mutual funds are created by bundling a bunch of individual stocks together. 
#   The idea is that budling the stocks together will can average out some of the flucuations and get a lower risk investment. 
#   However, someone needs to choose exactly which stocks to include in the fund and how much money should be invested in each companies stock. 
#   Typically, stock traders will design a mutual fund and record how well it would have done in the market for some trial period (say 1 year), then the proposed mutual funds which perform best over that trial period are offered to investors for us to put our money in. 
#   Typically, they will advertise the average return of the mutual fund achieved during the trial period. 
#   Most of the time these funds will have very impressive returns.

#   However, once the investors put their money into the funds they typically do significantly worse then the rates first reported. 
#   We can understand this as thinking of the trial period as fitting the models. 
#   The limited amout of data in the trial period makes it very easy to overfit the model. 
#   Thus, the predictions quickly become inaccurate when we move outside the trial period. 

#   We do not have the time to properly discuss under/over fitting for models in this course. 
#   However, when statistical models are built to make real world predictions generally the modeler will break their data into a training and test set. 
#   The train data is used to build the model and the test data is NEVER used in building the model. 
#   Finially, when the modeler wants to see how good of a predictive model they have built they use the test data to generate predictions and see how well the model does using data it has never seen before. 


#** 13.1.1 Housing Prices (Review of Simple Regression Results) ----
# Let’s return to the housing data set and see if we can improve our model by including some additional factors. 
# In the simple linear regression notes we used linear regression to understand the relationship between the sales price of a house and the square footage of that house. 
# The data set comes from Ames, Iowa house sales from 2006-2010. 
# First, lets read this data in and make a scatter plot of the sales price versus the square footage.
data("AmesHousing_Regression") # from HannayAppliedStats package
house <- AmesHousing_Regression # rename this data
house <- dropLowFactors(house, factor.column = 3, threshold = 30) # from HannayApplied Stats drop all neighborhoods with less than 30 data points
head(house)

# We can see this has the log10 of the selling price, the square footage and the number of bathrooms in the house.
plot(house$Square.Feet, house$SalePrice, 
     main='Real Estate Prices in Ames Iowa (Color by Neighborhood)', xlab='Square Footage (log10)', ylab='Sale Price ($) log10', col=house$Neighborhood, cex=0.5)

# As expected we can see from the plot that square footage is somewhat important in determining the sales price of the house, but we can see that their is significant variation in the sales price for any given sqft size. 
# Let’s try and build a linear model for the relationship between the sqft of the houses and the sales price.
res.house = lm(SalePrice.log10 ~ Square.Feet.log10, data = house)
summary(res.house)

# As we saw in the simple linear regression notes this is a fine model for the sales price, but notice the goodness of fit measurement R2 is only about 0.52. 
# This means that we cannot precisely predict the selling price of a house given only the square footage. 
# This makes sense practically as we expect the size of a house to be important, but many other factors will effect the price.
diagRegressionPlots(res.house, cex = 0.5)

# Multiple regression allows us to include some more information for our regression model to use in the predictions.


#** 13.1.2 Multiple Regression (Including Bathrooms) ----
# To improve our model we might want to also include the number of bathrooms in the house. 
# Thus our model to the sales price of a house becomes 
#   log10(SP) = α + β1*log10(SQFT) + β2*BATH,
#   where SP is the sales price of the house.

# We can get an idea graphically about the combined effect of bathrooms and square footage of the house by making a colored scatter plot of this data:
plot(house$Square.Feet.log10, house$SalePrice.log10, col = house$Bathroom, cex = 0.4,
     main = 'Sqft versus Sales Price colored by number of Bathrooms')
legend("bottomright", legend = sort(unique(house$Bathroom)), col = unique(house$Bathroom), ncol = 1, cex = 0.7, pch = 3)

# R makes it very easy to build our multiple linear regression model.
mlm.house.bath = lm(SalePrice.log10 ~ Square.Feet.log10 + Bathroom, data = house)
summary(mlm.house.bath) 

# For now let’s figure out how we can interpret these results. 
# Note ignore the hypothesis testing components of this during the first reading, we will cover that next.
#   1. First, we can look at the last line of the summary: 
#       “F-statistic: 1710 on 2 and 2831 DF, p-value: < 2.2e-16”. 
#     This tells us the results of a statistical test to see if sqft and bathrooms tell us anything about the sales price. 
#     The null hypothesis of the F-test is that the explanatory variables (sqft, bathrooms) don’t inform us at all about the response variable (sales price). 
#     The low p-value here tells us we can reject that null hypothesis.

#   2. Notice that the R2 value increased by a small amount (to about 0.55 from 0.52). 
#     This indicates that adding the bathroom information allowed us to make slightly more precise predictions. 
#     This is probably not as much as we were hoping for as an increase. 
#     This will very often be the case when you are building a multiple regression model (more about this later). 
#     We also should anticipate this based on our EDA, knowing the size of a house tells you roughly how many bathrooms it has, so including the number of bathrooms doesn’t give the model much more information to work with.

#   3. Recall that a slope of zero for an explanatory variable means it has no effect on the response variable. 
#   We can study the effect of a variable on the sales price by forming the confidence intervals for the coefficients:
confint(mlm.house.bath, level = 0.99)

# None of these are really close to zero, meaning that each of these factors effects the response variable (sales price).

#   4. Let’s fill in our best-fit model to help interpret the values of the coefficients: 
#     log10(SP) = 2.828 + 0.727*log10(SQFT) + 0.055*BATH.
#     This tells us we can expect the log10 of the price to increase by about 0.72 for every time the log10 sqft increases by one and the number of bathrooms is constant. 
#     For houses with the same square footage but one of them has 1.0 additional bathrooms we can expect the log10 sales price of the house with the additional bathroom to be about 0.055 more.

# In general, we can interpret these coefficients in a similar way we did for the simple linear regression, increase of the explanatory variable by one unit causes a slope increase in the response variable. 
# The main difference is that we have to say, holding the other explanatory variable constant or fixed.

# These interpretations are a bit messy from a practical standpoint though because of the logarithms. 
# We can get rid of the logarithms now by taking each side of this equation to the power of 10. 
#   10log10(SP) = 10^(2.828 + 0.727*log10(SQFT) + 0.055*BATH) ⟺ SP = 10^2.828 * 10^(0.727*log10(SQFT)) * 10^(0.055*BATH)
# This gives us the best fit model:
#   SP = 660.89(SQFT)^0.727 * (1.135)^BATH
# We could then use this formula to help predict the sales price of a house in dollars. 
# example, 
#   the model predicts the average house with 2000 square feet and 2 bathrooms would sell for about: 218,000 dollars. 
# Of course the relatively low R2 value (high residual standard error) tells us to expect significant variation about this estimate in practice.

# We can get an idea on the certainty of our predictions using prediction intervals (just like we did for simple regression)
predict.sales = predict(mlm.house.bath, data.frame(Square.Feet.log10 = c(log10(2000)), Bathroom = c(2.0)), interval = 'predict', level = 0.95);
print(10^predict.sales)

# This gives a huge range or 127k to 376k as a predicted sales price for our 2000 sqft, 2 bedroom house. 
# This is because houses with the same square footage and bathrooms can vary a lot!


#** 13.1.3 Diagnostics for Multiple Linear Regression ----
# The assumptions of simple least squares regression carry over to multiple linear regression. 
# We can check these by using our diagRegressionPlots command:
diagRegressionPlots(mlm.house.bath, cex = 0.3)

# These can be interpreted in the same way as simple linear regression, except for the bottom right plot which is pretty meaningless for a multiple regression plot. 
# You should ignore this bottom right plot for multiple regression plots.

# We will go over some additional pitfalls of multiple linear regression at the bottom of these notes. 
# In general, you will see that multiple regression opens a statistical can of worms which just isn’t present for simple regression. 
# However, in many cases this additional pain is worth the effort to obtain better predictions.


#_---- 


#* 13.2 Multiple Regression with Categorical Variables: Including --------
# I am no real estate expert, but I do know that the location and neighborhood of a house can make a huge difference in the sales price. 
# I believe real-estate agents have a saying “Location, Location, Location”. 
# Therefore we might want to include the neighborhood information into our prediction model for the sales price.

# The below plot shows the sales price versus square footage colored by the neighborhood.
plot(house$Square.Feet, house$SalePrice, 
     main = 'Real Estate Prices in Ames Iowa (Color by Neighborhood)', xlab = 'Square Footage (log10)', ylab = 'Sale Price ($) log10', col = house$Neighborhood, cex = 0.5)

# We have seen that we can include a categorical variable into a regression model using One Hot Encoding. 
# The levels of the Neighborhood variable are.
levels(house$Neighborhood)

# Let’s see what happens when we build a model for the sales price which includes the neighborhood and the square footage.
mlm.house.neigh = lm(SalePrice.log10 ~ Square.Feet.log10 + Neighborhood, data = house)
summary(mlm.house.neigh)

# This is a much longer output. 
# However, let’s start at the bottom as before. 
# Once again ignore the statistical hypothesis testing stuff on the first reading.
#   1. The F test given on the last line tells us that overall that the neighborhood and square footage indeed are associated with the sales price.
#   2. The R2 value has increased by a fair amount. 
#     Thus, our model is likely a better predictor.
#   3. Now lets look at the coefficients. 
#     You will notice we have a lot more of them! 
#     Also notice that every neighborhood is listed except the first one “BrDale”. 
#     When we give a categorical variable to R with N levels (options the categorical variable can take) it will automatically convert this into N−1 “dummy variables”. 
#     These dummy variables are 1 if the house is in that neighborhood and 0 if it is not. 
#     So under the hood R is using a model of the form: 
#       log10(SP) = α + β1*log10(SQFT) + β2*BrkSide + β3*ClearCr + β4*CollfCr + .... + β[N−1]*Timbe

# Where the neighborhood explanatory variables BrkSide, … Timber are either 1 or 0. 
# So we are basically fitting a different model for each neighborhood. 
# example 
#   our model for houses in the BrkSide neighborhood is: 
#     log10(SP) = 3.08 + 0.6375*log10(SQFT) + 0.039085 
#   for houses in ClearCtr it is: 
#     log10(SP) = 3.08 + 0.6375*log10(SQFT) + 0.167238
# Notice this is because once we know the neighborhood of a house all the other neighborhood dummy variables are zero.

#   4. What happened to the first neighborhood “BrDale”? 
#     Well, if a house is in BrDale then it is not in any of the other neighborhoods so all those dummy variables are zero. 
#     So our model for houses in “BrDale” is just:
#       log10(SP) = 3.08 + 0.6375*log10(SQFT)

#   5. Now that we know where “BrDale” went we can get a better interpretation of what the values of the neighborhood coefficients are. 
#     If they are positive it means that houses in that neighborhood (of the same square footage) will tend to sell for more money. 
#     If they are negative then the reverse is true. 
#     You can see that most of the neighborhoods are positive relative to “BrDale” meaning that perhaps BrDale is not a desirable neighborhood for some reason. 
#     Mathematically, our models we are building for each neighborhood differ only in terms of the y-intercept value. 
#     They are a bunch of parallel lines shifted vertically from one another.

# In a simple scenario like this we can avoid the dummy variable interpretation by changing our regression formula to include a +0 part. 
# This tells R to remove the intercept from the fit. 
# Notice that this model has all the neighborhoods listed.
mlm.house.neigh.all = lm(SalePrice.log10 ~ Square.Feet.log10 + Neighborhood + 0, data = house)
summary(mlm.house.neigh.all)


#** 13.2.1 Predictions ----
# By including the neighborhood information we got a much improved R2 value. 
# This will improve the precision of our predictions. 
# Here is a predicted selling price interval for our 2000 sqft house in the BrkSide neighborhood.
predict.sales = predict(mlm.house.neigh, data.frame(Square.Feet.log10 = c(log10(2000)), Neighborhood = c("BrkSide")), interval = 'predict', level = 0.95);
print(10^predict.sales)


#_---- 


# * 13.3 Interactions between Variables -----------------------------------
# Notice that when we formed our house price model with the neighborhoods included we allowed the y-intercept to change with the neighborhood. 
# This means each neighborhood is allowed to have a different default price. 
# However, we had only one slope variable which gives how the square footage effects the sales price. 
# However, in general we might want to allow each neighborhood to have its own slope variable.

# This is called an interaction. 
# We want to allow the sqft and neighborhood variables to interact. 
# Perhaps for some neighborhoods adding square footage changes the prices differently.
mlm.house.neigh.interact = lm(SalePrice.log10 ~ Square.Feet.log10 + Neighborhood + Neighborhood:Square.Feet.log10, data = house)
summary(mlm.house.neigh.interact)

# We now have a huge number of coefficients to interpret for our model. 
# However, just like before the neighborhood ones are dummy variables (either 1 or 0). 
# Therefore our model take the form: 
#   log10(SPN) = α + βN + (β + βN)*log10(SQFT)
# where the N subscripts mean that parameter depends on the particular neighborhood. 
# example, 
#   the best-fit model for the “Timber neighborhood” would be: 
# log10(SPN) = 3.2194 − 0.501458 + (0.591796 + 0.232207)*log10(SQFT)

# Notice that including this interaction term buys us a slight increase in the R2 value for the model. 
# However, our model is much more complex. 
# This is a usual trade-off (complexity versus predictive power).

# The topic of how to choose the best model is an entire mathematics discipline called model selection. 
# Naturally, this can be quite a complicated topic. 
# The general guide to model selection is a Goldilocks principle: 
#   "Build a model which is just detailed enough to match your application, and no more complex."


#_---- 


#* 13.4 Some Pitfalls in Multiple Regression -----------------------------
# 1. Core assumptions: 
#   The assumptions of linear regression carry over to multiple regression. 
#   Significant violations of the assumptions of linearity, independence of errors, normality of errors, or constant variance can all cause problems just like simple regression. 
#   We can check for these using our diagnostic plots.

# 2. Multicollinearity: 
#   This occurs when two or more explanatory variables are moderately to highly correlated. 
#   It complicates the model interpretations and can skew the statistics for it. 
#   It can be avoided by proper EDA.

# 3. Over-fitting: 
#   Build as simple a model as possible to describe your data. 
#   If you include every possible explanatory variable in your model you will begin to model the random effects in your data instead of the actual trends. 
#   This builds unnecessarily complex models which make incorrect predictions: not a good combination.


#   Avoid including explanatory variables in your model which do not improve the fit by a practically significant amount. 
#   If you add a redundant explanatory variables this will be the case (only a small improvement). 


#_---- 


#* 13.5 Homework ---------------------------------------------------------
#   File - Chapter 13.R 


# ____----


# Chapter 14 Hypothesis Testing: One Sample -------------------------------
#* 14.1 Introduction and Warning -----------------------------------------
# We now turn to the art of testing specific hypotheses using data. This is called Hypothesis testing.
# Unfortunately, hypothesis testing is probably the most abused concept in statistics. 
# It can be very subtle and should only be used when the question being considered fits snugly into the hypothesis testing framework. 
# We will see that very often a confidence interval is a better choice and conveys more information than is contained in a statistical hypothesis test.


#_---- 


#* 14.2 A Starting Example -----------------------------------------------
# Lets say that we are investigating whether a large chemical company has been leaking toxic chemicals into the water supply of a town aptly called Chemical City. 
# Let’s say that the toxic chemical is known to stunt the growth of children. 
# Therefore, we collect a random sample of heights of 3rd Grade children in Chemical City by measuring the heights of 42 children. 
# Lets load it into R for analysis.
head(chemical_children)
hist(chemical_children$Heights, 
     main='Heights of Children in Chemical City N=42', ylab='Number of Children', xlab='Height in ft', col='lightblue')

# We can estimate the population mean μ for all the 3rd grade children in Chemical City using the sample mean:
mean(chemical_children$Heights)

# Suppose that we also know from a large study that the mean height for healthy 3rd grade children is μ=3.85 feet.
# The question we can now ask is whether we have collected sufficient evidence that the growth of children in Chemical City has been stunted? 
# Could the average height of the children been less than the national average in our sample by random chance?
  
# We can now form what is called the null hypothesis H0 we wish to test.
#   H0 is the hypothesis that the mean height of children in Chemical city is equal to or greater than the national average E[¯X]=μ≥3.85

# The null hypothesis is often the boring hypothesis which doesn’t change the status quo. 
# The opposite of the null hypothesis is called the alternative hypothesis. 
# In this example our alternative hypothesis would be:
#   Ha is the hypothesis that the mean height of children in Chemical city is less than the national average E[¯X]<μ.

# As usual, our first approach will be based on simulations. 
# We can re-sample of height data to get an idea of how variable our sample mean ¯X will be for children in Chemical City.
num.sim <- 100000
many.studies <- replicate(num.sim, mean(sample(chemical_children$Heights, size = 42, replace = TRUE))) # generate a bunch of random sample means
length(many.studies[many.studies >= 3.85]) / num.sim # find the fraction of random samples which give a value greater than the national average

# Therefore, we can say that their is a small (about 1%) chance that our sample produced a smaller result than the national average by random chance.

my_hist <- hist(many.studies, breaks = 100, plot = F)
my_color <- ifelse(my_hist$breaks > 3.85, "red", "lightblue")
plot(my_hist, col = my_color, main = "Sample Averages for Chemical City Children")
# The red area shows those times we found a sample mean greater than or equal to the national average. 
# Notice this distribution is mound shaped (normally distributed) this is the CLT at work again. 


#_---- 


#* 14.3 The t.test command: Hypothesis Tests for the Population M --------
# For large enough n≥30 samples sizes (the same conditions for using the t.test command for confidence intervals) we can also do hypothesis testing using the t.test command for a hypothesis concerning the population mean. 
# example, 
#   here is the command for doing the Chemical City problem.
t.test(chemical_children$Heights, mu = 3.85, alternative = "less")


# The first parameter is the data set, the second is the null hypothesis value for the mean and the third option tells R that our alternative hypothesis is that the mean is less than 3.85. 
# We will see examples of the other options for this. 
# Notice that R will give you a sentence in the output of the t.test spelling out what the alternative hypothesis is. 
# Also, notice the line which gives us the p.value.

# The p-value may be used to determine how well the data align with results expected when the null hypothesis is true. 
# It is a measurement of how compatible the data are with the null hypothesis. 
# How likely is the effect observed in the sample data if the null hypothesis is true. 
# The p value gives the probability of observing our data as extreme (or more extreme) assuming the null hypothesis is true.
#   High p-values - The data are likely when the null is true
#   Low p-values  - The data are unlikely under the null hypothesis.

# A low p-value implies we can reject the null hypothesis. 
# In this case we can see that the p.value is pretty small p≈0.01 so we have strong evidence against the null hypothesis in our data. 
# Therefore, we might reject the hypothesis that the children of Chemical City have average or greater heights. 
# Notice that we haven’t “proved” the alternative hypothesis conclusively, rather we have found it is unlikely that the null hypothesis holds in light of the evidence present in the sample.


# The one sample t test is making use of the central limit theorem under the hood. 
# Therefore it comes with the same limitations as the CLT.
#   Only works for the hypothesis tests concerning the mean
#   Need sample sizes of at least 30 to be safe
#   If we apply this with smaller samples, we are assuming that the underlying population distribution is roughly mound shaped. Generally, we have no way to verify this.


# The statements above might remind you of a conditional probability statement. 
# In fact we can think of the p value as the conditional probability 
#   P(D|H0),
# that is the probability of observing the data given that the null hypothesis is true.

# Recall that generally P(A|B)≠P(B|A). 
# This error leads to a common misinterpretation of p values that they give the reverse conditional probability P(H0|D). 
# It is not correct to say that p values give the probability the null hypothesis is true given the data. 
# This is really a more useful probability to know in many ways. 
# However, that is NOT what a p value gives us. 
# To reverse conditional probabilities we need Bayes Rule. 


#_---- 


#* 14.4 Theory of Hypothesis Testing -------------------------------------
# We have already seen the main ingredients of statistical hypothesis testing. 
# However, here are the basic steps for single sample hypothesis tests for the population mean μ:
#   1. Select the alternative hypothesis as that which the sampling experiment is intended to establish. 
#     The alternative hypothesis will take one of the following forms:
#       One-tailed, upper tailed (e.g Ha:μ > 2400)
#       One tailed, lower tailed (e.g Ha:μ < 2400)
#       Two-tailed (e.g Ha ≠ 2400)
#   2. Select the null hypothesis H0 as the status quo. 
#     It will be the opposite of the alternative hypothesis, although if the alternative is one-tailed we can fix the value at the closest value to the alternative hypothesis.
#   3. Run the test in R using the t.test command.
      t.test(data, mu=null value, alternative=two.sided, less, greater)
#   4. Interpret the results using the p.value. 
#     If p is small we may reject the null hypothesis, if it is large we say that we retain the null hypothesis, or fail to reject the null hypothesis. 
#     More on the reasons for this jargon later, although I will say that using the correct jargon is very important to avoiding misinterpretations of hypothesis testing results.

# For each of the following situations form the null and alternative hypothesis and give the options for the command in R.

#*** Exercise 14.1 ----
#   File - Chapter 14.R 


#*** Exercise 14.2 ----
#   File - Chapter 14.R 


#*** Exercise 14.3 ----
#   File - Chapter 14.R 


#_---- 


#* 14.5 Under the Hood (t tests) -----------------------------------------
# Suppose we have designed a questionnaire system (SMARTY PANTS) to select people with higher than average IQs. 
# The IQ test by definition gives the average person a score of 100. 
# To evaluate this system we take a random sample of 50 people which SMARTY PANTS tells us have a higher than average IQ and have them complete an actual IQ test.

# We find that the mean IQ score of our SMARTY PANTS selected people is m=103 with a sample standard deviation of s=15.

# This sample mean (m) is certainly greater than 100, but we know this could have occurred by chance. 
# Perhaps we were just lucky in our samples? 
# To evaluate this we want to conduct a statistical hypothesis test with:
#   H0: μ≤100 The mean of those selected people by SMARTY pants in less than or equal to 100
#   Ha: μ>100 The mean of those selected people by SMARTY is greater than 100.

# To evaluate this we assume that the null hypothesis is true. 
# As we specified above the null hypothesis here owns all values less than or equal to 100 ( H0:μ≤100). 
# The closest value in the null hypothesis range to our sample mean (m=103) is 100. 
# So let’s assume that the population (true) mean of our SMARTY PANTS sample is 100.

# Given this assumption we now want to calculate the probability that we would collect a sample of 50 people with a sample mean greater than or equal to what we actually observed m≥103?
  
# Well, we know from our study of sampling that the sampling distribution for the sample mean ¯x will be approximately normally distributed (for samples with at least 30) with a mean=μ and a standard deviation given by the standard error σ¯x=s/√N. 
# Notice this statement is using the central limit theorem.

# Recall, we can compute the Z score for normally distributed values to get an idea of how extreme they are. 
#   Z = D−μ / σ = m−μ / (s/√N)
se = 15 / sqrt(50)
Zval = (103-100) / se

# This tells us that the results we observed in our data are 1.4142136 standard deviations above the mean. 
# Thus, the data we observed is not particularly extreme under the null hypothesis. 
# We can find the probability we observe a Z score greater than or equal to 0.2 using pnorm:
1 - pnorm(Zval)

# This is in fact the p value for this statistical hypothesis test. 
# The Z value is called the test statistic in this case.

# To be more precise we should really use the student t distribution instead of the assuming a normal distribution for our samples. 
# Recall, we use the student t distribution when we have used the data to estimate both the sample mean and the population standard deviation. 
# This is almost always the case for real data sets.

# Using the student t distribution in R is pretty easy we just switch pnorm for pt and specify the second parameter for a student t distribution (called the degree of freedom). 
# The degrees of freedom for our t distribution is just the number of samples (100) minus 1.
1 - pt(Zval, df = 99)

# Notice, this is essentially the same thing as what we found with the normal approximation above. 
# This is because the student t distribution becomes closer and closer to a normal distribution for large sample sizes.

# In summary when we use a t.test command in R. This is what R computes for us:
#   1. The test statistic (t): 
#     t = (m − μ) / (s / √N)
#       m - is the sample mean
#       μ - is the mean under the null hypothesis
#       s - is the sample standard deviation
#       N - is the sample size.
#   2. The p value using the alternative keyword:
#       Greater:    1 - pt(t, df = N-1)
#       Less:       pt(t, df = N-1)
#       Two-tailed: 2*pt(abs(t), df = N-1) where abs is the absolute value of our t statistic.


#_---- 


#* 14.6 Errors in Hypothesis Testing -------------------------------------
# In general two things can go wrong when we use statistical hypothesis testing (Fig. 14.3).
#   1. Type I Error (False Positive): 
#     occurs when the researcher rejects the null hypothesis in favor of the alternative hypothesis, while in fact the null hypothesis is true. 
#     The probability of committing a type I error is denoted by α.
#   2. Type II Error (False Negative): 
#     occurs when the researcher retains the null hypothesis when in fact the null hypothesis is false. 
#     The probability of commuting a type II error in denoted by β.

# An analogy that some people find helpful in understanding the two types of error is to consider a defendant in a trial.

# Court Analogy for Hypothesis Tests:
#   H0:             The defendant is innocent
#   Ha:             The defendant is guilty
#   Type I Error:   Convict an innocent person
#   Type II Error:  Let a guilty person go free


#   Notice that we could always set one of these error rates to zero if we wanted. 
#   example, 
#     if I just convict everyone that comes to trial then my Type II error would be zero! 
#     I cannot let a guilty person go free if I convict everyone. 
#     On the other hand I can set my Type I error rate to zero by acquitting every case.

#   This might seem silly but it illustrates the point that in any real scenario (with uncertainity involved) both the Type I and Type II error rates will be non zero. 


#** 14.6.1 Statistical Significance (α) ----
# We can control the α or false positive rate of our statistical test by setting a significance level before we test the hypothesis (really this should be set before we even collect the data). 
# Typically we use α=0.05 or α=0.01 which mean that we have a 5% chance or 1% chance respectively of rejecting the null hypothesis incorrectly. 
# When the statistical test is performed then we reject the null hypothesis only if the p-value produced is less than the significance level used.

# To understand this lets perform some simulations. 
# The below code runs a t test for the null hypothesis μ=1.0 for a random sample from a normal distribution which has a mean of 1.0.
t.test(rnorm(100, mean = 1.0, sd = 2.0), mu = 1.0, alternative = "two.sided")$p.value


# In this artificial case we know the null hypothesis is true, but due to sampling error we may occasionally get an p value which indicates that the null hypothesis should be rejected. 
# Notice that the p.value which comes out changes every time we collect a sample and run our test.
t.test(rnorm(100, mean = 1.0, sd = 2.0), mu = 1.0, alternative = "two.sided")$p.value


# This is a key-point the p value depends on the data we collect, which the result of random sampling, therefore p values are random variables themselves!

# By setting our significance level in advance to α=0.05 we say that we will reject the null hypothesis if and only if p<0.05. 
# Lets run our simulation thousands of times to see how many times we commit a Type I error at this significance level.
many.p.vals <- replicate(50000, t.test(rnorm(100, mean = 1.0, sd = 2.0), mu = 1.0, alternative = "two.sided")$p.value)
sum(many.p.vals < 0.05) / 50000


# We can see that we get about what we expect from this simulation. 
# We incorrectly reject the null hypothesis about 5% of the time as expected. 
# If we were to compute the p value of the test, and then decide to set our significance level we can end up with a much higher false positive rate. 
# This is because very often we are searching for evidence to reject the null hypothesis.

# If we conduct enough experiments even when their is no effect whatsoever eventually we will find convincing statistical evidence against the null hypothesis.

# example, 
#   if we conduct 100 experiments and only report the smallest p value we find then we can find an effect:
many.pv <- replicate(100, t.test(rnorm(100, mean = 1.0, sd = 2.0), mu = 1.0, alternative = "two.sided")$p.value)
min(many.pv)


# By conducting hypothesis tests again and again until we get the result we want (rejecting the null hypothesis) we can end up with a much higher Type I error rate then α. 
#   This fallacy (called p-hacking) is behind many of the absurd statistics you will see online. 
#     Nutrional studies are particurily prone to this type of error. 
#     This is why you may have heard that (insert common food) causes cancer and only a few weeks later hear that it cures cancer. 
#     Figure 14.4 shows some results on this (https://fivethirtyeight.com/features/you-cant-trust-what-you-read-about-nutrition/).


#** 14.6.2 Type II Error ----
# The type II (False Negative) error rate for statistical hypothesis tests is much more difficult to control than the Type I error rate.
# However, we can get an idea of this rate by doing some simulations where we know the alternative hypothesis is true.
type2.er <- replicate(5000, t.test(rnorm(30, mean = 1.1, sd = 2.0), mu = 1.0, alternative = "greater")$p.value)
sum(type2.er > 0.05) / 5000 # cases where the retain the null hypothesis at alpha=0.05, even though it is false

# Notice how large this β rate is! In the general β will usually increase as we decrease α.


# Generally as we attempt to lower the Type I error rate in hypothesis testing this will result in an increase in the Type II error rate. 


type2.er <- replicate(5000, t.test(rnorm(30, mean = 1.1, sd = 2.0), mu = 1.0, alternative = "greater")$p.value)
sum(type2.er > 0.01) / 5000 # cases where the retain the null hypothesis at alpha=0.01, even though it is false

# That is if we risk more False Negatives if we make our criterion for rejecting the null hypothesis very stringent.
# In the court analogy this is equivalent to saying by making the burden of proof very high we can control for the rate of false convictions, but making this criteria overly stringent will lead to an increase in the false acquittals.
# The best way to decrease both α and β is to shed more light on the true nature of the population by increasing the sample size.
# We can control the false positive rate by choosing α small, and decrease β by increasing the sample size.
type2.er <- replicate(5000, t.test(rnorm(3000, mean = 1.1, sd = 2.0), mu = 1.0, alternative = "greater")$p.value) # larger sample size
sum(type2.er > 0.05) / 5000 # cases where the retain the null hypothesis at alpha=0.01, even though it is false

# We can see that by increasing the sample size to large samples we can get a more reasonable Type II (False Negative) error rate.


# We may lower the chances of a type II error by collecting more data.
# The type I error rate is controlled by us in choosing an appropriate α. 


#** 14.6.3 Practical Significance versus Statistical Significance ----
# It is also important to note that just because we find the differences are statistically significant it doesn’t mean that they are of any practical significance.
# example,
#   suppose we wanted to examine whether an online statistics tutor increased the mean grade point average of the students.
# If the mean GPA before the tutoring was 3.50 we could do a upper tailed significance test to see if the GPA increased.
#   H0: μ=3.5
#   Ha: μ>3.5

# Lets simulate this process but we will set the mean GPA after the tutoring to 3.51.
gpa.after <- rnorm(10000, mean = 3.51, sd = 0.2)
t.test(gpa.after, mu = 3.50, alternative = 'greater')

# We can see that the difference in GPAs before and after the tutoring is highly, highly significant with a tiny p value.
# However, if we payed 500 dollars for the tutoring a difference in 0.01 in the final GPA is of no practical significance.
# This means we need to pay attention to the actual differences rather than just whether the result in statistically significant.
# If we have large enough sample sizes we can find statistically significant differences between groups which have no practical significance.
# This is like the twix bar from the left and right factories.


# Practical and statistical significance are two different things entirely.
# With large data sets we can find statistically significant differences which may amount to NO practical significance. 


# As a matter of point if we have small sample sizes we can fail to find differences between groups as well.
# example,
#   if we had some nefarious wish to show that Turtles sizes on golf courses were no different than normal turtles, we might collect the data for only a few turtles (say 10) and then do a two tailed hypothesis test.
# Here is a simulation of this scenario:
fake.golf.course.turtles <- rnorm(10, mean = 20.0, sd = 8.0)
t.test(fake.golf.course.turtles, mu = 19.0, alternative = "two.sided" )

# We can see that the mean of the golf course turtles mass is actually different than the population mean (μ=19.0), however since our sample size is so small we will in general get large p values.
# Therefore, we fail to reject the null hypothesis.
# This is why we don’t say that we “accept the null hypothesis”, because failing to reject the null hypothesis might occur because there truly is no difference OR it may occur because we didn’t collect enough data.
# We can never prove the null hypothesis as being true, only collect and measure (using a p value) the evidence against it.

# The golf course owner might misinterpret the results of the statistical test and report that the results of the turtle survey concluded that no difference existed between the golf course turtles and normal turtles.


# We are careful to say we retain the null hypothesis or if you are a fan of double negative we fail to reject the null hypothesis because when we retain the null hypothesis this could happen for two reasons:
#   The null hypothesis is in fact true
#   We have insufficient data to reject the null hypothesis

# Generally, we have no way of knowing which of these two reasons are the culprit. 


# Beware of the fallacy of accepting the null hypothesis.
# Under this fallacy we could prove anything by just never collecting enough evidence to reject the null hypothesis. 


#_---- 


#* 14.7 Hypothesis Testing for Population Fraction -----------------------
# We have seen how to perform hypothesis testing for the population mean μ.
# We can also easily do hypothesis testing for the population proportion in R.
# The same principles apply to this case, except now we are testing for evidence that our samples proportion p differs from a larger population.

#** 14.7.1 Example: ----
# Suppose we flip a coin 20 times and obtain 15 heads and 5 tails.
# Can we conclude that the coin is biased?
# Here are alternative hypothesis is that Ha:p ≠ 0.5 and therefore the null hypothesis is H0 = 0.5.
# To run this test in R we use the prop.test command:

prop.test(15, 20, p = 0.50, alternative = "two.sided")


# You will notice that the syntax for this command is similar to the t.test hypothesis test.
# Here the first entry is the number of successes in our sample, the second entry is the total number of trials in the sample, p sets the null hypothesis value (like mu in t.test), and the alternative option is the same as the t.test.


# The conditions for performing a hypothesis test for a population proportion are the same as forming a confidence interval. We need….
#   At least five sucesses in our data set
#   At least five failures in our data set

# I call this the rule of 5 and 5. 


#*** Exercise 14.4 ----
#   File - Chapter 14.R 


#*** Exercise 14.5 ----
#   File - Chapter 14.R


#_---- 


#* 14.8 Hypothesis Testing in Linear Regression --------------------------
# We have seen some t tests being performed already in this class when we learned about linear regression.
# Let’s consider the simple example using the alligator data set.
# Recall this data set has two columns lnLength and lnWeight which gives the snout length of alligators against their weight.
# When plotting these two variable together we get a nice linear relationship in the scatter plot.

colnames(alligator)
plot(alligator$lnLength, alligator$lnWeight, xlab = 'Snout Length', ylab = 'Weight', main = "Alligators")

# Therefore, we are led to doing a linear regression analysis of the relationship between these variables.
# From this analysis we get the familiar summary.

lm.alligator = lm(lnWeight ~ lnLength, data = alligator)
summary(lm.alligator)


# However, now that we know a bit about hypothesis testing take a look at the last two columns in the Coefficients section.
# One column has t values and the next column gives us p values (3.08e-10, 1.49e-12).
# These p values are the result of performing a two tailed t test on the coefficients.
# These tell us if we have sufficient evidence to reject the null hypothesis that the coefficient is equal to zero.

# The other p value that you can see in this summary is on the very last line.
# This p value is produced by a new type of hypothesis test (rather inventively called an F-test).
# An F-test for a regression model allows us to compare the fit of our model against a model with all the slopes set to zero.
# The null hypothesis of the F-test is that a model with no slope y=α can explain our data just as well as our linear model y=βx+α.

# In this simple case notice the F-test is redundant with the t test for the slope. In fact they give the exact same p value.
# In multiple regression models the F-test won’t be redundant with one of the slope t tests and gives us a way to assess the overall fit of our model.


# We can also use the F-test to compare two nested regression models.
# By nested we mean where one of the models can be generated from the other by setting some of the slopes to zero.
# We won’t go into this in detail here.
# However if interested you can read more here
#   (https://bookdown.org/ndphillips/YaRrr/comparing-regression-models-with-anova.html).


#_---- 


#* 14.9 Power of a Statistical Test --------------------------------------
# The final note for this section is to define the power of a statistical hypothesis test.
# The power of a test range from 0 to 1, with 1 being the most powerful test.
# The statistical power of a hypothesis test is given by 
#   Power = 1 − β
# where β is the Type II (False Negative) error rate.
# The power of a test a measurement of the ability of the test to distinguish truth from illusions.
# We saw that if we collect only a small amount of data, then we have very little evidence from which to draw our conclusions.
# Therefore, our statistical test has little power in this case.
# In addition, since collecting more data will in general decrease our Type II error rate we can increase the power of any test by collecting more data.

# In Statistics much effort is devoted to finding the most powerful test available for a given scenario.
# Generally, to increase the power of a test without collecting more data we will need to add some assumptions about the data.
# If these are justified then all is well and we will get reduced error rates.


#_---- 


#* 14.10 Homework --------------------------------------------------------
#   File - Chapter 14.R


# ____----


# Chapter 15 Hypothesis Testing: Two Sample Tests -------------------------
#* 15.1 Two Sample t test ------------------------------------------------
# We can also use the t test command to conduct a hypothesis test on data where we have samples from two populations.
# To introduce this lets consider an example from sports analytics.
# In particular, let us consider the NBA draft and the value of a lottery pick in the draft.
# Teams which do make the playoffs are entered into a lottery to determine the order of the top picks in the draft for the following year.
# These top 14 picks are called lottery picks.

# Using historical data we might want to investigate the value of a lottery pick against those players who were selected outside the lottery.

colnames(NBA_Draft_Data)
NBA_Draft_Data$Lottery.Pick = ifelse(NBA_Draft_Data$Pick.Number <= 14, "Lottery", "Not Lottery") # create a lottery pick column


# We can now make a boxplot comparing the career scoring averages of the lottery picks between these two pick levels.
boxplot(NBA_Draft_Data$PTS~NBA_Draft_Data$Lottery.Pick,
        ylab = 'Career PPG Average', main = 'Career PPG for Lottery Picks versus Non Lottery Picks', col='skyblue1')


# From this boxplot we notice that the lottery picks tend to have a higher point per game (PPG) average.
# However, we certainly see many exceptions to this rule.
# We can also compute the averages of the PTS column for these two groups:

NBA_Draft_Data %>%
  group_by(Lottery.Pick) %>%
  summarise(ppg = mean(PTS), NumberPlayers = n())


# This table once again demonstrates that the lottery picks tend to average more points.
# However, we might like to test this trend to see if have sufficient evidence to conclude this trend is real (this could also just be a function of sampling error).


#** 15.1.1 Regression analysis ----
# Our first technique for looking for a difference between our two categories is linear regression with a categorical explanatory variable.
# We fit a regression model of the form:
#   PTS = β*δ[not lottery] + α
#     Where
#       δ[not lottery] is equal to one if the draft pick fell outside the lottery and zero otherwise.

lm.draft = lm(PTS ~ Lottery.Pick, data = NBA_Draft_Data)
summary(lm.draft)


# To see if this relationship is real we can form a confidence interval for the coefficients.
confint(lm.draft)


# From this we can see that Lottery picks to tend to average more point per game over their careers.
# The magnitude of this effect is somewhere between 3.5 and 4.7 points more for lottery picks.


#** 15.1.2 Two Sample t test approach ----
# For this we can use the two-sample t-test to compare the means of these two distinct populations.

# Here the alternative hypothesis is that the lottery players score more points 
#   HA: μL > μNL
# thus the null hypothesis is 
#   H0: μL ≤ μNL.
# We can now perform the test in R using the same t.test command as before.

t.test(NBA_Draft_Data$PTS ~ NBA_Draft_Data$Lottery.Pick, alternative = 'g')


# Notice that I used the magic tilde ~ to split the PTS column into the lottery/non-lottery pick subdivisions.
# I could also do this manually and get the same answer:

lottery.ppg = subset(NBA_Draft_Data$PTS, NBA_Draft_Data$Lottery.Pick == 'Lottery')
not.lottery.ppg = subset(NBA_Draft_Data$PTS, NBA_Draft_Data$Lottery.Pick == 'Not Lottery')
t.test(lottery.ppg, not.lottery.ppg, alternative = 'g')


# The very small p-value here indicates that the population mean of the lottery picks is truly greater than the population mean of the non-lottery picks.

# The 95% confidence interval also tells us that this difference is rather large (at least 3.85 points).


# Conditions for using a two-sample t test:
# These are roughly the same as the conditions for using a one sample t test, although we now need to assume that BOTH samples satisfy the conditions.
#   1. Must be looking for a difference in the population means (averages)
#   2. 30 or greater samples in both groups (CLT)
#   3. If you have less than 30 in one sample, you can use the t test must you must then assume that the population is roughly mound shaped. 


#*** Exercise 15.1 ----
#   File - Chapter 15.R


#*** Exercise 15.2 ----
#   File - Chapter 15.R


# At this point you would probably like to know why we would ever want to do a two sample t test instead of a linear regression?
# My answer is that a two sample t test is more robust against a difference in variance between the two groups. 
# Recall, that one of the assumptions of simple linear regression is that the variance of the residuals does not depend on the explanatory variable(s). 
# By default R does a type of t test which does not assume equal variance between the two groups. 
# This is the one advantage of using the t test command.
# Also, you should know what a two sample t test is. Even if you are not going to be doing many you will still see if being done by others all the time. 


# The two sample t test is specialized to deal with comparing the mean values between only two categories. 
# It doesn’t work for categorical variables with more than two levels. 


#** 15.1.2.1 Paired t test ----
# Lets say we are trying to estimate the effect of a new training regiment on the 40 yard dash times for soccer players. 
# Before implementing the training regime we measure the 40 yard dash times of the 30 players. 
# First lets read this data set into R.

head(soccer_coach)


# First, we can compare the mean times before and after the training:
mean(soccer_coach$before.time)
mean(soccer_coach$after.time)


# Also we could make a side by side boxplot for the soccer players times before and after the training
boxplot(soccer_coach$before.time, soccer_coach$after.time,
        main='40 yard dash times of Soccer Players before/after Training', ylab='Time (sec)', names=c("Before", "After"), col='lightblue')


# We could do a simple t test to examine whether mean of the players times after the training regime is implemented decrease (on average). 
# Here we have the alternative hypothesis that Ha: μb − μa > 0 and thus the null hypothesis that H0: μb − μa ≤ 0. 
# Using the two sample t test format in R we have:

t.test(soccer_coach$before.time, soccer_coach$after.time, alternative='greater')


# Here we cannot reject the null hypothesis that the training had no effect on the players sprinting performance. 
# However, we haven’t used all of the information available to us in this scenario. 
# The t test we have just run doesn’t know that we recorded the before and after for the same players more than once. 
# As far as R knows the before and after times could be entirely different players as if we are comparing the results between one team which received the training and one who didn’t. 
# Therefore, R has to be pretty conservative in its predictions. 
# The differences between the two groups could be due to many reasons other than the training regime implemented. 
# Maybe the second set of players just started off being a little bit faster, etc.

# The data we collected is actually more powerful because we know the performance of the same players before and after the test. 
# This greatly reduces the number of variables which need to be accounted for in our statistical test. 
# Luckily, we can easily let R know that our data points are paired.

t.test(soccer_coach$before.time, soccer_coach$after.time, alternative='greater', paired=TRUE)


# Setting the paired keyword to true lets R know that the two columns should be paired together during the test. 
# We can see that running the a paired t test gives us a much smaller p value. 
# Moreover, we can now safely conclude that the new training regiment is effective in at least modestly reducing the 40 yard dash times of the soccer players.

# This is our first example of the huge subject of experimental design which is the study of methods which can be used to create data sets which have more power to distinguish differences between groups. 
# Where possible it is better to collect data for the same subjects under two conditions as this will allow for more powerful statistical analysis of the data (i.e a paired t test instead of a normal t test).

# Whenever the assumptions are met for a paired t test, you will be expected to perform a paired t test in this class.


#*** Exercise 15.3 ----
#   File - Chapter 15.R


#_---- 


#* 15.2 Two Sample Proportion Tests --------------------------------------
# We can also use statistical hypothesis testing to compare the proportion between two samples. 
# example, 
#   we might conduct a survey of 100 smokers and 50 non-smokers to see whether they buy organic foods. 
#   If we find that 30/100 smokers buy organic and only 11/50 non-smokers buy organic then can we conclude that more smokers buy organic foods that smokers? 
#   Ha: ps > pn and H0: ps ≤ pn.

prop.test(c(30,11), c(100,50), alternative='greater')


# In this case we don’t have sufficient evidence to conclude that a larger fraction of smokers buy organic foods. 
# It is common when analyzing survey data to want to compare proportions between populations.

# The key assumptions when performing a two-sample proportion test are that we have at least 5 successes and 5 failures in BOTH samples.


#*** Exercise 15.4 ----
#   File - Chapter 15.R


#_---- 


#* 15.3 Extra Example: Birth Weights and Smoking -------------------------
# For this example we are going to use a data from a study on the risk factors associated with giving birth to a low-weight baby (sometimes defined as less than 2,500 grams). 
# This data set is another one which is build into R. 
# To load this data for analysis type:

library(MASS)
data(birthwt)


# You can view all a description of the data by typing ?birthwt once it is loaded. 
# To begin we could look at the raw birth weight of mothers who were smokers versus non-smokers. 
# We can do some EDA on this data using a boxplot:

boxplot(birthwt$bwt~birthwt$smoke, xlab='Smoke', ylab='Birth Weight')


# From the boxplot we can see that the median birth weight of babies whose mothers smoked was smaller. 
# We can test the data for a difference in the means using a t.test command.

t.test(birthwt$bwt~birthwt$smoke, alternative='g')


# Notice we can use the ~ shorthand to split the data into those two groups faster than filtering. 
# Here we get a small p value meaning we have sufficient evidence to reject the null hypothesis that the mean weight of babies of women who smoked is greater than or equal to those of non-smokers.

# Within this data set we also have a column low which classifies whether the babies birth weight is considered low using the medical criterion (birth weight less than 2,500 grams):

table(birthwt$smoke, birthwt$low)


# We can see that smoking gives a higher fraction of low-weight births. 
# However, this could just be due to sampling error so let’s run a proportion test to find out.

prop.test(table(birthwt$smoke, birthwt$low), alternative='greater') # does a proportion test between rows


# Once again we find we have sufficient evidence to reject the null hypothesis that smoking does not increase the risk of a low birth weight.


#_---- 


#* 15.4 Homework ---------------------------------------------------------
#   File - Chapter 15.R


# ____----


# Chapter 16 Confidence Intervals and Hypothesis Testing ------------------
#* 16.1 Relation to Confidence Intervals ---------------------------------
# I have been hinting throughout our discussion of hypothesis testing that in many cases confidence intervals are a better approach. 
# In fact for the single sample tests we have looked at so far we have little need for complications of hypothesis testing. 
# R has been hinting that confidence intervals can also be used in the output from the t.test and prop.test commands.


#** 16.1.1 Two sided tests ----
# Lets start with two sided hypothesis tests. 
# Recall we use two sided hypothesis tests when our alternative hypothesis is of the form Ha: μ ≠ a or Ha: p ≠ b for the case of testing population proportions.

# example,
#   lets look at the biased coin example from the last section again:

prop.test(15,20, p=0.50, alternative="two.sided")


# You will notice that R gives us a 95 percent confidence interval for p given the data. 
# This is the very same confidence interval we would get if we used the prop.test command to just get the confidence interval for the population proportion p:

prop.test(15,20)


# Notice that 0.5 is just outside the 95% confidence interval for p. 
# This means we would reject the null hypothesis at a significance level of α=0.05 for any null hypothesis outside this 95% confidence interval (0.505.0.904). 
# Therefore, conducting a two-sided hypothesis test with significance level α just amounts to forming a confidence interval at 1.0-α level and seeing if the confidence interval contains the null value.

# If the 95% confidence interval formed based on our sample does not include the null hypothesis value H0:μ=a or H0:p=b we would reject the null hypothesis at a α=0.05 significance level.

# This is important for a few reasons:
#   1. Generality:
#     We saw how to form the confidence interval for any point estimator we want (median, variance, IQR, etc) using bootstrapping. 
#     You will notice we only learned how to do hypothesis tests for the population mean μ and proportion p. 
#     Therefore, interpreting confidence intervals as hypothesis tests allows us to perform hypothesis tests on any point estimator ^θ we want using bootstrapping.

#   2. Ease of Interpretations:
#     By reporting the confidence interval rather than just the results of the hypothesis test we give the reader our our results much more information. 
#     This enables us to spot and correct many of the common mistakes we have discussed for hypothesis testing.


#*** Example 16.1 ----
# Lets say that we flip a coin 20000 times and find 9850 heads. 
# If we perform a hypothesis test with Ha:p≠0.5 and H0:p=0.5, we find: 
prop.test(9850, 20000, p=0.5, alternative = 'two.sided')


# We find sufficient evidence to reject the null hypothesis here at a α=0.05 significance level. 
# This could be reported as finding a biased coin. 
# However, if we were to report the confidence interval as (0.485,0.49945) we can see that the only reason we find a “significant” difference here is because the sample size is very large. 
# The reader can then make up their own mind as to what constitutes a significant difference.


#*** Example 16.2 ----
# We say that hypothesis testing can also be manipulated in the opposite direction by nefarious statisticians. 
# If we want to set-up a hypothesis test to not find a difference between groups we could take very small sample sizes, and then say we failed to reject the null hypothesis. 
# example, 
#   suppose we had a biased coin (only gives heads 40% of the time) we want to pass off as fair. 
#   We might only flip it ten times. 
#   Say this yields 4 heads. 
#   If we run a hypothesis test on this data with the Ha: p ≠ 0.5 and H0: p = 0.5 we find: 

prop.test(4,10, p=0.5, alternative='two.sided')


# We could then (falsely) claim that since we didn’t reject the null hypothesis this shows our coin isn’t biased. 
# However, we say earlier that we might fail to reject the null hypothesis for two reasons. 
# First because the null is actually true, but also because we haven’t collected enough data yet. 
# Looking at the confidence interval here can give us an idea of which case we are in. 
# The 95% confidence interval here is 0.1369306, 0.7263303. 
# This huge range on the confidence interval tells us we are in the not enough data regime.

# A wide confidence interval indicates that we may have retained the null because we have insufficient evidence to perform any inference at all.


#*** Exercise 16.1 ----
#   File - Chapter 16.R


#** 16.1.2 One-sided confidence intervals ----
# When we learned about confidence intervals we saw that a typical 95% confidence interval (s1,s2) is chosen so that
#   s1 is the 2.5% quantile of the sampling distribution
#   s2 is the 97.5% quantile of the sampling distribution

# Thus we decide to take off the 5% from each side evenly. 
# However, their is no particular reason that we have to do it this way. 
# example, 
#   we could leave off 5% by considering the intervals (−∞,h1) or (h2,∞). 
#   Where h1 is the 95% quantile of the sampling distribution and h2 is the 5 quantile of the sampling distribution. 
#     This are called one-sided confidence intervals
#       and are the confidence interval equivalent for hypothesis testing when are alternatives is sided (less, greater).

# When we test a “less” alternative hypothesis like Ha:μ<0.1 or for proportions Ha:p<0.5, then the confidence interval to use is the left one sided interval (−∞,h1). 
# If we use the t.test or prop.test commands in R, then R will automatically choose this for us. 
# The confidence interval equivalent to a hypothesis test is to form your confidence interval (usually 95% or 99%) and see if it contains the null value. 
# If it does then retain the null hypothesis at level (100-95, or 100-99).

# The “greater” test is equilvalent to forming a right one sided interval (h2,∞). 
# With the same interpretations as above.


#*** Example 16.3 ----
# Lets say we want to show that a coin is biased in that it comes up heads less than 45% of the time. 
# If we flip the coin 15 times and it comes up heads 5 times, do we have sufficient evidence to reach this conclusion?

# Lets use the prop.test command to form a left sided confidence interval:

prop.test(5, 15, alternative='less')


# This confidence interval contains the null hypothesis so we cannot conclude that the true p is less than 45% given this data.


#*** Example 16.4 ----
#  For the toad girth data set we may want to know whether we have sufficient evidence that the mean toad girths of Kerr Country are greater than 94mm?

# Lets use a t.test command and interpret the confidence interval.

t.test(toad_girth$Girths, alternative = 'greater', conf.level = 0.95)


# At the 95% level we see the confidence interval does not contain the null value (94) so we would reject the null hypothesis. 
# However, we can see that if we raise the significance level to 1%, we get:

t.test(toad_girth$Girths, alternative = 'greater', conf.level = 0.99)

# Now the null hypothesis value is contained in the confidence interval.


#*** Exercise 16.1 ----
#   File - Chapter 16.R


# ____----
















#_---- 

# ____----


load(paste(path_dataset, "Young_People_Survey", ".Rdata", sep = ""))

load(paste(path_dataset, "soccer_coach", ".rda", sep = ""))

source(paste(path_add_func, "dropLowFactors", ".R", sep = ""))

source(paste(path_shiny, "runHannayApp", ".R", sep = ""))
