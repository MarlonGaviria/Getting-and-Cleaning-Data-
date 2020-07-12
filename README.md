# Getting-and-Cleaning-Data-

# Description

The next files were used initialy:
- *README.txt* the description of the experiment and the data used

- *X_train.txt* include the measurements of the features in the train set (7352X561)

- *y_train.txt* include the measurements of the activities in the train set (7352x1)

- *X_test.txt* include the measurements of the features in the test set (2947x561)

- *y_test.txt* include the measurements of the activities in the test set (2947x1)

- *subject_train.txt/subject_test.txt* indicate the subject in train/test set (1-30)

# How This script work

- 1) Merges the training and test sets to create one data set from the X_train.txt,y_train.txt,
aubject_train.txt for make the data set **Train** & X_test.txt,y_test.txt,subject_test.txt for data set **Test**, and then merge them in **DataSet**

- 2) Extract only the mesurements in the mean and standard desviation for each measurement in **DataSet**.

- 3) Uses descriptive activity names to name the activities in the data set called **DataSet**.

- 4) Appropriately label the data with descriptive variable names.

- 5) Finally, create a second dataset, tidydata with the average of each variable for each activity and each subject.