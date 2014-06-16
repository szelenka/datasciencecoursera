# szelenka 2014-06-06
# Couse Project getdata-004

# verify libraries are loaded
library(base)
library(utils)
library(plyr)
library(reshape2)

# specify global variables
fileList = NULL
data = NULL
data2 = NULL
dataDir = "./data"
unzipDir = file.path(dataDir,"UCI HAR Dataset")

# 0. obtain data for analysis
step0 = function() {
  dataFileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  destFile = file.path(dataDir,"getdata-projectfiles-UCI HAR Dataset.zip")

  # download the file
  if (!file.exists(destFile)) {
    download.file(dataFileUrl, destFile, method = "curl", mode = "w")
    # date accessed
    dateDownloaded <- date()
    print(dateDownloaded)
  }
  # verify file is present before proceeding
  if (!file.exists(destFile)) {
    stop(paste("Unable to download/access file:",destFile))
  }
  
  # unzip file and write list back to global
  fileList <<- unzip(destFile, exdir = dataDir)
  
  # verify files are extracted to disk
  if (is.null(fileList)) {
    stop("fileList is NULL!")  
  } else if (length(which(!file.exists(fileList))) > 0) {
    stop(paste("Unable to verify files were extracted:",subset(fileList,!file.exists(fileList))))
  }
}

# 1. Merges the training and the test sets to create one data set
step1 = function() {
  # verify we have a valid fileList
  if (is.null(fileList)) {
    stop("Unable to access fileList, cannot continue!")
  }
  # read in the features.txt file once and use it for both training/test files
  # this is needed to provide names to the X file data
  filename = directory = file.path(unzipDir,"features.txt")
  if (!file.exists(filename)) {
    stop(paste("Unable to access file:",filename))
  }
  features = read.table(filename,strip.white=TRUE,sep=" ",col.names=c("id","name"))
  
  # function to ensure we read the data from training/test in an identical way
  # the Inertial Signals folder is not relevant for this task, so ignore it
  readData = function(seed) {
    # verify the directory exists on disk
    directory = file.path(unzipDir,seed)
    if (!file.exists(directory)) {
      stop(paste("Unable to access directory:",directory))
    }
    
    # read the subject file
    filename = file.path(directory,paste0("subject_",seed,".txt"))
    if (!file.exists(filename)) {
      stop("Unable to access Subject file:",filename)
    }
    subject = read.table(filename,col.names=c("subject"))
    
    # read the Y file
    filename = file.path(directory,paste0("y_",seed,".txt"))
    if (!file.exists(filename)) {
      stop("Unable to access y file:",filename)
    }
    label = read.table(filename,col.names=c("activity_id"))
    
    # read the X file
    filename = file.path(directory,paste0("X_",seed,".txt"))
    if (!file.exists(filename)) {
      stop("Unable to access X file:",filename)
    }
    # use the data from the features.txt to specify the col.nam
    X = read.table(filename,col.names=features$name)
    
    # verify the length of each file is accruate before proceeding
    if (nrow(subject) != nrow(X) || nrow(X) != nrow(label)) {
      stop(paste("Invalid rows in one of the files:",nrow(subject),nrow(X),nrow(label)))
    }
    
    # combine and return the subject,X,and y files into a single data.frame
    cbind(subject,label,X)
  }
  # read in training data
  training = readData("train")
  
  # read in test data
  test = readData("test")
  
  # verify the length of each group
  if (length(training) != length(test)) {
    stop(paste("Invalid length comparison:",length(training),length(test)))
  }
  
  # merge training with test and write to global
  data <<- rbind(training,test)
}

