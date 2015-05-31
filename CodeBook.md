# Codebook of Coursera Data scientist - Course Getting and Cleanning Data - Course Project
## This exercises are based in folows sites:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
  This described the work that they made with 30 volunteers, mesurements, tables created, variables, etc.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
The zip contain: 
     directories:train
                 test
     files: README.txt
            features_info.txt
            features.txt
            activity_labels.txt

  Observations 
    - The Credits from the data, documents, etc are from
        Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human        Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational                 Intelligence    and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
  
## Purpose of exercise were divided in 5 steps:

Step 1 - Merges the training and the test sets to create one data set.
Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
Step 3 - Uses descriptive activity names to name the activities in the data set
Step 4 - Appropriately labels the data set with descriptive variable names. 
Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## The Programming R that contain this 5 steps is: run_analysis.R
This file run_analysis.R have the 5 steps necessaries to complete the activity with comments and in same cases how to check the tables, variables, etc.

## Created File: averages_data.txt
This file was created with the averages grouped by subject and activity



