# Getting-and-Cleaning-Data-Course-Project
Author: Fernando Lango

## Content
1) a tidy data set as described below 
2) a link to a Github repository with your script for performing the analysis
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md

## Analysis file
1. Download and unzip data
2. Load labels and features
    - Get mean and std features
3. Load training set 
    - load set, labels, subject
    - select columns from features we want
    - merge dataframes
4. Load test set 
    - load set, labels, subject
    - select columns from features we want
    - merge dataframes
5. Merge training, test
6. Change activity id to name
7. Get tidy set
    - Group by activites and performer
    - Get mean
    - Save tidy set
