# R script = 'run_analysis.R' 

if(! ('RCurl' %in% rownames(installed.packages()))){
  install.packages('RCurl')
}
library(RCurl)
if(! ('dplyr' %in% rownames(installed.packages()))){
  install.packages('dplyr')
}
library(dplyr)

# Download the data in 'Dataset.zip', and unzip the package.

url <- 
  'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(url, destfile = './Dataset.zip', method ='libcurl')
date.data.downloaded <- date()
unzip(zipfile = './Dataset.zip', exdir = './')

# Read seven text and data files into seven data frames.

features <- read.table(file = './UCI HAR Dataset/features.txt',
                       stringsAsFactors = FALSE)
X.test <- read.table(file = './UCI HAR Dataset/test/X_test.txt')
X.train <- read.table(file = './UCI HAR Dataset/train/X_train.txt')
y.test <- read.table(file = './UCI HAR Dataset/test/y_test.txt')
y.train <- read.table(file = './UCI HAR Dataset/train/y_train.txt')
subject.test <- read.table(file = './UCI HAR Dataset/test/subject_test.txt')
subject.train <- read.table(file ='./UCI HAR Dataset/train/subject_train.txt')

# Step 1: "Merge the training and test sets to create one data set."

X <- bind_rows(X.train, X.test)
colnames(X) <-as.vector(features[, 2])
X <- X[, ! duplicated(colnames(X))]
subject <- bind_rows(subject.train, subject.test)
colnames(subject)<-'subject'
activity <- bind_rows(y.train, y.test)
colnames(activity) <- 'activity'

# Step 2: "Extract only the measurments on the mean and the standard deviation
# for each measurement."

# I assume that the mean and standard deviation features are those whose names 
# end in 'mean()-X', 'mean()-Y', 'mean()-Z', 'std()-X', 'std()-Y', 'std()-Z',
# 'mean()', or 'std()'.

patterns <- c('mean()-X', 'mean()-Y', 'mean()-Z', 'std()-X', 'std()-Y', 'std()-Z',
              'mean()', 'std()')
meanX <- grep(patterns[1], x = colnames(X), fixed = TRUE)
meanY <- grep(patterns[2], x = colnames(X), fixed = TRUE)
meanZ <- grep(patterns[3], x = colnames(X), fixed = TRUE)
stdX <- grep(patterns[4], x = colnames(X), fixed = TRUE)
stdY <- grep(patterns[5], x = colnames(X), fixed = TRUE)
stdZ <- grep(patterns[6], x = colnames(X), fixed = TRUE)
mn <- grep(patterns[7], x = colnames(X), fixed = TRUE)
std <- grep(patterns[8], x = colnames(X), fixed = TRUE)

# Remove from 'mn' and 'std' the names that are already in 'meanX' through 'stdZ'. 

mn <- setdiff(mn, union(union(meanX, meanY), meanZ)) 
std <- setdiff(std, union(union(stdX, stdY), stdZ))

# Select only the columns of 'X' that are in 'meanX', 'meanY', 'meanZ', sdtX,
# 'stdY', 'stdZ', 'mn', and 'std', and bind them with 'subject' and 'activity'.

data.set <- select(X, meanX, meanY, meanZ, stdX, stdY, stdZ, mn, std)
data.set <- bind_cols(list(subject, activity, data.set))

# Step 3: "Use descriptive activity names to name the activities in the dataset."

activity.names <- c('walking', 'walking up stairs', 'walking down stairs',
                    'sitting', 'standing', 'lying down')
for(i in 1:nrow(data.set)){
  data.set$activity[i] <- activity.names[as.integer(data.set$activity[i])]
}

# Step 4: "Appropriately lable the dataset with decriptive variable names." 

colnames(data.set) <-make.names(colnames(data.set))
colnames(data.set) <- gsub('\\.\\.', '', colnames(data.set))

# Step 5: "From the data set in step 4, create a second, independent tidy dataset
# with the average of each variable for each activity and each subject."

grouped.data.set <- group_by(data.set, subject, activity)
tidy.data.set <- summarise_each(grouped.data.set, funs(mean))
colnames(tidy.data.set) <- make.names(colnames(tidy.data.set))
colnames(tidy.data.set) <- gsub('\\.$', '', colnames(tidy.data.set))

write.table(tidy.data.set, file = './tidy.data.set.txt', row.names = FALSE)
