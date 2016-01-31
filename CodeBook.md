##Codebook
#Features measured:
———————

This data set has Mean and standard Deviation calculations 
(labeled with a "mean" and "std" postfix)
for the following  4 (3dims + 1mag) * 5 features = 20 time measures;



# XYZ Body and Gravity Acceleration, Jerk Gyroscope Signals

Raw measurements from samsung galaxy accelerometer and gyroscope 3-axial were captured
at a constant rate. Calculations on and transformations of these measurements yielded the following features
in each dimension (X,Y and Z).  
* **tBodyAcc-XYZ**  Body Acceleration 
* **tGravityAcc-XYZ_** Acceleration due to Gravity
* **tBodyAccJerk-XYZ** Body Acceleration Jerk
* **tBodyGyro-XYZ** Gyroscope Body Signal
* **tBodyGyroJerk-XYZ** Gyroscope Jerk Measurment

# Magnitude Features

Using these XYZ measures, magnitudes were calculated
* **tBodyAccMag** Magnitute of Body Acceleration
* **tGravityAccMag** Magnitude of Gravity Accelration 
* **tBodyAccJerkMag** Body Accelerator Jerk magnitude
* **tBodyGyroMag**  Magnitude of Gyroscope signal 
* **tBodyGyroJerkMag**  Magnitude of Gyroscope Jerk signal

#  Frequency Features 

Time features above were converted using Fourier transforms into
the following frequency features.
* **fBodyAcc-XYZ**  Body Acceleration
* **fBodyAccJerk-XYZ** Body Acceleration Jerk
* **fBodyGyro-XYZ** Gyroscope Body
* **fBodyAccMag** Magnitute of Body Acceleration
* **fBodyAccJerkMag** Magnitute of Body Accelerator Jerk
* **fBodyGyroMag** Magnitude of Gyroscope signal
* **fBodyGyroJerkMag** Magnitude of Gyroscope Jerk signal


