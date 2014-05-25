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
the data are split in test and train data with same format. The X_test.txt contains the dataset with 561 columns and 2947 rows. 
The columns labels are stored features.txt. 
Each row corresponds to one observation, for one subject identified via the subject ID stored in the subject_test.txt file, 
and one activity stored via its code in the Y_test.txt.The activity labels are given in the activity_labels.txt.
The same logic applies to the train files with 7352 rows.


## The run_analysis.R programm 
The run_analysis.R script does the following:
<ol>
<li> Merges the training and the test sets to create one data set    </li>
<li> Extracts only the measurements on the mean and standard deviation for each measurement.   </li>
<li> Uses descriptive activity names to name the activities in the data set   </li>
<li> Appropriately labels the data set with descriptive activity names.     </li>
<li> Creates a second, independent tidy data set with the average of each variable for each activity and each subject.    </li>
</ol>


## Prerequisite 
The run_analysis.R program uses data stored in a subdirectory named UCIHARdataset 
which contains the source data with the same structure as given by the UCI zipfile.

## resulting Data set
When running run_analysis.R, two data sets are produced and stored in files : 

*<li> <b>TidyData.txt</b> contains the tidy detailed data set </li>  
*<li> <b>TidyDataAgg.txt</b> contains the agreggated averaged data by subject and activity </li>   

The description of variables and dataset are in the CodeBook stored in this repo


