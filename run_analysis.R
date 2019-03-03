
setwd("~/coursera_Getting_and_Cleaning_data/UCI HAR Dataset")

activity_labels <- read.table(file = "activity_labels.txt")

colnames(activity_labels) <- c("activity_labels" , "activity_name")

activity_labels$activity_name <- as.character(activity_labels$activity_name)

features <- read.table(file = "features.txt")

#########################################

setwd("~/coursera_Getting_and_Cleaning_data/UCI HAR Dataset/train")

subject_train <- read.table(file = "subject_train.txt")

colnames(subject_train) <- "subject"

X_train <- read.table(file = "X_train.txt")

colnames(X_train) <- features$V2

y_train <- read.table(file = "y_train.txt")

colnames(y_train) <- "activity_labels"


#################################

setwd("~/coursera_Getting_and_Cleaning_data/UCI HAR Dataset/test")

subject_test <- read.table(file = "subject_test.txt")

colnames(subject_test) <- "subject"

X_test <- read.table(file = "X_test.txt")

colnames(X_test) <- features$V2

y_test <- read.table(file = "y_test.txt")

colnames(y_test) <- "activity_labels"


#########################

train <- cbind(subject_train , y_train , X_train )

test <- cbind(subject_test , y_test , X_test )

dataset <- rbind(train , test)

##########################

important_features <- union ( grep(pattern = "mean" , colnames(dataset)) , grep(pattern = "std" , colnames(dataset)))

important_features <- union( c(1,2) , important_features )

dataset <- dataset[, important_features]

##########################

dataset$activity_labels[dataset$activity_labels == 1] <- activity_labels[activity_labels$activity_labels == 1,"activity_name"] 

dataset$activity_labels[dataset$activity_labels == 2] <- activity_labels[activity_labels$activity_labels == 2,"activity_name"] 

dataset$activity_labels[dataset$activity_labels == 3] <- activity_labels[activity_labels$activity_labels == 3,"activity_name"] 

dataset$activity_labels[dataset$activity_labels == 4] <- activity_labels[activity_labels$activity_labels == 4,"activity_name"] 

dataset$activity_labels[dataset$activity_labels == 5] <- activity_labels[activity_labels$activity_labels == 5,"activity_name"] 

dataset$activity_labels[dataset$activity_labels == 6] <- activity_labels[activity_labels$activity_labels == 6,"activity_name"] 


#########################

library(dplyr)

tidy_dataset <- as.data.frame(dataset %>% group_by(subject , activity_labels ) %>% summarise_all(mean))

#########################

setwd("~/coursera_Getting_and_Cleaning_data/UCI HAR Dataset")

write.table(x = tidy_dataset , file = "tidy_dataset.txt" , row.names = FALSE)

