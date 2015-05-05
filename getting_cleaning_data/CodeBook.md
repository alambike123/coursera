#Getting and Cleaning Data - Course Project
##Code Book
==================================================================
Methodology:
As per the course project instructions, I've reduced measured variables to only
the subject and activity variables (by which the 'tidy' data set rows are grouped 
according to), as well as all mean and standard deviation feature variables. I've 
explicitly chosen to leave out 'meanFreq' variables, which should result
in a 68 row 'untidy data frame An argument could be made that these are just mean 
values in another form, but I felt interpretation of the point to be broadly 
subjective.

Process leads to the following:
- 'untidy' data set with 68 columns (66 feature columns, Activity, and Subject)
- 'tidy' data set with four columns (Subject, Activity, variable, and value)
I chose to leave the 'tidy' data set in long form for readability

==================================================================
Untidy Variables:

Subject
	Indicates member of study group consisting of 30 volunteers between 19-48
	years old.
	Integer between 1-30
	
Activity
	Six activities performed during the study while wearing a smartphone with
	embedded accelerometer and gyroscope.
	* WALKING
	* WALKING_UPSTAIRS
	* WALKING_DOWNSTAIRS
	* SITTING
	* STANDING
	* LAYING

Body.Acceleration.Mean.X (renamed tBodyAcc-mean()-X)
	Mean of time domain body acceleration in the X-axial direction.
	Numeric measurement to 8 decimal places.

Body.Acceleration.Mean.Y (renamed tBodyAcc-mean()-Y)
	Mean of time domain body acceleration in the Y-axial direction.
	Numeric measurement to 8 decimal places.
	
Body.Acceleration.Mean.Z (renamed tBodyAcc-mean()-Z)
	Mean of time domain body acceleration in the X-axial direction.
	Numeric measurement to 8 decimal places.
	
Gravity.Acceleration.Mean.X (renamed tGravityAcc-mean()-X)
	Mean of time domain gravity acceleration in the X-axial direction.
	Numeric measurement to 8 decimal places.
	
Gravity.Acceleration.Mean.Y (renamed tGravityAcc-mean()-Y)
	Mean of time domain gravity acceleration in the Y-axial direction.
	Numeric measurement to 8 decimal places.
	
Gravity.Acceleration.Mean.Z (renamed tGravityAcc-mean()-Z)
	Mean of time domain gravity acceleration in the Z-axial direction.
	Numeric measurement to 8 decimal places.

Body.Acceleration.Jerk.Mean.X (renamed tBodyAccJerk-mean()-X)
	Mean of body linear acceleration derived in time in the X-axial direction.
	Numeric measurement to 8 decimal places.
	
Body.Acceleration.Jerk.Mean.Y (renamed tBodyAccJerk-mean()-Y)
	Mean of body linear acceleration derived in time in the Y-axial direction.
	Numeric measurement to 8 decimal places.
	
Body.Acceleration.Jerk.Mean.Z (renamed tBodyAccJerk-mean()-Z)
	Mean of body linear acceleration derived in time in the Z-axial direction.
	Numeric measurement to 8 decimal places.

Body.Gyroscopic.Mean.X (renamed tBodyGyro-mean()-X)
	Mean of time domain body gyroscopic signal in time in the X-axial direction.
	Numeric measurement to 8 decimal places.

Body.Gyroscopic.Mean.Y (renamed tBodyGyro-mean()-Y)
	Mean of time domain body gyroscopic signal in time in the Y-axial direction.
	Numeric measurement to 8 decimal places.

Body.Gyroscopic.Mean.Z (renamed tBodyGyro-mean()-Z)
	Mean of time domain body gyroscopic signal in time in the Z-axial direction.
	Numeric measurement to 8 decimal places.

Body.Gyroscopic.Jerk.Mean.X (renamed tBodyGyroJerk-mean()-X)
	Mean of body angular velocity derived in time in the X-axial direction.
	Numeric measurement to 8 decimal places.

Body.Gyroscopic.Jerk.Mean.Y (renamed tBodyGyroJerk-mean()-Y)
	Mean of body angular velocity derived in time in the Y-axial direction.
	Numeric measurement to 8 decimal places.

