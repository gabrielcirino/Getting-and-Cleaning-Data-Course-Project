# CodeBook

This codebook describes the variables, the data, and the transformations performed to clean up the data for the Human Activity Recognition Using Smartphones Data Set.

## Source Data

- **Activity Labels**: Links the class labels with their activity names.
- **Features**: Signals used to estimate variables. 
- **Train and Test Data**: The dataset includes training and test datasets, each containing:
  - **Subject**: An identifier of the subject who carried out the experiment.
  - **X**: Sensor signal data.
  - **y**: Activity label.

## Transformations

1. **Merging Training and Test Data**: The training and test datasets were combined to create one data set.
2. **Extracting Mean and Standard Deviation Measurements**: All measurements not concerning mean or standard deviation were discarded.
3. **Using Descriptive Activity Names**: Activity IDs were replaced with descriptive activity names.
4. **Labeling Data with Descriptive Variable Names**: Variable names were cleaned and made more descriptive.
5. **Creating a Tidy Dataset**: A new tidy dataset was created, including the average of each variable for each activity and each subject.

## Variables

- **Subject**: Identifier, ranges from 1 to 30.
- **Activity**: Type of activity performed during the measurements. 
- **Other Variables**: All other variables represent the mean or standard deviation of sensor signals. 

## Tidy Data

The final tidy dataset is saved as `tidy_data.txt` and includes the average of each variable for each activity and each subject.
