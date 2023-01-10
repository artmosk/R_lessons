activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("ID", "ActivityLabel"))
activity_labels$ID <- NULL
head(activity_labels)

features <- read.table("UCI HAR Dataset/features.txt", col.names = list("ID", "FEATURE"))
features$ID <- NULL
head(features)

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = c("Subject"))
head(subject_test)
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names=features$FEATURE)
head(X_test)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names=c("Activity"))
head(y_test)

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = c("Subject"))
head(subject_train)
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names=features$FEATURE)
head(X_train)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names=c("Activity"))
head(y_train)

X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

head(X)
head(y)

col_names <- names(X)

std_mean_cols <- append(col_names[grepl("std()", col_names)], col_names[grepl("mean()", col_names)])
X_tidy <- X[std_mean_cols]
head(X_tidy)
nrow(X_tidy)

X_tidy_avg <- aggregate(X_tidy, FUN=mean, by=list(Activity=y$Activity, Subject=subject$Subject))
X_tidy_avg <- merge(activity_labels, X_tidy_avg, by.y = "Activity", by.x = 0)
X_tidy_avg$Row.names <- NULL
head(X_tidy_avg)

write.table(X_tidy, "X_tidy.txt", row.name=FALSE)
write.table(X_tidy_avg, "X_tidy_avg.txt", row.name=FALSE)
