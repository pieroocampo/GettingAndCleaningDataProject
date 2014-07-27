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
source('run_analysis.r')
<tidy.txt> should be generated after the script finishes executing.
