Codebook.md
title: "Getting-and-Cleaning-Data-Week-4-Assignment" 
output: "tidy_date.txt""

# Code Book
The final summary tidy dataset "tidy_data.txt" contains the average of each variable for each activity and each subject
from the Human Activity Recognition Using Smartphones Data Set

## Data Description
The first row contains the names of the variables, which are listed and described in the Variables section

Variables
Each row contains, for a given subject and activity, 79 averaged signal measurements.

## Identifiers 

The base data is grouped by the following values to build mean value and the standard deviation std()

•subject - The ID of the test subject

•activity - The type of activity performed when the corresponding measurements were taken


## Activity

The 30 subject are numbered sequentially from 1 to 30. Activity column has 6 types as listed below.

1.WALKING
2.WALKING_UPSTAIRS
3.WALKING_DOWNSTAIRS
4.SITTING
5.STANDING
6.LAYING
All measurements are floating-point values, normalised and bounded within [-1,1].
The measurements are classified in two domains:
Time-domain signals (variables prefixed by timeDomain), resulting from the capture of accelerometer and gyroscope raw signals.
Frequency-domain signals (variables prefixed by frequencyDomain), resulting from the application of a Fast Fourier Transform (FFT) to some of the time-domain signals.
Time-domain signals
Average and StandardDeviation time-domain body acceleration in the X, Y and Z directions:

subject 
activity 
timeDomainBodyAccelerometerMeanX 
timeDomainBodyAccelerometerMeanY 
timeDomainBodyAccelerometerMeanZ 
timeDomainBodyAccelerometerStandardDeviationX 
timeDomainBodyAccelerometerStandardDeviationY 
timeDomainBodyAccelerometerStandardDeviationZ 
timeDomainGravityAccelerometerMeanX 
timeDomainGravityAccelerometerMeanY 
timeDomainGravityAccelerometerMeanZ 
timeDomainGravityAccelerometerStandardDeviationX 
timeDomainGravityAccelerometerStandardDeviationY 
timeDomainGravityAccelerometerStandardDeviationZ 
timeDomainBodyAccelerometerJerkMeanX 
timeDomainBodyAccelerometerJerkMeanY 
timeDomainBodyAccelerometerJerkMeanZ t
imeDomainBodyAccelerometerJerkStandardDeviationX
 timeDomainBodyAccelerometerJerkStandardDeviationY 
timeDomainBodyAccelerometerJerkStandardDeviationZ 
timeDomainBodyGyroscopeMeanX 
timeDomainBodyGyroscopeMeanY timeDomainBodyGyroscopeMeanZ 
timeDomainBodyGyroscopeStandardDeviationX 
timeDomainBodyGyroscopeStandardDeviationY 
timeDomainBodyGyroscopeStandardDeviationZ 
timeDomainBodyGyroscopeJerkMeanX 
timeDomainBodyGyroscopeJerkMeanY 
timeDomainBodyGyroscopeJerkMeanZ 
timeDomainBodyGyroscopeJerkStandardDeviationX 
timeDomainBodyGyroscopeJerkStandardDeviationY 
timeDomainBodyGyroscopeJerkStandardDeviationZ 
timeDomainBodyAccelerometerMagnitudeMean 
timeDomainBodyAccelerometerMagnitudeStandardDeviation 
timeDomainGravityAccelerometerMagnitudeMean 
timeDomainGravityAccelerometerMagnitudeStandardDeviation 
timeDomainBodyAccelerometerJerkMagnitudeMean 
timeDomainBodyAccelerometerJerkMagnitudeStandardDeviation 
timeDomainBodyGyroscopeMagnitudeMean 
timeDomainBodyGyroscopeMagnitudeStandardDeviation 
timeDomainBodyGyroscopeJerkMagnitudeMean 
timeDomainBodyGyroscopeJerkMagnitudeStandardDeviation 
frequencyDomainBodyAccelerometerMeanX 
frequencyDomainBodyAccelerometerMeanY 
frequencyDomainBodyAccelerometerMeanZ 
frequencyDomainBodyAccelerometerStandardDeviationX 
frequencyDomainBodyAccelerometerStandardDeviationY 
frequencyDomainBodyAccelerometerStandardDeviationZ 
frequencyDomainBodyAccelerometerMeanFrequencyX 
frequencyDomainBodyAccelerometerMeanFrequencyY 
frequencyDomainBodyAccelerometerMeanFrequencyZ 
frequencyDomainBodyAccelerometerJerkMeanX 
frequencyDomainBodyAccelerometerJerkMeanY 
frequencyDomainBodyAccelerometerJerkMeanZ 
frequencyDomainBodyAccelerometerJerkStandardDeviationX 
frequencyDomainBodyAccelerometerJerkStandardDeviationY 
frequencyDomainBodyAccelerometerJerkStandardDeviationZ 
frequencyDomainBodyAccelerometerJerkMeanFrequencyX 
frequencyDomainBodyAccelerometerJerkMeanFrequencyY 
frequencyDomainBodyAccelerometerJerkMeanFrequencyZ 
frequencyDomainBodyGyroscopeMeanX 
frequencyDomainBodyGyroscopeMeanY 
frequencyDomainBodyGyroscopeMeanZ 
frequencyDomainBodyGyroscopeStandardDeviationX 
frequencyDomainBodyGyroscopeStandardDeviationY 
frequencyDomainBodyGyroscopeStandardDeviationZ 
frequencyDomainBodyGyroscopeMeanFrequencyX 
frequencyDomainBodyGyroscopeMeanFrequencyY 
frequencyDomainBodyGyroscopeMeanFrequencyZ 
frequencyDomainBodyAccelerometerMagnitudeMean 
frequencyDomainBodyAccelerometerMagnitudeStandardDeviation 
frequencyDomainBodyAccelerometerMagnitudeMeanFrequency 
frequencyDomainBodyAccelerometerJerkMagnitudeMean 
frequencyDomainBodyAccelerometerJerkMagnitudeStandardDeviation 
frequencyDomainBodyAccelerometerJerkMagnitudeMeanFrequency 
frequencyDomainBodyGyroscopeMagnitudeMean 
frequencyDomainBodyGyroscopeMagnitudeStandardDeviation 
frequencyDomainBodyGyroscopeMagnitudeMeanFrequency 
frequencyDomainBodyGyroscopeJerkMagnitudeMean
frequencyDomainBodyGyroscopeJerkMagnitudeStandardDeviation 
frequencyDomainBodyGyroscopeJerkMagnitudeMeanFrequency

**Transformations**

The zip file containing the source data is located at 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The following transformations were applied to the source data:

The training and test sets were merged to create one data set.

The measurements on the mean and standard deviation (i.e. signals containing the strings mean and std) were extracted for each measurement, and the others were discarded.

The activity identifiers (originally coded as integers between 1 and 6) were replaced with descriptive activity names (see Identifiers section).

The variable names were replaced with descriptive variable names (e.g. tBodyAcc-mean()-X was expanded to timeDomainBodyAccelerometerMeanX), 
using the following set of rules: 
Special characters (i.e. (, ), and -) were removed 
The initial f and t were expanded to frequencyDomain and timeDomain respectively. 
Acc, Gyro, Mag, Freq, mean, and std were replaced with Accelerometer, Gyroscope, Magnitude, Frequency, Mean, and StandardDeviation respectively. 
Replaced (supposedly incorrect as per source's features_info.txt file) BodyBody with Body.

From the data set in step 4, the final data set was created with the average of each variable for each activity and each subject.

The collection of the source data and the transformations listed above were implemented by the run_analysis.R R script (see README.md file for usage instructions).

