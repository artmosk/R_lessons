At the start of code we read activity_labels.txt and remove ID column 

Next step we read features.txt and remove ID column

... read test/subject_test.txt

... read test/X_test.txt with column names from features.txt file

... read test/y_test.txt


... read train/subject_train.txt

... read train/X_train.txt with column names from features.txt file

... read train/y_train.txt


Concatenate X_test and X_train -> X

Concatenate y_train and y_test -> y

Concatenate subject_test and subject_train -> subject


Getting all mean and standard deviation name values -> X_tidy

Getting average of each variable for each activity and each subject -> X_tidy_avg 


Saving tidy data (X_tidy) to X_tidy.csv

Saving tidy_avg data (X_tidy_avg) to X_tidy_avg.csv