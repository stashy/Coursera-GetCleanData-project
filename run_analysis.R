 
# Read tables and combine test and train 

read.table("train/subject_train.txt")->strn  # subject list 
read.table("test/subject_test.txt")->stst
subjectid<-rbind(strn,stst)

read.table("features.txt")->feat      # feature headings 
read.table("activity_labels.txt")->activ  # activity headings 

read.table("train/X_train.txt")->xtrn   #Main Data
read.table("test/X_test.txt")->xtst
main<-rbind(xtrn,xtst)

read.table("train/y_train.txt")->ytrn  # y vect is Activity codes
read.table("test/y_test.txt")->ytst
ycodes<-rbind(ytrn,ytst)

library(dplyr)
library(tidyr)

#feat is column labels for maindata set 
names(main)<-feat[,2]
#desired features are those with name "mean" or "std" but not "Freq"
desFeat<-feat[(grepl("mean()",feat[ ,2]) 
               | grepl("std()",feat[ ,2]))
              &!grepl("Freq",feat[ ,2]),]
# Keep only columns with desired Features
main2<-main[,desFeat[ ,1]]
# y set has activity codes. give these names and merge to mainset2
activity<-merge(activ,ycodes)[ ,2]
main3<-cbind(activity,main2)

# s set has participant ids.  attach these to main dataset 3 
names(subjectid)<-"subjectid"
main4<-cbind(subjectid,main3)

#get rid of ()'s in col names
gsub("\\(\\)","",names(main4))->names(main4)

# Each col measurment is an observation 
gather(main4,meas_type,meas,-c(activity,subjectid))->main5

# Just means data set
JustMeans<-tbl_df(subset(main5,grepl("mean",main5$meas_type)))
JustMeans2<-group_by(JustMeans,subjectid,activity)
JustMeans3<-summarize(JustMeans2,average=mean(meas))
#write tidy dataset 
write.table(JustMeans3,file="./tidy.txt",row.name=FALSE)



