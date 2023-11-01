install.packages(c("dplyr", "tidyr", "data.table"))
library(dplyr)
library(tidyr)
library(data.table)

# Load datasets
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Merge datasets
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# Load the features information and extract the measurements on the mean and standard deviation.
features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
mean_std_features <- grep("mean\\(\\)|std\\(\\)", features$V2)

X <- X[, mean_std_features]

# Load the activity labels and replace the activity IDs with descriptive activity names.
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
y <- activity_labels[y$V1, 2]

# Name the columns with descriptive variable names.
names(X) <- gsub("\\()", "", gsub("-", "", features$V2[mean_std_features]))
names(subject) <- "Subject"
names(y) <- "Activity"

# Combine the data sets
data <- cbind(subject, y, X)


# Create a Tidy Data Set
data$Activity <- factor(data$Activity, levels = activity_labels$V1, labels = activity_labels$V2)

tidy_data <- data %>%
  group_by(Subject, Activity) %>%
  summarise_all(mean, na.rm = TRUE)

# Write the tidy data set to a text file
write.table(tidy_data, file = "tidy_data.txt", row.name = FALSE)


# Write the tidy data set to a text file
write.table(tidy_data, file = "tidy_data.txt", row.name = FALSE)

