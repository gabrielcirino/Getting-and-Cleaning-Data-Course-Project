# Install and load necessary packages
if (!require("dplyr")) install.packages("dplyr")
if (!require("tidyr")) install.packages("tidyr")
if (!require("data.table")) install.packages("data.table")
library(dplyr)
library(tidyr)
library(data.table)

# Set the path to the dataset
dataset_path <- "./UCI HAR Dataset"

# Load datasets
X_train <- read.table(file.path(dataset_path, "train/X_train.txt"))
y_train <- read.table(file.path(dataset_path, "train/y_train.txt"))
subject_train <- read.table(file.path(dataset_path, "train/subject_train.txt"))

X_test <- read.table(file.path(dataset_path, "test/X_test.txt"))
y_test <- read.table(file.path(dataset_path, "test/y_test.txt"))
subject_test <- read.table(file.path(dataset_path, "test/subject_test.txt"))

# Merge datasets
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# Load the features information and extract the measurements on the mean and standard deviation
features <- read.table(file.path(dataset_path, "features.txt"), stringsAsFactors = FALSE)
mean_std_features <- grep("mean\\(\\)|std\\(\\)", features$V2)

X <- X[, mean_std_features]

# Load the activity labels and replace the activity IDs with descriptive activity names
activity_labels <- read.table(file.path(dataset_path, "activity_labels.txt"), stringsAsFactors = FALSE)
y$V1 <- factor(y$V1, levels = activity_labels$V1, labels = activity_labels$V2)

# Name the columns with descriptive variable names
names(X) <- gsub("\\(\\)|-", "", features$V2[mean_std_features])
names(subject) <- "Subject"
names(y) <- "Activity"

# Combine the data sets
data <- cbind(subject, y, X)

# Create a Tidy Data Set
tidy_data <- data %>%
  group_by(Subject, Activity) %>%
  summarise_all(mean, na.rm = TRUE)

# Write the tidy data set to a text file
write.table(tidy_data, file = "tidy_data.txt", row.name = FALSE)



