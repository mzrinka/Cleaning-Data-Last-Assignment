# Cleaning-Data-Last-Assignment
# This R script first reads in all the necesary data files from the directory
# the first sets of data are basic information such as label, activity, and subject information
# the second batch are the training and test files
# Then, I select columns of train and test data that contains only the mean and standard deviation of each appropriate features
# Information associated with activity and subject are added in to the train and test data set
# Activity label data is merged into each data set
# Then I row combined training and test data to create the final data 
# another tidy data set is created by aggregating the above data set by subject and activity. There are 30 unique subjects and 6 unique activities, thus total 180 rows.

# there are 82 unique columns included in the dataset. Below is a description of their meaning
 [1] "activity"       --- Index of activities                
 [2] "tBodyAcc-mean()-X"              
 [3] "tBodyAcc-mean()-Y"              
 [4] "tBodyAcc-mean()-Z"              
 [5] "tGravityAcc-mean()-X"           
 [6] "tGravityAcc-mean()-Y"           
 [7] "tGravityAcc-mean()-Z"           
 [8] "tBodyAccJerk-mean()-X"          
 [9] "tBodyAccJerk-mean()-Y"          
[10] "tBodyAccJerk-mean()-Z"          
[11] "tBodyGyro-mean()-X"             
[12] "tBodyGyro-mean()-Y"             
[13] "tBodyGyro-mean()-Z"             
[14] "tBodyGyroJerk-mean()-X"         
[15] "tBodyGyroJerk-mean()-Y"         
[16] "tBodyGyroJerk-mean()-Z"         
[17] "tBodyAccMag-mean()"             
[18] "tGravityAccMag-mean()"          
[19] "tBodyAccJerkMag-mean()"         
[20] "tBodyGyroMag-mean()"            
[21] "tBodyGyroJerkMag-mean()"        
[22] "fBodyAcc-mean()-X"              
[23] "fBodyAcc-mean()-Y"              
[24] "fBodyAcc-mean()-Z"              
[25] "fBodyAcc-meanFreq()-X"          
[26] "fBodyAcc-meanFreq()-Y"          
[27] "fBodyAcc-meanFreq()-Z"          
[28] "fBodyAccJerk-mean()-X"          
[29] "fBodyAccJerk-mean()-Y"          
[30] "fBodyAccJerk-mean()-Z"          
[31] "fBodyAccJerk-meanFreq()-X"      
[32] "fBodyAccJerk-meanFreq()-Y"      
[33] "fBodyAccJerk-meanFreq()-Z"      
[34] "fBodyGyro-mean()-X"             
[35] "fBodyGyro-mean()-Y"             
[36] "fBodyGyro-mean()-Z"             
[37] "fBodyGyro-meanFreq()-X"         
[38] "fBodyGyro-meanFreq()-Y"         
[39] "fBodyGyro-meanFreq()-Z"         
[40] "fBodyAccMag-mean()"             
[41] "fBodyAccMag-meanFreq()"         
[42] "fBodyBodyAccJerkMag-mean()"     
[43] "fBodyBodyAccJerkMag-meanFreq()" 
[44] "fBodyBodyGyroMag-mean()"        
[45] "fBodyBodyGyroMag-meanFreq()"    
[46] "fBodyBodyGyroJerkMag-mean()"    
[47] "fBodyBodyGyroJerkMag-meanFreq()"
[48] "tBodyAcc-std()-X"               
[49] "tBodyAcc-std()-Y"               
[50] "tBodyAcc-std()-Z"               
[51] "tGravityAcc-std()-X"            
[52] "tGravityAcc-std()-Y"            
[53] "tGravityAcc-std()-Z"            
[54] "tBodyAccJerk-std()-X"           
[55] "tBodyAccJerk-std()-Y"           
[56] "tBodyAccJerk-std()-Z"           
[57] "tBodyGyro-std()-X"              
[58] "tBodyGyro-std()-Y"              
[59] "tBodyGyro-std()-Z"              
[60] "tBodyGyroJerk-std()-X"          
[61] "tBodyGyroJerk-std()-Y"          
[62] "tBodyGyroJerk-std()-Z"          
[63] "tBodyAccMag-std()"              
[64] "tGravityAccMag-std()"           
[65] "tBodyAccJerkMag-std()"          
[66] "tBodyGyroMag-std()"             
[67] "tBodyGyroJerkMag-std()"         
[68] "fBodyAcc-std()-X"               
[69] "fBodyAcc-std()-Y"               
[70] "fBodyAcc-std()-Z"               
[71] "fBodyAccJerk-std()-X"           
[72] "fBodyAccJerk-std()-Y"           
[73] "fBodyAccJerk-std()-Z"           
[74] "fBodyGyro-std()-X"              
[75] "fBodyGyro-std()-Y"              
[76] "fBodyGyro-std()-Z"              
[77] "fBodyAccMag-std()"              
[78] "fBodyBodyAccJerkMag-std()"      
[79] "fBodyBodyGyroMag-std()"         
[80] "fBodyBodyGyroJerkMag-std()"     
[81] "subject"  ---- subject index                      
[82] "activity_label"  ---- label for each activity
