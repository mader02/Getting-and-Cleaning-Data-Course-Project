#load data, if not exist, download and unzip
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile<-"getdata-projectfiles-UCI HAR Dataset.zip"
if (!file.exists("UCI HAR Dataset")) {
        if(!file.exists(zipfile)) {
                ## Download the data file
                download.file(fileURL, destfile=zipfile)
        }
        ## Unzip the data file
        unzip(zipfile)
}

# Step 1
# Merge the training and test sets to create one data set
###############################################################################

#attachcing package dplyr & tidyr
library(dplyr)
library(tidyr)

#extract test files
test_set <- read.table("UCI HAR Dataset/test/X_test.txt")
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")

#extract training files
training_set <- read.table("UCI HAR Dataset/train/X_train.txt")
training_labels <- read.table("UCI HAR Dataset/train/y_train.txt")
training_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")

#merge files
data_set <- bind_rows(test_set,training_set)
data_labels <- bind_rows(test_labels,training_labels)
subject<- bind_rows(test_subject,training_subject)


# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement
###############################################################################

features <- read.table("UCI HAR Dataset/features.txt")

# get columns with mean() or std() in their names
mean_and_std <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
data_set <- data_set[, mean_and_std]

# add label
names(data_set) <- features[mean_and_std, 2]


# Step 3
# Use descriptive activity names to name the activities in the data set
###############################################################################

activities <- read.table("UCI HAR Dataset/activity_labels.txt")

# update values with correct activity names & subset the desired column
data_labels<-data_labels %>% inner_join(activities) %>% select(V2)

# add column name
names(data_labels) <- "activity"


# Step 4
# Appropriately label the data set with descriptive variable names
###############################################################################

# add column name to subject file
names(subject) <- "subject"

# bind all the data in a single data set
all_data<- cbind(data_set,data_labels,subject)


# Step 5
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
###############################################################################

## subset the desired data
average_data<- all_data %>% group_by(subject,activity) %>% summarise_each(funs(mean))

## convert to text file
write.table(average_data, "average_data.txt", row.name=FALSE)

