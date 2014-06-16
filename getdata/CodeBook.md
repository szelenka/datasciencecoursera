CodeBook.md
=========
This is the ouput file as identified in step 5 from the assignment outlined in **run_analysis.R**.  The goal is to have tidy data, which has the following principles:
  - Each variable forms a column
  - Each observation forms a row
  - Each table/file stores data about one kind of observation (e.g. people/hospitals)

## Description of the study
This is completing the assignment for getdata-004 on Coursera.
## Sampling information
Since the original data came from the **features_info.txt** of the assignment, we're reproducing the information here for context.  For information on how to obtain the original features_info.txt, please review comments within the **run_analysis.R** script.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
```
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag  
```
The set of variables that were estimated from these signals are: 
```
mean(): Mean value
std(): Standard deviation
```
## Tecnical information
From each variable measured from each subject and each activity, the mean was taken and preserved to this tidy data set.  Following the naming convention outlined above, two examples are:

**tBodyAcc.mean.X** = the mean of all observations for this subject/activity of the Time Signal Body Accelerometer average for X

**fBodyGyro.std.Y** = the mean of all observations for this subject/activity of the Fast Fourier Transform Body Gyroscope Standard Deviation for Y

## Structure of the data within the file
Each row contains the observation for a single subject performing a single activity, and the average value of all previously measured valus for the mean() and std().  Values are seperated by the "," character, and can be considered a CSV file format.  

###Example Output:
```
"subject","activity","tBodyAcc.mean.X","tBodyAcc.mean.Y","tBodyAcc.mean.Z","tBodyAcc.std.X","tBodyAcc.std.Y","tBodyAcc.std.Z","tGravityAcc.mean.X","tGravityAcc.mean.Y","tGravityAcc.mean.Z","tGravityAcc.std.X","tGravityAcc.std.Y","tGravityAcc.std.Z","tBodyAccJerk.mean.X","tBodyAccJerk.mean.Y","tBodyAccJerk.mean.Z","tBodyAccJerk.std.X","tBodyAccJerk.std.Y","tBodyAccJerk.std.Z","tBodyGyro.mean.X","tBodyGyro.mean.Y","tBodyGyro.mean.Z","tBodyGyro.std.X","tBodyGyro.std.Y","tBodyGyro.std.Z","tBodyGyroJerk.mean.X","tBodyGyroJerk.mean.Y","tBodyGyroJerk.mean.Z","tBodyGyroJerk.std.X","tBodyGyroJerk.std.Y","tBodyGyroJerk.std.Z","tBodyAccMag.mean","tBodyAccMag.std","tGravityAccMag.mean","tGravityAccMag.std","tBodyAccJerkMag.mean","tBodyAccJerkMag.std","tBodyGyroMag.mean","tBodyGyroMag.std","tBodyGyroJerkMag.mean","tBodyGyroJerkMag.std","fBodyAcc.mean.X","fBodyAcc.mean.Y","fBodyAcc.mean.Z","fBodyAcc.std.X","fBodyAcc.std.Y","fBodyAcc.std.Z","fBodyAccJerk.mean.X","fBodyAccJerk.mean.Y","fBodyAccJerk.mean.Z","fBodyAccJerk.std.X","fBodyAccJerk.std.Y","fBodyAccJerk.std.Z","fBodyGyro.mean.X","fBodyGyro.mean.Y","fBodyGyro.mean.Z","fBodyGyro.std.X","fBodyGyro.std.Y","fBodyGyro.std.Z","fBodyAccMag.mean","fBodyAccMag.std","fBodyBodyAccJerkMag.mean","fBodyBodyAccJerkMag.std","fBodyBodyGyroMag.mean","fBodyBodyGyroMag.std","fBodyBodyGyroJerkMag.mean","fBodyBodyGyroJerkMag.std"
1,"LAYING",0.22159824394,-0.0405139534294,-0.11320355358,-0.9280564692,-0.83682740562,-0.826061401628,-0.24888179828,0.70554977346,0.4458177198,-0.8968300184,-0.90772000676,-0.85236629022,0.0810865342,0.0038382040088,0.010834236361,-0.958482112,-0.9241492736,-0.9548551108,-0.016553093978,-0.064486124088,0.14868943626,-0.87354386782,-0.9510904402,-0.9082846626,-0.107270949192,-0.04151728689,-0.0740501211,-0.9186085208,-0.9679072436,-0.9577901596,-0.8419291525,-0.79514486386,-0.8419291525,-0.79514486386,-0.9543962646,-0.9282456284,-0.874759548,-0.81901016976,-0.96346103,-0.9358409828,-0.9390990524,-0.86706520518,-0.8826668762,-0.9244374346,-0.8336255561,-0.81289155944,-0.9570738838,-0.9224626098,-0.9480609042,-0.9641607086,-0.9322178704,-0.9605869872,-0.850249174586,-0.9521914948,-0.909302721,-0.8822964508,-0.9512320494,-0.9165825082,-0.8617676481,-0.7983009404,-0.9333003608,-0.9218039756,-0.8621901854,-0.82431943968,-0.9423669466,-0.9326606676
2,"LAYING",0.281373403958333,-0.0181587397583333,-0.107245610416667,-0.974059464791667,-0.98027739875,-0.984233296875,-0.509754238125,0.752536639375,0.646834879583333,-0.959014441458333,-0.988211865208333,-0.984230418125,0.0825972511666667,0.012254788451875,-0.00180264895625,-0.98587216875,-0.98317254125,-0.988442014375,-0.01847660675,-0.111800824583333,0.144882846104167,-0.988275232916667,-0.982291608958333,-0.960306560416667,-0.101974134208333,-0.0358590176083333,-0.0701783020833333,-0.993235849166667,-0.989567537916667,-0.98803582125,-0.977435485208333,-0.972873912916667,-0.977435485208333,-0.972873912916667,-0.987741696041667,-0.98551807625,-0.950011569583333,-0.961164053958333,-0.991767074166667,-0.989718095208333,-0.976725059791667,-0.979800877916667,-0.984380981875,-0.973246482083333,-0.981025105625,-0.984792185,-0.985813630833333,-0.982768250416667,-0.986197134583333,-0.987250255833333,-0.984987392916667,-0.989345368541667,-0.9864311425,-0.983321635416667,-0.9626718875,-0.988860685833333,-0.981910616458333,-0.963174222291667,-0.975110196458333,-0.975121387916667,-0.985374114791667,-0.984568489166667,-0.972112972708333,-0.96109837875,-0.990248702291667,-0.989492660416667
...
```

