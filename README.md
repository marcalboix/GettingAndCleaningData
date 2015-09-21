#Readme file
##Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 
<br><br>
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
<br>
A full description is available at the site where the data was obtained: 
<li>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</li>
Here are the data for the project: 
<li>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</li>
<br>
The R script file run_analysis.R does the following:
<ul>
    <li>Set working directory.</li>
    <li>Download and unzip the source data files.</li>
    <li>Load train and test data, i.e. subjects, activities and measures into datatables.</li>
    <li>Extract only mean() and standard deviation sd() data.</li>
    <li>Calculate column means grouped by subject and activity.</li>
    <li>Write resulting datatable to disk.</li>
</ul>
The results file after process the script is named: AverageDataset.txt
<br>
The code is well structured and documented.
<br>
