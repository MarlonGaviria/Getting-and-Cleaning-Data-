# Training Datasets
subjectTr <- read.table('UCI HAR Dataset/train/subject_train.txt')
TrainX <- read.table('UCI HAR Dataset/train/X_train.txt')
TrainY <- read.table('UCI HAR Dataset/train/y_train.txt')
# Testing Datasets
subjectTs <- read.table('UCI HAR Dataset/test/subject_test.txt')
TestX <- read.table('UCI HAR Dataset/test/X_test.txt')
TestY <- read.table('UCI HAR Dataset/test/y_test.txt')

# 1)

Train <- data.frame(TrainX,TrainY,subjectTr);names(Train) <- c(names(TrainX),'y','subject')

Test <- data.frame(TestX,TestY,subjectTs);names(Test) <- c(names(TestX),'y','subject')

DataSet <- rbind(Train,Test)

# 2)

feature <- read.table('UCI HAR Dataset/features.txt')
DTmean_sqt <- DataSet[,c(grep('mean',feature$V2),grep('std',feature$V2))]

# 3)

DTmean_sqt <- cbind(DTmean_sqt,y=DataSet$y,subject=DataSet$subject)
DTmean_sqt$y <- as.factor(DTmean_sqt$y)
levels(DTmean_sqt$y) <- c('WALKING','WALKING_UPSTAIRS','WALKING_DOWNSTAIRS','SITTING','STANDING','LAYING')

# 4)

names(DTmean_sqt) <- c(feature$V2[c(grep('mean',feature$V2),grep('std',feature$V2))],'y','subject')

names(DTmean_sqt) <- gsub(pattern = '^t',replacement = 'time',x = names(DTmean_sqt))

names(DTmean_sqt) <- gsub(pattern = '^f',replacement = 'frequency',x = names(DTmean_sqt))

names(DTmean_sqt) <- gsub(pattern = 'Gyro',replacement = 'Gyroscope',x = names(DTmean_sqt))

names(DTmean_sqt) <- gsub(pattern = 'Mag',replacement = 'Magnitud',x = names(DTmean_sqt))

names(DTmean_sqt) <- gsub(pattern = 'BodyBody',replacement = 'Body',x = names(DTmean_sqt))

names(DTmean_sqt) <- gsub(pattern = 'Acc',replacement = 'Accelerometer',x = names(DTmean_sqt))

# 5)

library(tidyverse)

DT_Group <- DTmean_sqt %>% group_by(y,subject) %>% summarise_all(mean)

write.csv(DT_Group,'tidydata.txt')


                            