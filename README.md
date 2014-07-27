GettingAndCleaningDataProject
=============================

Project for the Getting and Cleaning Data course

Description
------------
This repository provides the run_analysis.R file that can be used to obtain the averages of the Mean and Std. Deviation measures of the original Samsung data set. It also provides a sample of the output file (tidy.txt)

Prerrequisites
-----------
The Samsung data must exist in its original zip file (UCI HAR Dataset.zip) in R's working directory.

Instructions
-------------
Run the dataset using the Rscript or the source commands. The output should be a tidy data set in a text file that contains Subject, Activity and the average of each mean and std deviation measure for each subject and activity combination.

Example
-------------
source('run_analysis.r'). The "tidy.txt" file should be generated after the script finishes executing.

How the Script works
--------------
1) Unzips the original data to a new "data" folder
2) Extracts the Train and Test datasets and merges them into a single dataset
3) Extracts the Mean and Std Deviation measures
4) Ensures variables and activities are descriptive
5) Creates a final tidy dataset by iterating through Subjects and Activities and creating an observation (row) for each combination of them with the average of each Mean and Std Deviation measure.
6) Writes the tidy dataset to tidy.txt
7) It would open a beer for you right afterward, but it can't, it's software.