## Details about the data
Any absent values are represented by NA.
The column order and data represented in that column is summarized below:

 0. **subject**: Integer value, corresponding to the individual being observed
 0. **activity**: English character string, indicating the activity being observed 
 0. **tBodyAcc.mean.X**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Accelerometer mean of X for this subject while performing the activity during this study
 0. **tBodyAcc.mean.Y**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Accelerometer mean of Y for this subject while performing the activity during this study
 0. **tBodyAcc.mean.Z**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Accelerometer mean of Z for this subject while performing the activity during this study
 0. **tBodyAcc.std.X**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Accelerometer standard deviation of X for this subject while performing the activity during this study
 0. **tBodyAcc.std.Y**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Accelerometer standard deviation of Y for this subject while performing the activity during this study
 0. **tBodyAcc.std.Z**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Accelerometer standard deviation of Z for this subject while performing the activity during this study
 0. **tGravityAcc.mean.X**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Gravity Accelerometer mean of X for this subject while performing the activity during this study
 0. **tGravityAcc.mean.Y**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Gravity Accelerometer mean of Y for this subject while performing the activity during this study
 0. **tGravityAcc.mean.Z**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Gravity Accelerometer mean of Z for this subject while performing the activity during this study
 0. **tGravityAcc.std.X**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Gravity Accelerometer standard deviation of X for this subject while performing the activity during this study
 0. **tGravityAcc.std.Y**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Gravity Accelerometer standard deviation of Y for this subject while performing the activity during this study
 0. **tGravityAcc.std.Z**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Gravity Accelerometer standard deviation of Z for this subject while performing the activity during this study
 0. **tBodyAccJerk.mean.X**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Jerk Accelerometer mean of X for this subject while performing the activity during this study
 0. **tBodyAccJerk.mean.Y**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Jerk Accelerometer mean of Y for this subject while performing the activity during this study
 0. **tBodyAccJerk.mean.Z**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Jerk Accelerometer mean of Z for this subject while performing the activity during this study
 0. **tBodyAccJerk.std.X**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Jerk Accelerometer standard deviation of X for this subject while performing the activity during this study
 0. **tBodyAccJerk.std.Y**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Jerk Accelerometer standard deviation of Y for this subject while performing the activity during this study
 0. **tBodyAccJerk.std.Z**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Jerk Accelerometer standard deviation of Z for this subject while performing the activity during this study
 0. **tBodyGyro.mean.X**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Gyroscope mean of X for this subject while performing the activity during this study
 0. **tBodyGyro.mean.Y**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Gyroscope mean of Y for this subject while performing the activity during this study
 0. **tBodyGyro.mean.Z**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Gyroscope mean of Z for this subject while performing the activity during this study
 0. **tBodyGyro.std.X**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Gyroscope standard deviation of X for this subject while performing the activity during this study
 0. **tBodyGyro.std.Y**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Gyroscope standard deviation of Y for this subject while performing the activity during this study
 0. **tBodyGyro.std.Z**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Gyroscope standard deviation of Z for this subject while performing the activity during this study
 0. **tBodyGyroJerk.mean.X**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Jerk Gyroscope mean of X for this subject while performing the activity during this study
 0. **tBodyGyroJerk.mean.Y**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Jerk Gyroscope mean of Y for this subject while performing the activity during this study
 0. **tBodyGyroJerk.mean.Z**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Jerk Gyroscope mean of Z for this subject while performing the activity during this study
 0. **tBodyGyroJerk.std.X**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Jerk Gyroscope standard deviation of X for this subject while performing the activity during this study
 0. **tBodyGyroJerk.std.Y**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Jerk Gyroscope standard deviation of Y for this subject while performing the activity during this study
 0. **tBodyGyroJerk.std.Z**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Jerk Gyroscope standard deviation of Z for this subject while performing the activity during this study
 0. **tBodyAccMag.mean**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Accelerometer mean for this subject while performing the activity during this study
 0. **tBodyAccMag.std**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Accelerometer standard deviation for this subject while performing the activity during this study
 0. **tGravityAccMag.mean**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Gravity Accelerometer mean for this subject while performing the activity during this study
 0. **tGravityAccMag.std**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Gravity Accelerometer standard deviation for this subject while performing the activity during this study
 0. **tBodyAccJerkMag.mean**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Jerk Accelerometer mean for this subject while performing the activity during this study
 0. **tBodyAccJerkMag.std**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Jerk Accelerometer standard deviation for this subject while performing the activity during this study
 0. **tBodyGyroMag.mean**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Gyroscope mean for this subject while performing the activity during this study
 0. **tBodyGyroMag.std**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Gyroscope standard deviation for this subject while performing the activity during this study
 0. **tBodyGyroJerkMag.mean**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Jerk Gyroscope mean for this subject while performing the activity during this study
 0. **tBodyGyroJerkMag.std**: Floating point numerical value, indicating the mean of all observed values for Time Domain Signal Body Jerk Gyroscope standard deviation for this subject while performing the activity during this study
 0. **fBodyAcc.mean.X**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Accelerometer mean of X for this subject while performing the activity during this study
 0. **fBodyAcc.mean.Y**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Accelerometer mean of Y for this subject while performing the activity during this study
 0. **fBodyAcc.mean.Z**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Accelerometer mean of Z for this subject while performing the activity during this study
 0. **fBodyAcc.std.X**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Accelerometer standard deviation of X for this subject while performing the activity during this study
 0. **fBodyAcc.std.Y**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Accelerometer standard deviation of Y for this subject while performing the activity during this study
 0. **fBodyAcc.std.Z**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Accelerometer standard deviation of Z for this subject while performing the activity during this study
 0. **fBodyAccJerk.mean.X**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Jerk Accelerometer mean of X for this subject while performing the activity during this study
 0. **fBodyAccJerk.mean.Y**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Jerk Accelerometer mean of Y for this subject while performing the activity during this study
 0. **fBodyAccJerk.mean.Z**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Jerk Accelerometer mean of Z for this subject while performing the activity during this study
 0. **fBodyAccJerk.std.X**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Jerk Accelerometer standard deviation of X for this subject while performing the activity during this study
 0. **fBodyAccJerk.std.Y**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Jerk Accelerometer standard deviation of Y for this subject while performing the activity during this study
 0. **fBodyAccJerk.std.Z**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Jerk Accelerometer standard deviation of Z for this subject while performing the activity during this study
 0. **fBodyGyro.mean.X**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Gyroscope mean of X for this subject while performing the activity during this study
 0. **fBodyGyro.mean.Y**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Gyroscope mean of Y for this subject while performing the activity during this study
 0. **fBodyGyro.mean.Z**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Gyroscope mean of Z for this subject while performing the activity during this study
 0. **fBodyGyro.std.X**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Gyroscope standard deviation of X for this subject while performing the activity during this study
 0. **fBodyGyro.std.Y**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Gyroscope standard deviation of Y for this subject while performing the activity during this study
 0. **fBodyGyro.std.Z**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Gyroscope standard deviation of Z for this subject while performing the activity during this study
 0. **fBodyAccMag.mean**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Accelerometer mean for this subject while performing the activity during this study
 0. **fBodyAccMag.std**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Accelerometer standard deviation for this subject while performing the activity during this study
 0. **fBodyBodyAccJerkMag.mean**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Jerk Accelerometer mean for this subject while performing the activity during this study
 0. **fBodyBodyAccJerkMag.std**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Jerk Accelerometer standard deviation for this subject while performing the activity during this study
 0. **fBodyBodyGyroMag.mean**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Accelerometer mean for this subject while performing the activity during this study
 0. **fBodyBodyGyroMag.std**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Accelerometer standard deviation for this subject while performing the activity during this study
 0. **fBodyBodyGyroJerkMag.mean**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Jerk Gyroscope mean for this subject while performing the activity during this study
 0. **fBodyBodyGyroJerkMag.std**: Floating point numerical value, indicating the mean of all observed values for Fast Fourier Transform Body Jerk Gyroscope standard deviation for this subject while performing the activity during this study


Version
--
1.0

Author
--
Scott Zelenka (szelenka)