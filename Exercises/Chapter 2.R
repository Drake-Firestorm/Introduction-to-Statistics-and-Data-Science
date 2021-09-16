#* Exercise 2.1 ----
# Open RStudio and use R as a calculator to find the value of 2^3+exp(3)/10 in the console. 
2^3+exp(3)/10


#* Exercise 2.2 ----
# Make a vector in R with the numbers 1,2,3,4,5 and save it under the name my_vec.
# Slice your vector to vector to get only values greater than 3. 
my_vec <- seq(1,5,1)
my_vec[my_vec > 3]


#* Exercise 2.3 ----
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


#* Exercise 2.4 ----
# Load the geese flocks data set using the command data(geese_flocks) filter this data frame to have only rows (observations) where the flock.size is greater than 50.
# How many rows are left in this reduced data frame? 

dim( subset(geese_flocks, geese_flocks$flock.size > 50) )


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