Body.Gyroscopic.Jerk.Mean.X (renamed tBodyGyroJerk-mean()-Z)
	Mean of body angular velocity derived in time in the Z-axial direction.
	Numeric measurement to 8 decimal places.

Body.Acceleration.Magnitude.Mean (renamed tBodyAccMag-mean())
	Mean of magnitude of three dimensional body linear acceleration signal using Euclidean
	norm.
	Numeric measurement to 8 decimal places.
	
Gravity.Acceleration.Magnitude.Mean (renamed tGravityAccMag-mean())
	Mean of magnitude of three dimensional gravity linear acceleration signal using
	Euclidean norm.
	Numeric measurement to 8 decimal places.
	
Body.Acceleration.Jerk.Magnitude.Mean (renamed tBodyAccJerkMag-mean())
	Mean of magnitude of three dimensional body linear acceleration signal derived
	in time.
	Numeric measurement to 8 decimal places.
	
Body.Gyroscopic.Magnitude.Mean (renamed tBodyGyroMag-mean())
	Mean of magnitude of three dimensional body gyroscopic signal using Euclidean
	norm.
	Numeric measurement to 8 decimal places.
	
Body.Gyroscopic.Jerk.Magnitude.Mean (renamed tBodyGyroJerkMag-mean())
	Mean of magnitude of three dimensional body gyroscopic signal derived in time.
	Numeric measurement to 8 decimal places.
	
Frequency.Body.Acceleration.Mean.X (renamed fBodyAcc-mean()-X)
	Mean of frequency domain body acceleration in the X-axial direction
	Numeric measurement to 8 decimal places.

Frequency.Body.Acceleration.Mean.Y (renamed fBodyAcc-mean()-Y)
	Mean of frequency domain body acceleration in the Y-axial direction
	Numeric measurement to 8 decimal places.

Frequency.Body.Acceleration.Mean.Z (renamed fBodyAcc-mean()-Z)
	Mean of frequency domain body acceleration in the Z-axial direction
	Numeric measurement to 8 decimal places.

Frequency.Body.Acceleration.Jerk.Mean.X (renamed fBodyAccJerk-mean()-X)
	Mean of frequency domain body linear acceleration signal derived in time in
	the X-axial direction.
	Numeric measurement to 8 decimal places.
	
Frequency.Body.Acceleration.Jerk.Mean.Y (renamed fBodyAccJerk-mean()-Y)
	Mean of frequency domain body linear acceleration signal derived in time in
	the Y-axial direction.
	Numeric measurement to 8 decimal places.
	
Frequency.Body.Acceleration.Jerk.Mean.Z (renamed fBodyAccJerk-mean()-Z)
	Mean of frequency domain body linear acceleration signal derived in time in
	the Z-axial direction.
	Numeric measurement to 8 decimal places.
	
Frequency.Body.Gyroscopic.Mean.X (renamed fBodyGyro-mean()-X)
	Mean of frequency domain body gyroscopic signal in the X-axial direction.
	Numeric measurement to 8 decimal places.
	
Frequency.Body.Gyroscopic.Mean.Y (renamed fBodyGyro-mean()-Y)
	Mean of frequency domain body gyroscopic signal in the Y-axial direction.
	Numeric measurement to 8 decimal places.
	
Frequency.Body.Gyroscopic.Mean.Z (renamed fBodyGyro-mean()-Z)
	Mean of frequency domain body gyroscopic signal in the Z-axial direction.
	Numeric measurement to 8 decimal places.
	
Frequency.Body.Acceleration.Magnitude.Mean (renamed fBodyAccMag-mean())
	Mean of magnitude of three dimensional body linear acceleration using the
	Euclidean norm.
	Numeric measurement to 8 decimal places.

Frequency.Body.Acceleration.Jerk.Magnitude.Mean (renamed fBodyBodyAccJerkMag-mean())
	Mean of magnitude of three dimensional body linear acceleration derived over
	time.
	Numeric measurement to 8 decimal places.
	
Frequency.Body.Gyroscopic.Magnitude.Mean (renamed fBodyBodyGyroMag-mean())
	Mean of magnitude of three dimensional body gyroscopic signal using the
	Euclidean norm.
	Numeric measurement to 8 decimal places.
	
