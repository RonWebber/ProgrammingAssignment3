---
title: "ReadMe.md"
author: "RonWebber"
date: "August 12, 2015"
output: html_document
---
# ReadMe for Getting and Cleaning Data Course Project

### This ReadMe file contains the following:
* a statement of the project
* the goal of the project
* the assumptions on which the analysis is based
* a description of the run_analysis.R program
* how to run the program
* how to read the output file, 'tidy.data.set.txt'
* why the output file is a tidy data set

### Project Statement
The project obtains a data set of measurements and statistical summaries of an experiment to meaure the motions of human subjects performing several physical activities. The project requires extracting a specified set of variables from the data set. The means of the extracted variables for each subject and activity combination are computed. The means are assembled in a new data set for further processing. The new data set is configured as a tidy data set and written out.

### Project Goal
The goal is to select some of the variables that are the means and standard deviations of raw data in the input data set and compute means of the variables grouped by subject and activity, and arrange them in a tidy data set.

### Project Assumptions
The specifications for which variables to extract from the input data set in the project statement was not complete, so it was necessary to assume additional criteria for the variables. Only variables with names containing the substrings 'mean()-X', 'mean()-Y', 'mean()-Z', 'std()-X', 'std()-Y', 'std()-Z',
'mean()', or 'std()'. were extracted. Other variables whose names contained 'mean' or 'std' were excluded.

### Description of 'run_analysis.R'
The program runs in a working directory that the user has permission to read and write files. All downloaded files are written to the working directory, and the output file is written to the same working directory.

##### **Step 0**: Install required R packages and input data
The program ensures that the R packages 'RCurl' and 'dplyr' are available. It downloads and makes available 'Dataset', which contains the original data set. It then reads the files contained in 'Dataset' using 'read.table' since the files are text files.

##### **Step 1:** "Merge the training and test sets to create one data set."
The program uses 'bind_rows' from the 'dplyr' package to combine the training data and the test data for 'X', subject', and 'activity'. The columns names are in the 'features', 'subject', and 'activity' data sets. Duplicate colums in 'X' are removed.

##### **Step 2:** "Extract only the measurements on the mean and the standard deviation on each measurement."
The program defines a character vector, 'patterns', of substrings that the are contained in the names of the desired variables. Using 'grep', the program makes seven vectors of column numbers ('meanX', 'meanY', etc.). Using these column numbers and the 'select' verb of 'dplyr', the program creates a data frame called 'data.set, of dimension 10299 rows and 68 columns. Each subject-activity combination has several means and standard deviations, because each subject-activity combination performed the activity several times, such as on different days. (For each subject-activity combination, the program will compute the mean of the means and standard deviations for each subject-activity.)

##### **Step 3:** "Use descriptive activity names to name the activities in the data set."
The descriptive activity names I chose are 'lying down', 'sitting', 'standing',
'walking', 'walking up stairs', and 'walking down stairs'.

##### **Step 4:** "Appropriately label the dataset with descriptive names."
The program uses the R function 'make.names' to make syntactically acceptable names and the expression 'gsub('\\.\\.', '', colnames(data.set))' to remove double periiods from the variable names.

##### **Step 5:** "From the data set in Step 4, create a second, independant tidy data set with average of each variable for each activity and each subject."
Using the 'dplyr' verb 'group_by' to make each subject a group and then within each subject group six subgroups of activities. 'tidy.data.set' is created using the 'dplyr' verb 'summarise_each' to compute the mean of each activity subgroup of each subject group. Then the column names are refreshed by removing ending periods. The tidy data set is a wide data set with variables in columns and observations in rows.

### How to run the program
Go to a directory (also called a folder on Windows) where you have permisison to read and write files. Place the file 'run_analysis.R' in the directory. Start R  and issue the statement 'source(run_analysis.R)' at the R prompt.

### Reading the file 'tidy.data.set.txt'
The text file 'tidy.data.set.txt' is readable with 'read.table('tidy.data.set.txt', header = TRUE).

### The file 'tidy.data.set.txt' is a tidy data set
According to Hadley Wickham, in his article "Tidy Data" in the *Journal of Statistical Software*, a data table or data frame is a "collection of **values**, usually either numbers (if quantitative) or strings (if qualitative). Values are organized in two ways. Every value belongs to a **variable** and an **obsevation**. A variable contains all values that measure the same underlying attribute (like height, temperature, duration) across units. An observation contains all values measured on the same unit (like a person, or a day, or a race) across attributes."   
The data table or data frame is tidy if (1) each variable forms a column. (2) Each observation forms a row. (3) Each type of observation unit forms a table. Thus each column has exactly one value per observation; and each row has all the values for a single unit.  
In the case of 'tidy.data.set', the unit is a subject-activity combination. There are no duplicated units. Also, each column has a unique name and variable and contains one value for each unit.  
Thus 'tidy.data.set' is a tidy data set.