# 2. Extracts only the measurements on the mean and standard deviation for each measurement
step2 = function() {
  if (is.null(data)) {
    stop("Unable to access data, cannot continue!")
  }
  # look at the names to determine which are 'mean()' or 'std()'
  # extract only the subset which matches these strings, be careful not to get any false positives
  # since we used the features.txt file to create the labels for this data (see lines 50,85)
  # the special characters '()' will be translated to '..', so we'll want to match on that
  pattern = ".*(mean|std)\\.\\..*"

  # get the logical vector for matches with 'mean..' or 'std..'
  tmp = grepl(pattern,names(data))
  
  # since we added 'subject' and 'activity_id' to the first two positions in data
  # we want to preserve them as well, so set them to TRUE
  tmp[1:2] = TRUE
  
  # write subset back to global
  data <<- data[,tmp]
}

# 3. Uses descriptive activity names to name the activities in the data set
step3 = function() {
  if (is.null(data)) {
    stop("Unable to access data, cannot continue!")
  }
  # read the activity_labels.txt file and update data
  filename = directory = file.path(unzipDir,"activity_labels.txt")
  if (!file.exists(filename)) {
    stop(paste("Unable to access file:",filename))
  }
  activity = read.table(filename,strip.white=TRUE,sep=" ",col.names=c("activity_id","activity"))
  
  # match first column from activity_labels with second column in data
  # use join rather than merge so we can preserve the order of 'data'
  # write merged results back to global
  data <<- join(data,activity,by="activity_id",type="inner")
  # reorder the columns so activity appears before the metrics
  data <<- data[c(1:2,length(data),3:length(data)-1)]
  # remove duplicate columns
  data$activity_id <<- NULL
  data$activity_id.1 <<- NULL
}

# 4. Appropriately labels the data set with descriptive variable names
step4 = function() {
  if (is.null(data)) {
    stop("Unable to access data, cannot continue!")
  }
  # since we read the features.txt and used it as a guide for labeling the X file 
  # the lables are already specified (see step 1, inside readData function)
  # for this step, we'll clean up the labels to make them easier for humans to read
  # the guide is from feature_info.txt
  tmp = names(data)
  tmp = gsub("\\.\\.","",names(data))
  #tmp = gsub("^t","Time Signal ",tmp)
  #tmp = gsub("^f","Fast Fourier Transform ",tmp)
  #tmp = gsub("Acc"," Accelerometer",tmp)
  #tmp = gsub("Gyro"," Gyroscope",tmp)
  #tmp = gsub("Jerk"," Jerk",tmp)
  #tmp = gsub("\\.\\.([XYZ])","\\1",tmp)
  #tmp = gsub(" ","\\.",tmp)
  
  # write new labels back to global
  names(data) <<- tmp
}

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
step5 = function() {
  if (is.null(data)) {
    stop("Unable to access data, cannot continue!")
  }
  # should return aprox. 180 rows since there are 30 subjects and 6 activities each
  # Subject 1, Activity n, average n
  # Subject 1, Activity n+1, average n
  # Subject 2, Activity n, average n
  # ...
  # perform tall & skinny tidy data
  # I prefer a wide tidy data, so comment this out here
  #tmp = melt(data, id.vars=c("subject","activity"), measure.vars=c(3:length(data)))
  #tmp = dcast(tmp,subject~activity,mean)
  
  # perform wide tidy data
  tmp = aggregate(data, by=list(data$subject, data$activity), FUN=mean)
  # clean up labels
  # since 'activity' was a factor variable, it will render 'NA' after aggregate
  # we also don't need the original 'subject', so remove these from the vector
  tmp$subject = NULL
  tmp$activity = NULL
  # rename the 'Group.1' and 'Group.2' variables generated by aggregate to what they represent
  names(tmp)[1] = "subject"
  names(tmp)[2] = "activity"
  
  # write to disk for submission
  write.table(
    tmp,
    row.names=FALSE,
    sep=",",
    file=file.path(dataDir,"tidydata.csv")
  )
}

## execution and monitoring
# print debugging statements to console to time execution of each step
print(paste("Start",Sys.time()))
print("Step0")
print(system.time(step0()))
print("Step1")
print(system.time(step1()))
print("Step2")
print(system.time(step2()))
print("Step3")
print(system.time(step3()))
print("Step4")
print(system.time(step4()))
print("Step5")
print(system.time(step5()))
print(paste("End:",Sys.time()))