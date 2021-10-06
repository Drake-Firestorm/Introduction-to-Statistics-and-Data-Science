#*** Exercise 16.1 ----
# Test the hypothesis take p≠0.6 for data with 56 successes out of 100 using a confidence interval approach.
prop.test(56, 100, p = 0.6, alternative = "two.sided")

# Fail to reject null hypothesis based on p-value.
# Based on confidence interval, we see that it contains 0.6.


#*** Exercise 16.2 ----
# Can we conclude from the toad girth data set that the median toad girth is not equal to 100mm at a significance level of α=0.05? 
med <- replicate(10000, median(sample(toad_girth$Girths, 100, replace = TRUE)))
quantile(med, c(0.025, 0.975))
# No, we can't conclude that the median toad girth is not equal to 100mm.
