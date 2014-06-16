README.md
=========

This repository contains the following files:
 - **README.md** - explains how all the files work and how they are connected
 - **CodeBook.md** - code book that describes the variables, data, and tranformations
 - **run_analysis.R** - main R script that performs assignment tasks

README.md
--
You are reading this file.  Explains how all the files work and how they are connected.

CodeBook.md
--
This file describes the variables, the data, and any transformations or work performed to clean up the data.

run_analysis.R
--
This is the main R script that performs the following assignment tasks.  For each step outlined below, there is an accompaning function created.  For example, for step 1 "Merges the training and test sets..." is executed in the **step1** function within this script file.  Then each function is called at the end of the script, and system.time() is used to monitor the performance of each step.  For a complete step-by-step summary, please review the comments within actual **run_analysis.R** file:
 0. Merges the training and the test sets to create one data set.  The source data is obtained from this URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    - This is executed across two functions, **step0** and **step1**.  
    - **step0** will attempt to download and extract the ZIP file to a the directory specified by the global variable "dataDir" off the active workspace.  The final extracted files will be stored in the directory specified by the global variable "unzipDir".  At completion of this step, the global variable "fileList" will be populated with the relative path of the extracted files.
    - **step1** will use the data stored in the global variable "unzipDir" to build the path for each relevant file on disk.  It will read the "features.txt", to get labels for the data contained in the X_<test|training>.txt files.  Then for both test and training, it will read and merge the columns of each of the three files (subject_, X_, y_) into a single data.frame.  After getting the merged columns for both test and training, it will merge the rows to store a single dataframe in the global variable "data".
 0. Extracts only the measurements on the mean and standard deviation for each measurement.
    - **step2** will use a regular expression to find only the column names which match the text of "mean()" or "std()", as it appears in the "features_info.txt" file.  These were translated to "mean.." and "std.." during step1, so the regular expression will search for those strings.  With this logical vector, it will then subset the global variable "data", while also keeping the first two columns which are used for "subject" and "activity_id".
 0. Uses descriptive activity names to name the activities in the data set
    - **step3** will read the activity_labels.txt file and join the IDs from this file to those in our global variable "data".  We use the join() function rather than merge() to keep the sort order to ensure data consistency.  We also reorder the columns to move the activity text next to the subject, and remove the un-needed columns.
 0. Appropriately labels the data set with descriptive variable names. 
    - **step4** will clean up the column labels of the global variable "data".  Since we read in "features.txt" in step1, this provides us with a good basis of descriptive variable names.
 0. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
    - **step5** will aggregate the data with the global variable "data" by "subject" and "activity" and return the mean of the remaining variables.  It will also clean up dataset, and save the tidy data as comma seperated values to disk in the directory specified by the global variable "dataDir".
    - see **CodeBook.md**, or **tinydata.txt** for details on the format of this file.

Version
--
1.0

Author
--
Scott Zelenka (szelenka)
