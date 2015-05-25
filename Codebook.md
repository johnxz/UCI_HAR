Produce the 'Codebook.md'
========================


Mainly utilize 'dplyr' functions to make and clean-up the dataset:
>
- Use 'bindrows(train,test)' functions to combine the subject, activity measures and labels data of test and train sets
- Use 'filter(grepl("mean|std",))' function to extract variables_names of mean and standard deviation measurements for activities; then 'select' the mean and std colume of activity measurments from the test and train combined dataset 
- To name the activities in the merged dataset using descriptive activity names : Use 'join' function to label the combined activity label dataset(Y) by match the descriptive names in the "activity_labels.txt" file, then bind the column of names to the extracted mean and std dataset and name it as new viriable 'activity'.
- Appropriately labels the data set with descriptive variable names: don't know how to use dplyr functions to do it, have to use base function dput() and colnames() to rename all activity measurement columns with descriptive activity variable names (see below the prinout of resulted dataset). 
- Make independent tidy data set with the average of each variable for each activity and each subject: use 'bind" train and test subject rows and then bind the combined subject column with labeled mean and std dataset, name it as new viriable 'subject'; calculate average of all mean and std variales for each activity and each subject by 'group_by' and 'summarize', then use 'gather' function of 'tidyr' package to gather  all averages of mean  and std and collapse into the new key column 'variable' and the new value column 'average'.


Tidy Dataset structure
-----------------


```r
str(tidy_data)
```

```
## Classes 'tbl_df', 'tbl' and 'data.frame':	14220 obs. of  4 variables:
##  $ subject : int  1 1 1 1 1 1 2 2 2 2 ...
##  $ activity: Factor w/ 6 levels "LAYING","SITTING",..: 1 2 3 4 5 6 1 2 3 4 ...
##  $ variable: Factor w/ 79 levels "tBodyAcc-mean()-X",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ average : num  0.222 0.261 0.279 0.277 0.289 ...
```


Head of the tidy dataset
-------------------------


```r
head(tidy_data,n=12)
```

```
## Source: local data frame [12 x 4]
## 
##    subject           activity          variable   average
## 1        1             LAYING tBodyAcc-mean()-X 0.2215982
## 2        1            SITTING tBodyAcc-mean()-X 0.2612376
## 3        1           STANDING tBodyAcc-mean()-X 0.2789176
## 4        1            WALKING tBodyAcc-mean()-X 0.2773308
## 5        1 WALKING_DOWNSTAIRS tBodyAcc-mean()-X 0.2891883
## 6        1   WALKING_UPSTAIRS tBodyAcc-mean()-X 0.2554617
## 7        2             LAYING tBodyAcc-mean()-X 0.2813734
## 8        2            SITTING tBodyAcc-mean()-X 0.2770874
## 9        2           STANDING tBodyAcc-mean()-X 0.2779115
## 10       2            WALKING tBodyAcc-mean()-X 0.2764266
## 11       2 WALKING_DOWNSTAIRS tBodyAcc-mean()-X 0.2776153
## 12       2   WALKING_UPSTAIRS tBodyAcc-mean()-X 0.2471648
```

Summary of variables in the tidy dataset
-----------------------------------------


```r
summary(tidy_data)
```

```
##     subject                   activity                 variable    
##  Min.   : 1.0   LAYING            :2370   tBodyAcc-mean()-X:  180  
##  1st Qu.: 8.0   SITTING           :2370   tBodyAcc-mean()-Y:  180  
##  Median :15.5   STANDING          :2370   tBodyAcc-mean()-Z:  180  
##  Mean   :15.5   WALKING           :2370   tBodyAcc-std()-X :  180  
##  3rd Qu.:23.0   WALKING_DOWNSTAIRS:2370   tBodyAcc-std()-Y :  180  
##  Max.   :30.0   WALKING_UPSTAIRS  :2370   tBodyAcc-std()-Z :  180  
##                                           (Other)          :13140  
##     average        
##  Min.   :-0.99767  
##  1st Qu.:-0.95242  
##  Median :-0.34232  
##  Mean   :-0.41241  
##  3rd Qu.:-0.03654  
##  Max.   : 0.97451  
## 
```

