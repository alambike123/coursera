#Getting and Cleaning Data - Course Project
##Version 1.0
==================================================================
Goals: 
The objective of this project was to 'tidy' a data set relating to Human 
Activity Recognition Using Smartphones. More specifically, given a data set broken
into multiple pieces, students were tasked with transforming the given pieces into a
single, cleaner data set, from which they were to derive a second, independent data 
set containing averages according to certain variable groupings.

==================================================================
Method:
The methodology for this project is encompassed entirely in the 'run_analysis.R' 
script, which contains steps that are indexed according to the list below:

1) loads the 'plyr' and 'reshape2' packages, which will be necessary later in the process

2) downloads relevant data from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

3) reads downloaded text files into memory as dataframes
* features.txt
* X_test.txt
* y_test.txt
* subject_test.txt
* X_train.txt
* y_train.txt
* subject_train.txt
* activity_labels.txt

4) transforms second column of 'features' dataframe into a vector to be used as header

5) binds the newly created features vector with training and test data sets to create
body of what is to be our 'final' dataframe

6) assigns top row of 'final' dataframe as header (remember the top row is the
features vector as a result of our bind function in step 5)

7) create temporary dataframes containing only variables associated with mean and
standard deviation data

8) create temporary dataframes containing the bound products of the subject and label
data imported in step 3

9) combine the temporary dataframes created in steps 8 and 9 to create new 'final'

10) for loop assigns all columns class numeric

11) create a secondary 'tidy' dataset containing average per variable in long data format

12) merge 'final' dataframe with 'activity_labels' dataframe, which serves as a key,
transforming number values into their associated activities (e.g. 1 becomes 'Walking')

13) rename variables for improved descriptiveness (variables explained in CodeBook.MD)

14) write 'tidy' dataset to working directory

==================================================================
Repository Index:
- 'README.MD': methodology and outline of relevant scripts and outputs
- 'CodeBook.MD': description of all variables produced by relevants scripts and the
transformations necessary to create them
- 'run_analysis.R': script that produces tidy data set according to outlines of this
project
- 'tidy.txt': data set produced by 'run_analysis.R'
