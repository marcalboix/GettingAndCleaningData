# CodeBook for Course Project GettingAndCleaningData

The raw data for this project is accelerometer data collected from the Samsung Galaxy S smartphone, and was provided  at the links below:

<li>
    <ul>Data file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</ul>
    <ul>CodeBook: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</ul>
</li>

This data included both the raw sampled data (folder ../Inertial Signals) and features apparently based on the raw data. For the purpose of this project, I am only looking at the features, not the raw data.

There are 3 types of files:
<li>
<ul>x: rows of feature measurements</ul>
<ul>y: the activity labels corresponding to each row of X. Encoded as numbers.</ul>
<ul>subject: the subjects on which each row of X was measured. Encoded as numbers.</ul>
</li>
In addition, to determine which features are required, we look at the list of features:
<li>
<ul>features.txt</ul>
</li>
The encoding from activity labels ids to descriptive names.
<li>
    <ul>activity_labels.txt</ul>
</li>
