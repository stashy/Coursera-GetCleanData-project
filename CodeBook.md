##Codebook

"Run_analysis" creates a data set with the columns: subject_id, activity, measure_type and measurment;

### Activities:
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

### Measure Types:
Meas_type consists of Mean and standard Deviation calculations 
(labeled with a "mean" and "std" postfix)
for 33 separate features

#### XYZ Body and Gravity Acceleration, Jerk Gyroscope Signals ( 15 features)

Raw measurements from samsung galaxy accelerometer and gyroscope 3-axial were captured
at a constant rate. Calculations on and transformations of these measurements yielded the following features
in each dimension (X,Y and Z).  
* **tBodyAcc-XYZ**  Body Acceleration 
* **tGravityAcc-XYZ_** Acceleration due to Gravity
* **tBodyAccJerk-XYZ** Body Acceleration Jerk
* **tBodyGyro-XYZ** Gyroscope Body Signal
* **tBodyGyroJerk-XYZ** Gyroscope Jerk Measurment

#### Magnitude Features (5 features)

Using these XYZ measures, magnitudes were calculated
* **tBodyAccMag** Magnitute of Body Acceleration
* **tGravityAccMag** Magnitude of Gravity Accelration 
* **tBodyAccJerkMag** Body Accelerator Jerk magnitude
* **tBodyGyroMag**  Magnitude of Gyroscope signal 
* **tBodyGyroJerkMag**  Magnitude of Gyroscope Jerk signal

####  Frequency Features (13 features)

Time features above were converted using Fourier transforms into
the following frequency features.
* **fBodyAcc-XYZ**  Body Acceleration
* **fBodyAccJerk-XYZ** Body Acceleration Jerk
* **fBodyGyro-XYZ** Gyroscope Body
* **fBodyAccMag** Magnitute of Body Acceleration
* **fBodyAccJerkMag** Magnitute of Body Accelerator Jerk
* **fBodyGyroMag** Magnitude of Gyroscope signal
* **fBodyGyroJerkMag** Magnitude of Gyroscope Jerk signal


