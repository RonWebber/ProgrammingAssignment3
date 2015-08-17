---
title: "CodeBook.md"
author: "RonWebber"
date: "August 13, 2015"
output: html_document
---
# Code book for "Getting and Cleaning Data" Project

The names of the variables (columns) in the output file, 'tidy.data.set.txt', are
combinations of words and abbreviations of words.  Each row of variables is for a
single subject (a person) performing a single activity. (There are 30subjects and 6 activities, so 'tidy.data.set' has 30 times 6 equals 180 rows.) The number of variables (columns) selected for 'tidy.data.set' is 68. In the first column is the subject identifier (an integer between 1 and 30), in the second is the name of an activity ('lying down', 'sitting', 'standing', 'walking', 'walking down stairs', or 'walking up stairs'). In the original data set, named 'Dataset', each subject-activity-variable combination had an associated time series of measurements or series of Fourier coefficients computed from the time series. In addition, each subject performed each activity many times (on different days?). In the output data set, 'tidy.data.set.txt', the mean of the time series or mean of the Fourier series for a subject-activity-variable combination replaces the original data as a summary statistic.  

Of the 561 column variables in the original data set, only 66 are included in the output data set. The selected variables contain either 'mean' or 'std' in their name. Each column name for columns 3 through 68 consist of terms or abbreviations of terms explained in detail in the experimenters' documents 'README.txt' and 'features_info.txt'. These documents are included in the project repository containing this code book. I do not have enough 
iformation to know the meaning of variables that include the term 'BodyBody'. Thus
I did not exclude those variables from 'tidy.data.set'.

Briefly, a name begins with either a 't' or an 'f'. A 't' means that the
variable is a function of a time series. An 'f' means that it is a function 
of the Fourier series coefficients of a time series. All the time series
measurements and Fourier series coefficients were normalized by dividing each 
term in a time series or Fourier series by 'max(series terms) - min(series terms)'. Thus all normalized measurements of means are between -1 and 1, and 
all normalized measurements of standard deviations are between 0 and 1. The normalization of the variables makes them dimensionless. The meanings of the
other parts of the names are in the following table.   

Name Part|Meaning of the variable with the name part included in name
---------|-------------------------------------------------------------------  
't'      |time series measurement
'f'      |Fourier series measurement
'Body'   |measurement of high-frequency (> 0.3 Hz) motion of a subject
'Gravity'|measurement of low-frequency (<= 0.3 Hz) motion of a subject
'Acc'    |accelerometer measurement along one of three axes
'Gyro'   |gyrometer measurement around one of three axes
'X'      |subject's front-rear axis
'Y'      |subject's right-left axis
'Z'      |subject's up-down axis
'Jerk'   |derivative of an 'Acc' measurement or a 'Gyro' measurement 
'Mag'    |magnitude of the vector sum of three axial measurements 
'mean'   |mean of a time series or Fourier series
'std'    |standard deviation of a time series or Fourier series

  
The following are the column names of 'tidy.data.set.txt'.  

1. "subject"
2. "activity"
3. "tBodyAcc.mean.X"   
4. "tGravityAcc.mean.X"
5. "tBodyAccJerk.mean.X"
6. "tBodyGyro.mean.X"
7. "tBodyGyroJerk.mean.X"
8. "fBodyAcc.mean.X"
9. "fBodyAccJerk.mean.X"
10. "fBodyGyro.mean.X"
11. "tBodyAcc.mean.Y"
12. "tGravityAcc.mean.Y"
13. "tBodyAccJerk.mean.Y"
14. "tBodyGyro.mean.Y"
15. "tBodyGyroJerk.mean.Y"
16. "fBodyAcc.mean.Y"
17. "fBodyAccJerk.mean.Y"
18. "fBodyGyro.mean.Y"
19. "tBodyAcc.mean.Z"
20. "tGravityAcc.mean.Z"
21. "tBodyAccJerk.mean.Z"
22. "tBodyGyro.mean.Z"
23. "tBodyGyroJerk.mean.Z"
24. "fBodyAcc.mean.Z"
25. "fBodyAccJerk.mean.Z"
26. "fBodyGyro.mean.Z"
27. "tBodyAcc.std.X"
28. "tGravityAcc.std.X"
29. "tBodyAccJerk.std.X"
30. "tBodyGyro.std.X"
31. "tBodyGyroJerk.std.X"
32. "fBodyAcc.std.X"
33. "fBodyAccJerk.std.X"
34. "fBodyGyro.std.X"
35. "tBodyAcc.std.Y"
36. "tGravityAcc.std.Y"
37. "tBodyAccJerk.std.Y"
38. "tBodyGyro.std.Y"
39. "tBodyGyroJerk.std.Y"
40. "fBodyAcc.std.Y"
41. "fBodyAccJerk.std.Y"
42. "fBodyGyro.std.Y"
43. "tBodyAcc.std.Z"
44. "tGravityAcc.std.Z"
45. "tBodyAccJerk.std.Z"
46. "tBodyGyro.std.Z"
47. "tBodyGyroJerk.std.Z"
48. "fBodyAcc.std.Z"
49. "fBodyAccJerk.std.Z"
50. "fBodyGyro.std.Z"
51. "tBodyAccMag.mean"
52. "tGravityAccMag.mean"
53. "tBodyAccJerkMag.mean"
54. "tBodyGyroMag.mean"
55. "tBodyGyroJerkMag.mean"
56. "fBodyAccMag.mean"
57. "fBodyBodyAccJerkMag.mean"
58. "fBodyBodyGyroMag.mean"
59. "fBodyBodyGyroJerkMag.mean"
60. "tBodyAccMag.std"
61. "tGravityAccMag.std"
62. "tBodyAccJerkMag.std"
63. "tBodyGyroMag.std"         
64. "tBodyGyroJerkMag.std"
65. "fBodyAccMag.std"
66. "fBodyBodyAccJerkMag.std"
67. "fBodyBodyGyroMag.std"
68. "fBodyBodyGyroJerkMag.std"