Frequency.Body.Gyroscopic.Jerk.Magnitude.Mean (renamed fBodyBodyGyroJerkMag-mean())
	Mean of magnitude of three dimensional body gyroscopic signal derived over
	time.
	Numeric measurement to 8 decimal places.

Body.Acceleration.StandardDev.X (renamed tBodyAcc-std()-X)
	Standard deviation of time domain body acceleration in the X-axial direction.
	Numeric measurement to 8 decimal places.
	
Body.Acceleration.StandardDev.Y (renamed tBodyAcc-std()-Y)
	Standard deviation of time domain body acceleration in the Y-axial direction.
	Numeric measurement to 8 decimal places.
	
Body.Acceleration.StandardDev.Z (renamed tBodyAcc-std()-Z)
	Standard deviation of time domain body acceleration in the Z-axial direction.
	Numeric measurement to 8 decimal places.
	
Gravity.Acceleration.StandardDev.X (renamed tGravityAcc-std()-X)
	Standard deviation of time domain gravity acceleration in the X-axial direction.
	Numeric measurement to 8 decimal places.
	
Gravity.Acceleration.StandardDev.Y (renamed tGravityAcc-std()-Y)
	Standard deviation of time domain gravity acceleration in the Y-axial direction.
	Numeric measurement to 8 decimal places.

Gravity.Acceleration.StandardDev.Z (renamed tGravityAcc-std()-Z)
	Standard deviation of time domain gravity acceleration in the Z-axial direction.
	Numeric measurement to 8 decimal places.
	
Body.Acceleration.Jerk.StandardDev.X (renamed tBodyAccJerk-std()-X)
	Standard deviation of body linear acceleration derived in time in the X-axial 
	direction.
	Numeric measurement to 8 decimal places.
	
Body.Acceleration.Jerk.StandardDev.Y (renamed tBodyAccJerk-std()-Y)
	Standard deviation of body linear acceleration derived in time in the Y-axial 
	direction.
	Numeric measurement to 8 decimal places.
	
Body.Acceleration.Jerk.StandardDev.Z (renamed tBodyAccJerk-std()-Z)
	Standard deviation of body linear acceleration derived in time in the Z-axial 
	direction.
	Numeric measurement to 8 decimal places.

Body.Gyroscopic.StandardDev.X (renamed tBodyGyro-std()-X)
	Standard deviation of time domain body gyroscopic signal in time in the X-axial 
	direction.
	Numeric measurement to 8 decimal places.

Body.Gyroscopic.StandardDev.Y (renamed tBodyGyro-std()-Y)
	Standard deviation of time domain body gyroscopic signal in time in the Y-axial 
	direction.
	Numeric measurement to 8 decimal places.

Body.Gyroscopic.StandardDev.Z (renamed tBodyGyro-std()-Z)
	Standard deviation of time domain body gyroscopic signal in time in the Z-axial 
	direction.
	Numeric measurement to 8 decimal places.
	
Body.Gyroscopic.Jerk.StandardDev.X (renamed tBodyGyroJerk-std()-X)
	Standard deviation of body angular velocity derived in time in the X-axial direction.
	Numeric measurement to 8 decimal places.
	
Body.Gyroscopic.Jerk.StandardDev.Y (renamed tBodyGyroJerk-std()-Y)
	Standard deviation of body angular velocity derived in time in the Y-axial direction.
	Numeric measurement to 8 decimal places.
	
Body.Gyroscopic.Jerk.StandardDev.Z (renamed tBodyGyroJerk-std()-Z)
	Standard deviation of body angular velocity derived in time in the Z-axial direction.
	Numeric measurement to 8 decimal places.
	
Body.Acceleration.Magnitude.StandardDev (renamed tBodyAccMag-std())
	Standard deviation of magnitude of three dimensional body linear acceleration signal using Euclidean
	norm.
	Numeric measurement to 8 decimal places.
	
Gravity.Acceleration.Magnitude.StandardDev (renamed tGravityAccMag-std())
	Standard deviation of magnitude of three dimensional gravity linear acceleration signal using
	Euclidean norm.
	Numeric measurement to 8 decimal places.
	
Body.Acceleration.Jerk.Magnitude.StandardDev (renamed tBodyAccJerkMag-std())
	Standard deviation of magnitude of three dimensional body linear acceleration signal derived
	in time.
	Numeric measurement to 8 decimal places.
	
