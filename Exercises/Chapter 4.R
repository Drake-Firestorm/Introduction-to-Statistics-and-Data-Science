#* Exercise 4.1 ----
# Create a new dataframe from the nflplays dataframe which has only the PlayType, Yards.Gained, posteam columns using the select command.
dplyr::select(nflplays, PlayType, Yards.Gained, posteam)


#* Exercise 4.2 ----
# From the nflplays data frame use the select command to grab all columns from posteam to Fumble.
# How many columns are left in your reduced data frame?
dim(dplyr::select(nflplays, posteam:Fumble))


#* Exercise 4.3 ----
# Run the na.omit on animal_sleep and THEN select the name and brainwt columns.
# How many rows are left in this data set?
# Does the order of the commands matter? 
dim(dplyr::select(na.omit(animal_sleep), name, brainwt))
#   Yes


#* Exercise 4.4 ----
# How many pass plays resulted in a fumble in the data set?
# How does this compare to the number of Run plays that resulted in a fumble?
# Use the filter command and the fumble column and the PlayType column.
table(select(filter(nflplays, Fumble == 1), PlayType))


#* Exercise 4.5 ----
# How many pass plays resulted in a fumble OR an interception?
table(select(filter(nflplays, Fumble == 1 | InterceptionThrown == 1), PlayType))


#* Exercise 4.6 ----
# How many pass plays did the New York Giants (NYG) run on third down? 
table(select(filter(nflplays, posteam == "NYG", down == 3), PlayType))


#* Exercise 4.7 ----
# Use a chain to find the order of animals in the animal_sleep data set from the smallest to largest brain weight (brainwt).
# Do this all in one command.
animal_sleep %>% select(name, brainwt) %>% arrange(brainwt)


#* Exercise 4.8 ----
# Find the average yards gained for Run plays grouped by the team.
# You will need to add a filter command to the chain.
nflplays %>% filter(PlayType == "Run") %>% group_by(posteam) %>% summarise(avg_yd_gained = mean(Yards.Gained))


#* Exercise 4.9 ----
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

