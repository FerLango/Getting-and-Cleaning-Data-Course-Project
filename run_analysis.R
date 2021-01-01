library(dplyr)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "data.zip")
unzip("data.zip")

labels <- read.table("UCI HAR Dataset/activity_labels.txt", 
                     col.names = c("id", "activities"))
features <- read.table("UCI HAR Dataset/features.txt", 
                       col.names = c("index", "feature"))

wanted <- grepl("mean|std", features$feature)
wanted_names <- features$feature[wanted]

#Train
training_set <- read.table("UCI HAR Dataset/train/X_train.txt")
training_labels <- read.table("UCI HAR Dataset/train/y_train.txt",
                              col.names = "activity")
traning_subject <- read.table("UCI HAR Dataset/train/subject_train.txt",
                              col.names = "performer")

training_set <- training_set %>% 
                select(which(wanted))
colnames(training_set) <- wanted_names                

training <- cbind(training_labels, traning_subject, training_set)

#Test
testing_set <- read.table("UCI HAR Dataset/test/X_test.txt")
testing_labels <- read.table("UCI HAR Dataset/test/y_test.txt",
                              col.names = "activity")
testing_subject <- read.table("UCI HAR Dataset/test/subject_test.txt",
                              col.names = "performer")

testing_set <- testing_set %>% 
               select(which(wanted))
colnames(testing_set) <- wanted_names                

testing <- cbind(testing_labels, testing_subject, testing_set)

#Merge
merged <- rbind(training, testing)
merged <- merge(labels, merged, by.x = "id", by.y = "activity") 
merged <- select(merged, -(id))  

#Second tidy dataset
tidy <- merged %>% 
    group_by(activities, performer) %>% 
    summarise_all(mean)

write.table(tidy, "tidy.txt", row.name = FALSE)         

    
    
    
    
    
    
    

