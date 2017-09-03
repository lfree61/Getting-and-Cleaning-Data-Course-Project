#Getting and Cleaning Data Course Project

#set your wd
# setwd("yourfilepathhere")

#load required packages
require(reshape2)

################################################################
# 1. Merge the training and test datasets to create one dataset#
################################################################

#Load datasets needed:
features <- read.table("~/features.txt", stringsAsFactors = F)
activity_labels <- read.table("~/activity_labels.txt", stringsAsFactors = F)

subject_test <- read.table("~/test/subject_test.txt", stringsAsFactors = F)
X_test <- read.table("~/test/X_test.txt", stringsAsFactors = F)
Y_test <- read.table("~/test/y_test.txt", stringsAsFactors = F)

subject_train <- read.table("~/train/subject_train.txt", stringsAsFactors = F)
X_train <- read.table("~/train/X_train.txt", stringsAsFactors = F)
y_train <- read.table("~/train/y_train.txt", stringsAsFactors = F)

#Merge the appropriate datasets together & then into one final dataset
dat <- rbind(X_test, X_train)
colnames(dat) <- features[, 2]

subject <- rbind(subject_test, subject_train)
colnames(subject) <- "Subject"

activity <- rbind(y_test, y_train)
activity <- merge(activity, activity_labels, by=1)[,2]

# create one merged table
df <- cbind(subject, activity, dat)

#####################################################################
# 2-4. Extract only measurement on mean and std for each measurement#
# and use descriptive activity names & label data appropriately.    #
#####################################################################
search <- grep("-mean|-std", colnames(df))
mean.std <- df[,c(1,2,search)]

# Create output for first tidy dataset
write.csv(mean.std, "tidy_data1.csv")

#################################################################
# 3-5. Create a second dataset with the average of each variable#
# for each activity and each subject. Use descriptive activity  #
# names & label data appropriately.                             #
#################################################################
# Compute the average of each variable by subject/activity
meltdf <- melt(mean.std, id.var = c("Subject", "activity"))
avg <- dcast(meltdf , Subject + activity ~ variable, mean)

# Create output for second tidy dataset
write.csv(avg, "tidy_data2.csv")
