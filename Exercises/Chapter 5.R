#* Exercise 5.1 ----
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

