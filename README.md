# Human Activity Recognition Using Smartphones Data Set Analysis

This repository contains the R script and documentation for cleaning and analyzing the Human Activity Recognition Using Smartphones Data Set.

## Files

- `run_analysis.R`: The main R script that performs the data cleaning and analysis.
- `CodeBook.md`: Describes the variables, the data, and the transformations performed to clean up the data.
- `README.md`: This file, explains how all the scripts work and how they are connected.
- `tidy_data.txt`: The final tidy dataset.

## How to Run

1. Ensure that you have R installed on your system.
2. Install the required R packages: dplyr, data.table.
3. Download the Human Activity Recognition Using Smartphones dataset and extract it. Ensure the dataset is in your working directory or adjust the `dataset_path` variable in the script accordingly.
4. Run the `run_analysis.R` script.

## Script Workflow

1. **Setup**: Load required libraries and set the path to the dataset.
2. **Load Data**: Read in the training and test datasets, as well as the feature and activity info.
3. **Merge Data**: Combine the training and test datasets.
4. **Extract Mean and Std Dev Data**: Extract only the measurements on the mean and standard deviation for each measurement.
5. **Use Descriptive Activity Names**: Use descriptive activity names instead of numeric codes.
6. **Label Variables**: Clean up and label the dataset's variables.
7. **Create Tidy Dataset**: Create a second, independent tidy dataset with the average of each variable for each activity and each subject.
8. **Output**: Write the tidy dataset to `tidy_data.txt`.

## Dependencies

This script is dependent on the dplyr and data.table R packages.
