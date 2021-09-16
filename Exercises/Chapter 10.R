#* Exercise 10.1 ----
# Find the 99% Confidence Interval of the sample mean departure delays using bootstrapping
quantile(many.studies, c(0.005, 0.995))


#* Exercise 10.2 ----
# Find the 95% Confidence Interval for the sample variance of the departure delays using bootstrapping
many_variance_studies <- replicate(10000, sd(sample(flightNYC$dep_delay, 5000, replace=TRUE))^2) 
quantile(many_variance_studies, c(0.025, 0.975))


#* questions ----
# To learn more about how to interpret confidence intervals open the app “ConfidenceIntervals” by running the command:
#** 1. ----
# The red lines show the confidence intervals which do not contain the actual population mean.
# How does the number of these misses change as you adjust the confidence level?
# Can you see a connection between the confidence level and the expected number of errors?
#   As the confidence interval decreases (i.e. 99 to 80), number of errors increases.


#** 2. ----
# How does changing the sample size effect the number of errors made (misses)?
#   No impact from sample sizes.


#** 3. ----
# How does the width (length) of the intervals change as the sample size increases?
#   width reduces as sample size increases.


#** 4. ----
# How does the width(length) of the confidence intervals change as the confidence level increases?
#   width increase as condidence level increases (i.e. 80 to 99)


#* Exercise 10.3 ----
# Back to the flight delays example if we increased our sample size in the original experiment to 10000 flights what would you expect to happen to to the width of our 95% confidence interval? 
#   width should reduce
many.studies <- replicate(10000, mean(sample(flightNYC$dep_delay, 10000, replace=TRUE)))

hist(many.studies, col='coral', xlab='Flight Delays in Minutes', main='Histogram of Possible Mean Flight Delays NYC')

quantile(many.studies, c(0.025, 0.975))