Body.Gyroscopic.Magnitude.StandardDev (renamed tBodyGyroMag-std())
	Standard deviation of magnitude of three dimensional body gyroscopic signal using Euclidean
	norm.
	Numeric measurement to 8 decimal places.
	
Body.Gyroscopic.Jerk.Magnitude.StandardDev (renamed tBodyGyroJerkMag-std())
	Standard deviation of magnitude of three dimensional body gyroscopic signal derived in time.
	Numeric measurement to 8 decimal places.
	
Frequency.Body.Acceleration.StandardDev.X (renamed fBodyAcc-std()-X)
	Standard deviation of frequency domain body acceleration in the X-axial direction
	Numeric measurement to 8 decimal places.

Frequency.Body.Acceleration.StandardDev.Y (renamed fBodyAcc-std()-Y)
	Standard deviation of frequency domain body acceleration in the Y-axial direction
	Numeric measurement to 8 decimal places.

Frequency.Body.Acceleration.StandardDev.Z (renamed fBodyAcc-std()-Z)
	Standard deviation of frequency domain body acceleration in the Z-axial direction
	Numeric measurement to 8 decimal places.

Frequency.Body.Acceleration.Jerk.StandardDev.X (renamed fBodyAccJerk-std()-X)
	Standard deviation of frequency domain body linear acceleration signal derived in time in
	the X-axial direction.
	Numeric measurement to 8 decimal places.
	
Frequency.Body.Acceleration.Jerk.StandardDev.Y (renamed fBodyAccJerk-std()-Y)
	Standard deviation of frequency domain body linear acceleration signal derived in time in
	the Y-axial direction.
	Numeric measurement to 8 decimal places.
	
Frequency.Body.Acceleration.Jerk.StandardDev.Z (renamed fBodyAccJerk-std()-Z)
	Standard deviation of frequency domain body linear acceleration signal derived in time in
	the Z-axial direction.
	Numeric measurement to 8 decimal places.
	
Frequency.Body.Gyroscopic.StandardDev.X (renamed fBodyGyro-std()-X)
	Standard deviation of frequency domain body gyroscopic signal in the X-axial direction.
	Numeric measurement to 8 decimal places.
	
Frequency.Body.Gyroscopic.StandardDev.Y (renamed fBodyGyro-std()-Y)
	Standard deviation of frequency domain body gyroscopic signal in the Y-axial direction.
	Numeric measurement to 8 decimal places.
	
Frequency.Body.Gyroscopic.StandardDev.Z (renamed fBodyGyro-std()-Z)
	Standard deviation of frequency domain body gyroscopic signal in the Z-axial direction.
	Numeric measurement to 8 decimal places.
	
Frequency.Body.Acceleration.Magnitude.StandardDev (renamed fBodyAccMag-std())
	Standard deviation of magnitude of three dimensional body linear acceleration using the
	Euclidean norm.
	Numeric measurement to 8 decimal places.

Frequency.Body.Acceleration.Jerk.Magnitude.StandardDev (renamed fBodyBodyAccJerkMag-std())
	Standard deviation of magnitude of three dimensional body linear acceleration derived over
	time.
	Numeric measurement to 8 decimal places.
	
Frequency.Body.Gyroscopic.Magnitude.StandardDev (renamed fBodyBodyGyroMag-std())
	Standard deviation of magnitude of three dimensional body gyroscopic signal using the
	Euclidean norm.
	Numeric measurement to 8 decimal places.
	
Frequency.Body.Gyroscopic.Jerk.Magnitude.StandardDev (renamed fBodyBodyGyroJerkMag-std())
	Standard deviation of magnitude of three dimensional body gyroscopic signal derived over
	time.
	Numeric measurement to 8 decimal places.
	
==================================================================
Tidy Variables:

Subject
	Indicates member of study group consisting of 30 volunteers between 19-48
	years old.
	Integer between 1-30
	
Activity
	Six activities performed during the study while wearing a smartphone with
	embedded accelerometer and gyroscope.
	* WALKING
	* WALKING_UPSTAIRS
	* WALKING_DOWNSTAIRS
	* SITTING
	* STANDING
	* LAYING

Variable
	Feature value being measured as determined by untidy dataframe
	
Value
	Mean value of feature variable as determined by 'Variable' dataframe
	