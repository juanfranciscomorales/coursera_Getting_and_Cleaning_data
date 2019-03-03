
setwd("~/coursera_Getting_and_Cleaning_data/UCI HAR Dataset")

activity_labels <- read.table(file = "activity_labels.txt")

colnames(activity_labels) <- c("activity_labels" , "activity_name")

activity_labels$activity_name <- as.character(activity_labels$activity_name)

#########################################

setwd("~/coursera_Getting_and_Cleaning_data/UCI HAR Dataset/train")

subject_train <- read.table(file = "subject_train.txt")

colnames(subject_train) <- "subject"

X_train <- read.table(file = "X_train.txt")

colnames(X_train) <- paste("X_Var" ,1:ncol(X_train) , sep = "")

y_train <- read.table(file = "y_train.txt")

colnames(y_train) <- "activity_labels"

setwd("~/coursera_Getting_and_Cleaning_data/UCI HAR Dataset/train/Inertial Signals")

body_acc_x_train <- read.table(file = "body_acc_x_train.txt")

colnames(body_acc_x_train) <- paste("body_acc_x" , "_Var" , 1:ncol(body_acc_x_train) , sep = "" )

body_acc_y_train <- read.table(file = "body_acc_y_train.txt")

colnames(body_acc_y_train) <- paste("body_acc_y" , "_Var" , 1:ncol(body_acc_y_train) , sep = "" )

body_acc_z_train <- read.table(file = "body_acc_z_train.txt")

colnames(body_acc_z_train) <- paste("body_acc_z" , "_Var" , 1:ncol(body_acc_z_train) , sep = "" )

body_gyro_x_train <- read.table(file = "body_gyro_x_train.txt")

colnames(body_gyro_x_train) <- paste("body_gyro_x" , "_Var" , 1:ncol(body_gyro_x_train) , sep = "" )

body_gyro_y_train <- read.table(file = "body_gyro_y_train.txt")

colnames(body_gyro_y_train) <- paste("body_gyro_y" , "_Var" , 1:ncol(body_gyro_y_train) , sep = "" )

body_gyro_z_train <- read.table(file = "body_gyro_z_train.txt")

colnames(body_gyro_z_train) <- paste("body_gyro_z" , "_Var" , 1:ncol(body_gyro_z_train) , sep = "" )

total_acc_x_train <- read.table(file = "total_acc_x_train.txt")

colnames(total_acc_x_train) <- paste("total_acc_x" , "_Var" , 1:ncol(total_acc_x_train) , sep = "" )

total_acc_y_train <- read.table(file = "total_acc_y_train.txt")

colnames(total_acc_y_train) <- paste("total_acc_y" , "_Var" , 1:ncol(total_acc_y_train) , sep = "" )

total_acc_z_train <- read.table(file = "total_acc_z_train.txt")

colnames(total_acc_z_train) <- paste("total_acc_z" , "_Var" , 1:ncol(total_acc_z_train) , sep = "" )

#################################

setwd("~/coursera_Getting_and_Cleaning_data/UCI HAR Dataset/test")

subject_test <- read.table(file = "subject_test.txt")

colnames(subject_test) <- "subject"

X_test <- read.table(file = "X_test.txt")

colnames(X_test) <- paste("X_Var" ,1:ncol(X_test) , sep = "")

y_test <- read.table(file = "y_test.txt")

colnames(y_test) <- "activity_labels"

setwd("~/coursera_Getting_and_Cleaning_data/UCI HAR Dataset/test/Inertial Signals")

body_acc_x_test <- read.table(file = "body_acc_x_test.txt")

colnames(body_acc_x_test) <- paste("body_acc_x" , "_Var" , 1:ncol(body_acc_x_test) , sep = "" )

body_acc_y_test <- read.table(file = "body_acc_y_test.txt")

colnames(body_acc_y_test) <- paste("body_acc_y" , "_Var" , 1:ncol(body_acc_y_test) , sep = "" )

body_acc_z_test <- read.table(file = "body_acc_z_test.txt")

colnames(body_acc_z_test) <- paste("body_acc_z" , "_Var" , 1:ncol(body_acc_z_test) , sep = "" )

body_gyro_x_test <- read.table(file = "body_gyro_x_test.txt")

colnames(body_gyro_x_test) <- paste("body_gyro_x" , "_Var" , 1:ncol(body_gyro_x_test) , sep = "" )

body_gyro_y_test <- read.table(file = "body_gyro_y_test.txt")

colnames(body_gyro_y_test) <- paste("body_gyro_y" , "_Var" , 1:ncol(body_gyro_y_test) , sep = "" )

body_gyro_z_test <- read.table(file = "body_gyro_z_test.txt")

colnames(body_gyro_z_test) <- paste("body_gyro_z" , "_Var" , 1:ncol(body_gyro_z_test) , sep = "" )

total_acc_x_test <- read.table(file = "total_acc_x_test.txt")

colnames(total_acc_x_test) <- paste("total_acc_x" , "_Var" , 1:ncol(total_acc_x_test) , sep = "" )

total_acc_y_test <- read.table(file = "total_acc_y_test.txt")

colnames(total_acc_y_test) <- paste("total_acc_y" , "_Var" , 1:ncol(total_acc_y_test) , sep = "" )

total_acc_z_test <- read.table(file = "total_acc_z_test.txt")

colnames(total_acc_z_test) <- paste("total_acc_z" , "_Var" , 1:ncol(total_acc_z_test) , sep = "" )


#########################

train <- cbind(subject_train , y_train , X_train , body_acc_x_train , body_acc_y_train , body_acc_z_train , body_gyro_x_train , body_gyro_y_train , body_gyro_z_train ,total_acc_x_train , total_acc_y_train , total_acc_z_train)

test <- cbind(subject_test , y_test , X_test , body_acc_x_test , body_acc_y_test , body_acc_z_test , body_gyro_x_test , body_gyro_y_test , body_gyro_z_test ,total_acc_x_test , total_acc_y_test , total_acc_z_test)

dataset <- rbind(train , test)

##########################

colmeans <- colMeans(x = dataset )

colsd <- apply( X =  dataset ,MARGIN =  2,FUN =  sd)

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

