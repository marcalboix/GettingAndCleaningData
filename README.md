##Readme

### 
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis.  
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.  
A full description is available at the site where the data was obtained: 

- http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

Here are the data for the project: 
- https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The R script file run_analysis.R does the following:  

- Set working directory.
- Download and unzip the source data files.
- Load train and test data, i.e. subjects, activities and measures into datatables.
- Extract only mean() and standard deviation sd() data.
- Calculate column means grouped by subject and activity.
- Write resulting datatable to disk.

The results file after process the script is named: AverageDataset.txt

