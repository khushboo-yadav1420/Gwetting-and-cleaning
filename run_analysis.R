library(reshape2)

sub_train <- read.table("C:/Users/Dell/Desktop/myproject/cleanig coursera project/UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("C:/Users/Dell/Desktop/myproject/cleanig coursera project/UCI HAR Dataset/train/x_train.txt")
y_train <- read.table("C:/Users/Dell/Desktop/myproject/cleanig coursera project/UCI HAR Dataset/train/y_train.txt")
sub_test <- read.table("C:/Users/Dell/Desktop/myproject/cleanig coursera project/UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("C:/Users/Dell/Desktop/myproject/cleanig coursera project/UCI HAR Dataset/test/x_test.txt")
y_test <- read.table("C:/Users/Dell/Desktop/myproject/cleanig coursera project/UCI HAR Dataset/test/y_test.txt")
View(sub_train)
View(x_train)
View(y_train)
View(sub_test)
View(x_test)
View(y_test)
names(sub_train) <- "subjectID"
names(sub_test) <- "subjectID"
features <- read.table("C:/Users/Dell/Desktop/myproject/cleanig coursera project/UCI HAR Dataset/features.txt")
View(features)

names(x_train) <- features$V2
names(x_test) <- features$V2

# add column name for label files
names(y_train) <- "activity"
names(y_test) <- "activity"
#step 1 Merges the training and the test sets to create one data set
train <- cbind(sub_train, y_train, x_train)
test <- cbind(sub_test, y_test, x_test)
combined <- rbind(train, test)
View(combined)
# Step 2 determine which columns contain "mean()" or "std()"
meanstdcols <- grepl("mean\\(\\)", names(combined)) |
  grepl("std\\(\\)", names(combined))
View(meanstdcols)
meanstdcols[1:2] <- TRUE
combined1 <- combined[, meanstdcols]
View(combined1)

## STEP 3: Uses descriptive activity names to name the activities
## in the data set.
## STEP 4: Appropriately labels the data set with descriptive
## activity names. 

# convert the activity column from integer to factor
combined1$activity <- factor(combined1$activity, labels=c("Walking","Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

## STEP 5: Creates a second, independent tidy data set with the
## average of each variable for each activity and each subject.

# create the tidy data set
melted <- melt(combined1, id=c("subjectID","activity"))
tidy <- dcast(melted, subjectID+activity ~ variable, mean)
View(tidy)
# write the tidy data set to a file
write.csv(tidy, "tidy.csv", row.names=FALSE)

write.table(tidy, "tidy.txt", row.names=FALSE)

