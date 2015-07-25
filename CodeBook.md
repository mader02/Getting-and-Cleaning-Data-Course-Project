
#Code Book for Data Cleaning Project#
### mader02 ###
### 25th July 2015###

##The variables##
* `fileURL` : URL for the source of the data
* `zipfile` : data downloaded in zip format
* `test_set` : data that was obtained from X data from test data set
* `test_labels` : data that was obtained from Y data from test data set
* `test_subject` : data that was obtained from subject data from test data set
* `training_set` : data that was obtained from X data from train data set
* `training_labels` : data that was obtained from Y data from train data set
* `training_subject` : data that was obtained from X data from train data set
* `data_set` : merged data of _test_set_  data and _training_set_ data 
* `data_labels` : merged data of _test_labels_  data and _training_labels_ data 
* `subject` : merged data of _test_subject_  data and _training_subject_ data 
* `features` : represent features.txt file
* `mean_and_std` : data extracted from _features_ that have the feature name containing mean(), Mean(), std() or Std() 
* `activities` : represent activity_labels.txt file
* `all_data` : the combination of _data_set_  data , _data_labels_ data and _subject_ data
* `average_data` :  independent tidy data set with the average of each variable for each activity and each subject

##The Data##
### The Raw Data ###
The data was collected from the accelerometers from the Samsung Galaxy S smartphone that carried out with a group of 30 volunteers

The script was constructed to obtain the raw data from the website and perform data clean up activities to produce clean and tidy data set.

First and foremost , we need to verify whether data exist or not. If file not exist, download and unzip it into appropriate directory

### Data Type ###
Once we got the data files, they should be loaded into data frame

* Data Description:
The features and labels represent the description for both testing & training data

* Testing Data:
consists of subject, x  and y data.
* Training Data:
consists of subject, x  and y data.

##The Script##
The script **run_analysis.R** performs the 5 steps described in the course project's definition.
### Step 1 ###
_Instruction 1: Merges the training and the test sets to create one data set._ 

The testing & training data was dowloaded and extracted using `read.table()` function. Then the data were combined using `bind_rows()` function.
### Step 2###
_Instruction 2: Extracts only the measurements on the mean and standard deviation for each measurement._

The combined data was then extracted base on measurements that consist the mean and standard deviation within few steps. 

Firstly get columns with mean() or std() in their names from the features file using `grep()` function, assign the result to variable named `mean_and_std` . 

After that, subset the desired columns from `data_set` with the variable `mean_and_std`. Add label to the `data_set` data using `name()` function
### Step 3 ###
_Instruction 3. Uses descriptive activity names to name the activities in the data set_

Here we use the `inner_join()` function to combine the `data_labels`
 ### Step 4 ###
_Instruction 4_. Appropriately label the data set with descriptive variable names

Here, we  add column name to subject file and bind all the data in a single data set
 ### Step 5 ###
_Instruction 5_.  Create a second, independent tidy data set with the average of each variable for each activity and each subject

The finish data was then grouped and summarized using `group_by()` and `summarise_each()` function to get a tidy data set with the average of each variable for each activity and each subject.

The final data named as `average_data`
