

## Download and unzip the dataset: 

filename <- "getdata_projectfiles_UCI HAR Dataset.zip" 

if (!file.exists(filename)){ 
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip " 
  download.file(fileURL, filename, method="curl") 
}   
if (!file.exists("UCI HAR Dataset")) {  
  unzip(filename)  
} 


## Reading Activity labels and features

activity_labels <- read.table(file = "UCI HAR Dataset/activity_labels.txt")

colnames(activity_labels) <- c("activity_labels" , "activity_name")

activity_labels$activity_name <- as.character(activity_labels$activity_name)

features <- read.table(file = "UCI HAR Dataset/features.txt")


## Reading the training set

subject_train <- read.table(file = "UCI HAR Dataset/train/subject_train.txt")

colnames(subject_train) <- "subject"

X_train <- read.table(file = "UCI HAR Dataset/train/X_train.txt")

colnames(X_train) <- features$V2  # Step 4. Appropriately labels the data set with descriptive variable names.

y_train <- read.table(file = "UCI HAR Dataset/train/y_train.txt")

colnames(y_train) <- "activity_labels"


## Reading the test set

subject_test <- read.table(file = "UCI HAR Dataset/test/subject_test.txt")

colnames(subject_test) <- "subject"

X_test <- read.table(file = "UCI HAR Dataset/test/X_test.txt")

colnames(X_test) <- features$V2 # Step 4. Appropriately labels the data set with descriptive variable names.

y_test <- read.table(file = "UCI HAR Dataset/test/y_test.txt")

colnames(y_test) <- "activity_labels"


## Step 1.Merges the training and the test sets to create one data set.

train <- cbind(subject_train , y_train , X_train )

test <- cbind(subject_test , y_test , X_test )

dataset <- rbind(train , test)

## Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.

important_features <- union ( grep(pattern = "mean" , colnames(dataset)) , grep(pattern = "std" , colnames(dataset)))

important_features <- union( c(1,2) , important_features )

dataset <- dataset[, important_features]

## Step 3. Uses descriptive activity names to name the activities in the data set

dataset$activity_labels[dataset$activity_labels == 1] <- activity_labels[activity_labels$activity_labels == 1,"activity_name"] 

dataset$activity_labels[dataset$activity_labels == 2] <- activity_labels[activity_labels$activity_labels == 2,"activity_name"] 

dataset$activity_labels[dataset$activity_labels == 3] <- activity_labels[activity_labels$activity_labels == 3,"activity_name"] 

dataset$activity_labels[dataset$activity_labels == 4] <- activity_labels[activity_labels$activity_labels == 4,"activity_name"] 

dataset$activity_labels[dataset$activity_labels == 5] <- activity_labels[activity_labels$activity_labels == 5,"activity_name"] 

dataset$activity_labels[dataset$activity_labels == 6] <- activity_labels[activity_labels$activity_labels == 6,"activity_name"] 


## Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)

tidy_dataset <- as.data.frame(dataset %>% group_by(subject , activity_labels ) %>% summarise_all(mean))


## Save the tidy dataset

write.table(x = tidy_dataset , file = "UCI HAR Dataset/tidy_dataset.txt" , row.names = FALSE)

