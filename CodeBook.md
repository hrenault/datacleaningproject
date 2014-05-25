## Introduction

This assignment uses data collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained: 
the <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"> UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning datasets.
The dataset for this project was available : 
* <b>Dataset</b> <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">project files </a> [61Mb]
* <b>Description</b>: The dataset includes the following files:
	- 'README.txt'
	- 'features_info.txt': Shows information about the variables used on the feature vector.
	- 'features.txt': List of all features.
	- 'activity_labels.txt': Links the class labels with their activity name.
	- 'train/X_train.txt': Training set.
	- 'train/y_train.txt': Training labels.
	- 'test/X_test.txt': Test set.
	- 'test/y_test.txt': Test labels.

the source data are split in test and train data with same format. The X_test.txt contains the dataset with 561 columns and 2947 rows. 
The columns labels are stored features.txt. 
Each row corresponds to one observation, for one subject identified via the subject ID stored in the subject_test.txt file, 
and one activity stored via its code in the Y_test.txt.The activity labels are given in the activity_labels.txt.
The same logic applies to the train files with 7352 rows.

## The run_analysis.R programm does the following transformations
* Read and merge the training and tests data sets
	* Reading data from the test files into a dataframe: the apply to all three test files X, Y and subject
	* Reading data from train files into dataframe
	* Merge(union) test and train in one dataset using rbind: apply this for each file type  
* Extract only measurementts on the mean and standard deviation
	* Affect column names, from original features on X, hard names for Y and S  
	* select columns corresponding to means or standard deviations via grep on column names
	* Use this selection to filter the X data frame with only mean and sd variables 
	* Rename the filtered X column names to fit R naming conventions and add them to my data
* Use descriptive activity names to name the activityes in the data set 
	* Merge (rbind) my selected data, activities and subject in one data frame
	* Read activity lables
* Appropriately lables the data set with descriptive activity names
	* Merge activity labels in my Data set 
	* save it to txt file : TidyData.txt
* Creates a second, independent tidy data set with the average of each variable
	* use aggregate function to average values by subject and activity 
	* save it to txt file : TidyDataAgg.txt


## TidyData.txt
### Data Set information
the TidyData contains 10299 rows corresponding to the complete set of rows given by the test and train dataset of the UCI original files.

### Variable description
It contains 89 columns with
* activityCode & activityName : identify and describe the 6 possibles activities of the subjects
* subjectCode identifies each subject by an integer
* other 86 columns are numeric data collected by the sensors. The column names are based on the original names reformated to fit R programming standards
	* For example, "tBodyAcc.mean.X"  correspond to the original "tBodyAcc-mean()-X
2" feature
	* All original features are given in the feature.txt file and explanations in the the feature_info.txt 
For more detail, cf. data source site: <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">

### TidyDataAgg.txt
### Data Set information
the TidyDataAgg is obtained by agregation of the previous tidy data set by subjectCode and activityCode.
It contains 180 rows corresponding to the occurences of different subject and activities
The values for each feature and for each row is the mean of the values for that column in the data set.

### Variable description
It contains the same 89 columns as the tidy data set. 



