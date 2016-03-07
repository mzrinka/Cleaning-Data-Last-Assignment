####################################
## Set directories #################
####################################

train_dir<-"/UCI HAR Dataset/train/"
test_dir<-"/UCI HAR Dataset/test/"

###################################################
#### Read in basic data    ########################
###################################################
features<-read.table(paste(getwd(),"/UCI HAR Dataset/features.txt",sep=""))
activity_label<-read.table(paste(getwd(),"/UCI HAR Dataset/activity_labels.txt",sep=""))
colnames(activity_label)<-c("activity","activity_label")

###################################################
#### Read in training data ########################
###################################################
x_train<-read.table(paste(getwd(),train_dir,"X_train.txt",sep=""))
y_train<-read.table(paste(getwd(),train_dir,"y_train.txt",sep=""))
subject_train<-read.table(paste(getwd(),train_dir,"subject_train.txt",sep=""))

###################################################
#### Read in test data ########################
###################################################
x_test<-read.table(paste(getwd(),test_dir,"X_test.txt",sep=""))
y_test<-read.table(paste(getwd(),test_dir,"y_test.txt",sep=""))
subject_test<-read.table(paste(getwd(),test_dir,"subject_test.txt",sep=""))




######################################################
###selecting the mean and std from each dataset   ####
######################################################
colnames(x_train)<-features[,2]
x_train_mean<-x_train[,grepl("mean",names(x_train))]
x_train_std<-x_train[,grepl("std",names(x_train))]
x_train_new<-cbind(x_train_mean,x_train_std)


colnames(x_test)<-features[,2]
x_test_mean<-x_test[,grepl("mean",names(x_test))]
x_test_std<-x_test[,grepl("std",names(x_test))]
x_test_new<-cbind(x_test_mean,x_test_std)

####################################################
###### create new dataset with label and subject ###
####################################################
train<-x_train_new
train<-cbind(train,y_train)
train<-cbind(train,subject_train)

test<-x_test_new
test<-cbind(test,y_test)
test<-cbind(test,subject_test)

colnames(train)[80:81]<-c("activity","subject")
train_new<-merge(train,activity_label,by="activity")

colnames(test)[80:81]<-c("activity","subject")
test_new<-merge(test,activity_label,by="activity")

full_data<-rbind(test_new,train_new)
small_data<-aggregate(.~subject+activity,FUN=mean,data=full_data)

write.table(full_data,paste(getwd(),"/full_data.txt",sep=""),row.name=FALSE)
write.table(small_data,paste(getwd(),"/small_data.txt",sep=""),row.name=FALSE)