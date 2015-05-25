# Download data 
if(TRUE)
setwd(".")
temp <- tempfile()
setInternet2(TRUE)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,temp)
unzip(temp) 
unlink(temp)

# Read the needed data files
UHD="UCI\ HAR\ Dataset"
list.files(UHD, recursive = TRUE)
#
x_train <- read.table(file=file.path(UHD,"train/X_train.txt"))
y_train <- read.table(file=file.path(UHD,"train/y_train.txt"))
subject_train <- read.table(file=file.path(UHD,"train/subject_train.txt"))
# 
x_test <- read.table(file=file.path(UHD,"test/X_test.txt"), sep="")
y_test <- read.table(file=file.path(UHD,"test/y_test.txt"), sep="")
subject_test <- read.table(file=file.path(UHD,"test/subject_test.txt")) 
# 
variable_names <- read.table(file=file.path(UHD,"features.txt")) 
# 
activity_names <- read.table(file=file.path(UHD,"activity_labels.txt")) 

# Assigned STEP1: Merge test and train data 
library(dplyr)
dat_df <- bind_rows(x_train,x_test)

# Assigned STEP2: Extracts only the measurements on the mean and standard deviation for each measurement
ms_col <- 
  variable_names %>%
  mutate(ms_col=paste0("V",V1)) %>%
  filter(grepl("mean|std",V2))
#
MS_col <- dput(as.character(ms_col$ms_col))
#  
MeanSD <-
  dat_df %>%
  select(one_of(MS_col))

# Assigned STEP3: Uses descriptive activity names to name the activities in the data set
labels_df <- bind_rows(y_train,y_test) 
labeledMeanSD <- 
  labels_df %>%
  inner_join(activity_names,by=c("V1"="V1")) %>%
  select(-V1) %>%
  rename(activity=V2) %>%
  bind_cols(MeanSD)
  
# Assigned STEP4: Appropriately labels the data set with descriptive variable names
descriptive_variable_names <- dput(as.character(ms_col$V2))
colnames(labeledMeanSD)[2:ncol(labeledMeanSD)] <- descriptive_variable_names

# Assigned STEP5: Make independent tidy data set with the average of each variable for each activity and each subject.
subject_df <- 
  bind_rows(subject_train,subject_test)  %>%
  rename(subject=V1)
#
named_labeledMeanSD <- bind_cols(subject_df,labeledMeanSD)
#
library(tidyr)
tidy_data <- 
  named_labeledMeanSD %>%
  group_by(subject,activity) %>%
  summarise_each(funs(mean)) %>%
  gather(variable, average, -subject,-activity)
  

# Write the tidy dataset created in step 5 as a txt file 
write.table(tidy_data,file="the_average_activities_per_subject.txt",sep="\t",row.name=FALSE)


