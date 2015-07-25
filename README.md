# README #
##Introduction##
This repository host the R code and documentation files for the Data Science's track course "Getting and Cleaning data", available in coursera.

The dataset being used can  be obtained from : [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

##** The Data**##
The data was collected from the accelerometers from the Samsung Galaxy S smartphone that carried out with a group of 30 volunteers

There are two set of measurements, training & test with 561 features of them. Both measurements grouped into 3 type of data set, named as X, y & subject data 

##** The Script**##
The script called **run_analysis** constructed to load the data from the website, and merge the test and training set together.

Labels were added after merged, and only columns with ‘mean’ and ‘standard deviation’ are kept

Lastly, a tidy set of data called **average_data** containing the means of all the columns per test subject and per activity were extracted and written to a tab-delimited file called average_data.txt

##** The CodeBook**##

The CodeBook.md file explains the transformations performed and the resulting data and variables.



