## You should create one R script called run_analysis.R that does the following. 

##########  run_analysis.R     ############

library(plyr)


# Descição dos dados: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# Dados do Projeto: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# set directories and files to work

# Criar diretorio Data na pasta de trabalho do quiz 
# in my machine the files are: G:\Users\familia\Documents\Luiz\Getting and Cleaning Data\Course Project\getdata-projectfiles-UCI HAR Dataset\UCI HAR Dataset

setwd("G:/Users/familia/Documents/Luiz/Getting and Cleaning Data/Course Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")
# check is correct
getwd()

# files were downloading and decompressed manually (getdata-projectfiles-UCI HAR Dataset.zip)


# from the zip file, read out the containing csv file
# It were created
#     directories:train
#                 test
#     files: README.txt
#            features_info.txt
#            features.txt
#            activity_labels.txt

#############################

## passo 1- Merges the training and the test sets to create one data set.

# first read the files are on directory train
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

# first read the files are on directory test
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")


# function rbind -> Combine R Objects by Rows or Columns
# create 'x' data set
x_data <- rbind(x_train, x_test)

# create 'y' data set
y_data <- rbind(y_train, y_test)

# create 'subject' data set
subject_data <- rbind(subject_train, subject_test)

#############################

## passo 2- Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("features.txt")

# There are lot of fetures. We have to get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
x_data <- x_data[, mean_and_std_features]

# correct the column names
names(x_data) <- features[mean_and_std_features, 2]

# print names(x_data) to check if it is correct - we need only mean and std 
# like this line:  [1] "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"           "tBodyAcc-mean()-Z" 
names (x_data)




#############################

## passo 3- Uses descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")

# put values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# set correct column name
names(y_data) <- "activity"

# to check if it is correct:  
head (y_data)
##activity
##1 STANDING
##2 STANDING
##3 STANDING
##4 STANDING
##5 STANDING
##6 STANDING
tail (y_data)
##activity
##10294 WALKING_UPSTAIRS
##10295 WALKING_UPSTAIRS
##10296 WALKING_UPSTAIRS
##10297 WALKING_UPSTAIRS
##10298 WALKING_UPSTAIRS
##10299 WALKING_UPSTAIRS

#############################

## passo 4- Appropriately labels the data set with descriptive variable names. 

# put column name
names(subject_data) <- "subject"

#Combining x_data, y_data and subject_data - Rows and Columns - all in only one object
all_data <- cbind(x_data, y_data, subject_data)

# to check if it is correct:  
ncol (all_data)
##[1] 68
head (all_data, n=1)
## 68 coluns like this:
##tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z tBodyAcc-std()-X tBodyAcc-std()-Y
##1         0.2885845       -0.02029417        -0.1329051       -0.9952786       -0.9831106
## the 2 last are: activity subject

nrow (all_data)
##[1] 10299
tail (all_data, n=1)
## the same before pointed line 10299

#############################

## passo 5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# we have 68 coluns, but value are in the 66 first coluns. The 2 finals coluns are activity subject that no have numbers
# Then we will have considerated 66 coluns to calculate the average
# we use function ddply ->Split data frame, apply function, and return results in a data frame
# considered subject and activity
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

## check if num col is 68 and num lines reduced
nrow (averages_data)
## [1] 180
ncol (averages_data)
## [1] 68
head (averages_data, n=1)
tail (averages_data, n=1)

# record the table from the object averages_data
write.table(averages_data, "averages_data.txt", row.name=FALSE)

#check if averages_data.txt was created - find file: averages_data.txt
dir ()

###### end ######
