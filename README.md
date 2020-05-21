# Gwetting-and-cleaning
coursera
#we import reshape package 
#and read and load all .csv file like x_test,x_train,y_test,y_train,subject_train &subject_test
# add column name for label files

#step 1 Merges the training and the test sets to create one data set

# Step 2 determine which columns contain "mean()" or "std()"

## STEP 3: Uses descriptive activity names to name the activities
## in the data set.
## STEP 4: Appropriately labels the data set with descriptive
## activity names. 

# convert the activity column from integer to factor

## STEP 5: Creates a second, independent tidy data set with the
## average of each variable for each activity and each subject.

# create the tidy data set using melt() and dcast()

# write the tidy data set to a file using write.csv for csv file and write.txt for text file


