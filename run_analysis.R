#Unzip the file
unzip("UCI HAR Dataset.zip", exdir="data")

#1. Merge train and test data into one dataset
# read train
train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
trainActLabels <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
trainSubjects <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
#read test
test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
testActLabels <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
testSubjects <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
#create joint datasets
jointData <- rbind(train,test)
jointLabels <- rbind(trainActLabels, testActLabels)
jointSubjects <- rbind(testSubjects,trainSubjects)

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
featureList <- read.table("./data/UCI HAR Dataset/features.txt")
desiredI <- grep("mean\\()|std\\()",featureList[,2])
jointData <- jointData[,desiredI]

#3 Descriptive activity names
activityList <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
activityList$V2 <- gsub("_", ".", activityList$V2)
activityLabels <- activityList[jointLabels[,1],2]
#Switch activity ID for actual activity
jointLabels[,1] <- activityLabels


#4 Label data set variables
names(jointSubjects) <- "Subject"
names(jointLabels) <- "Activity"
#For data, capitalize, remove parenthesis and other chars
names(jointData) <- gsub("\\(\\)", "", featureList[desiredI, 2])
names(jointData) <- gsub("mean", "Mean", names(jointData)) 
names(jointData) <- gsub("std", "Std", names(jointData)) 
names(jointData) <- gsub("-", "", names(jointData))
#Create merged dataset
dataset <- cbind(jointSubjects, jointLabels, jointData)


#5 Create final dataset with averages
numrows <- length(table(jointSubjects))*dim(activityList)[1]
numcols <- dim(dataset)[2]
result <- data.frame(matrix(NA, nrow=numrows, ncol=numcols))
colnames(result) <- colnames(dataset)
row <- 1
for(i in 1:length(table(jointSubjects))) {
  for(j in 1:dim(activityList)[1]) {
    result[row, 1] <- sort(unique(jointSubjects)[, 1])[i]
    result[row, 2] <- activity[j, 2]
    boolSubject <- i == dataset$Subject
    boolActivity <- activityList[j, 2] == dataset$Activity
    result[row, 3:numcols] <- colMeans(dataset[boolSubject&boolActivity, 3:numcols])
    row <- row + 1
  }
}
write.table(result, "tidy.txt") 

