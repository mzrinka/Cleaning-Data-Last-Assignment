# Cleaning-Data-Last-Assignment
# This R script first reads in all the necesary data files from the directory
# the first sets of data are basic information such as label, activity, and subject information
# the second batch are the training and test files
# Then, I select columns of train and test data that contains only the mean and standard deviation of each appropriate features
# Information associated with activity and subject are added in to the train and test data set
# Activity label data is merged into each data set
# Then I row combined training and test data to create the final data 
# another tidy data set is created by aggregating the above data set by subject and activity. There are 30 unique subjects and 6 unique activities, thus total 180 rows.
