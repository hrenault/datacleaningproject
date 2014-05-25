## Coursera getting and cleaning data - peer project
## NB: X concerns the data, S the subject and Y the activities.

## Reading data from test files into dataframe
Ytest <- read.csv("./UCIHARdataset/test/Y_test.txt", header = FALSE)
Stest <- read.csv("./UCIHARdataset/test/subject_test.txt", header = FALSE)
Xtest <- read.csv("./UCIHARdataset/test/X_test.txt", header = FALSE, sep = "")

## Reading data from train files into dataframe
Ytrain <- read.csv("./UCIHARdataset/train/Y_train.txt", header = FALSE)
Strain <- read.csv("./UCIHARdataset/train/subject_train.txt", header = FALSE)
Xtrain <- read.csv("./UCIHARdataset/train/X_train.txt", header = FALSE, sep ="")

## merge(union) test and train in one dataset using rbind, for each file type  
Xmerged <- rbind(Xtest, Xtrain) 
Ymerged <- rbind(Ytest, Ytrain) 
Smerged <- rbind(Stest, Strain)

## Affect column names, from original features on X, hard names for Y and S  
## Reading column names common for test and train  files 
FileIn <- "./UCIHARdataset/features.txt"
col <- c("colCode", "colName")
Xcolnames <- read.csv(FileIn, header = FALSE, sep ="", col.names = col )

colnames(Xmerged) <- as.character(Xcolnames[,"colName"])
colnames(Ymerged) <- "activityCode"
colnames(Smerged) <- "subjectCode"

## select column corresponding to means or standard deviations
## and Extracts them to myX. 
mysub1 <- Xcolnames[grep("mean", Xcolnames$colName, ignore.case = TRUE), ]
mysub2 <- Xcolnames[grep("std", Xcolnames$colName, ignore.case = TRUE), ]
mysub <- rbind(mysub1, mysub2)
myX <- Xmerged[, mysub$colCode]

## rename column names to fit R naming conventions  and add them to my data
x <- as.character(mysub[,"colName"])
x <- gsub( "\\(", "", x, ) 
x <- gsub( "\\)", "", x, ) 
x <- gsub( "\\-", ".", x, ) 
colnames(myX) <- x

## Gather my selected data, activities and subject in one data frame
myData <- cbind(Smerged, Ymerged, myX)

## Uses descriptive activity names to name the activities in the data set

## read activity lables
FileIn <- "./UCIHARdataset/activity_labels.txt"
col <- c("activityCode", "activityName")
activities <- read.csv(FileIn, header = FALSE, sep = " ", col.names = col)

## merge activity labels in my Data set and save it to txt file
myDataActiv <- merge(myData, activities, by.x ="activityCode", by.y="activityCode")
fileOut <- "./TidyData.txt"
##write.csv(fileOut, append = FALSE, sep = ";")
write.csv(myDataActiv, file = fileOut)

## Creates a second, independent tidy data set with the average of each variable
## for each activity and each subject. 
aggdata <- aggregate( . ~ subjectCode + activityCode, data = myDataActiv , FUN = mean)
fileOut2 <- "./TidyDataAgg.txt"
write.csv(aggdata, file = fileOut2)
