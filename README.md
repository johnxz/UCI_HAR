Getting and Cleaning Data Course Project
========================================
  
Author: Xueqing Zhang (https://github.com/johnxz/UCI_HAR)
  
  
Assignment Notes
----------------

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.^[1]^  
  
A full description is available at the site where the data was obtained: 
  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
  
Here are the data for the project: 
  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
  
You should create one R script called run_analysis.R that does the following.  
    
>1. Merges the training and the test sets to create one data set.
>
>2. Extracts only the measurements on the mean and standard deviation for each measurement. 
>
>3. Uses descriptive activity names to name the activities in the data set
>
>4. Appropriately labels the data set with descriptive variable names. 
>
>5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


The repository contains the following files:
--------------------------------------------
  
>
- run_analysis.R
- reproduce.md
- Codebook.md
- output_Codebook.md
- the_average_activities_per_subject.txt

The "run_analysis.R" file contains the R code to achieve all assigned jobs of getting and cleaning data, and producing tidy data file "the_average_activities_per_subject.txt"; The "codebook.md" file describes the resulted tidy dataset, including the variables, the data structure, and any transformations or work that you performed to clean up the data; the "reroduce.md"" embeds the bulk of the code from "run_analysis.R" and would reproduce both "Codebood.md" (by utilizing "knitr" to call "output_Codebook.RMD", which embeded needed code) and "the_average_activities_per_subject.txt".
  
>
********
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012




