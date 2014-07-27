Getting and Cleaning Data (Coursera). Course Project Codebook
==============================================================


## Original Data

There original data comes from the Samsung Galaxy smartphone accelerometer and gyroscope raw signals. These signals have been processed using various techniques to generate 561 measures. The original experiment was ran on different subjects while they performed six different activities. The original work can be found at 

###Source
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Study Design
This project is concerned with obtaining the averages of Std and Mean measures by each of the Activities and Test Subjects.

All the measures that are a Mean or a Std. Deviation are extracted by the script, combined with the subjects, and with the descriptive activity names. The resulting dataset is iterated over each subject and each activity to provide an average of each of the Mean and Std Deviation measures.

### Tidy data set

Tidy data set contains the average of all feature standard deviation and mean values from the original data. 

Std() and Mean() measures were extracted, and the mean of its values by subject and activity was calculated. Each variable was renamedusing the following conventions, in order to provide more distinct and readable names:

 1. Replaced `-mean` with `Mean`
 2. Replaced `-std` with `Std`
 3. Removed parenthesis `-()`

There is a single row for each Subject and Activity combination. Files with raw data contained the data by activity id. The tidy dataset includes the activity name to make it easier to read.

The following characteristics of tidy data were observed in the development of this script:

1) Each measure is in one column
2) Each observation is in a different row
3) Data is saved in a single file because it’s a single table


#### Sample of renamed variables compared to original variable name

 Raw data            | Tidy data 
 --------------------|--------------
 `subject`           | `Subject`
 `label`             | `Activity`
 `tBodyAcc-mean()-X` | `tBodyAccMeanX`
 `tBodyAcc-mean()-Y` | `tBodyAccMeanY`
 `tBodyAcc-mean()-Z` | `tBodyAccMeanZ`
 `tBodyAcc-std()-X`  | `tBodyAccStdX`
 `tBodyAcc-std()-Y`  | `tBodyAccStdY`
 `tBodyAcc-std()-Z`  | `tBodyAccStdZ`
