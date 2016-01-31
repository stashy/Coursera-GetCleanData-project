 
# Read tables and combine test and train Into Main

#subject Ids 
read.table("train/subject_train.txt")->strn  # subject list 
read.table("test/subject_test.txt")->stst
subjectid<-rbind(strn,stst)
# Column headings for main
read.table("features.txt")->feat    
# Activity lables 
read.table("activity_labels.txt")->activ  
# Main measurments 
read.table("train/X_train.txt")->xtrn   
read.table("test/X_test.txt")->xtst
main<-rbind(xtrn,xtst)
# y are activity codes
read.table("train/y_train.txt")->ytrn  
read.table("test/y_test.txt")->ytst
ycodes<-rbind(ytrn,ytst)

library(dplyr)
library(tidyr)

# feat is column labels for maindata set 
names(main)<-feat[,2]
#desired features are those with name "mean" or "std" but not "Freq"
desFeat<-feat[(grepl("mean()",feat[ ,2]) 
               | grepl("std()",feat[ ,2]))
              &!grepl("Freq",feat[ ,2]),]
# Narrow Main so we Keep only columns with desired Features
main2<-main[,desFeat[ ,1]]
# y set has activity codes. give these names and merge to mainset2
activity<-merge(activ,ycodes)[ ,2]
main3<-cbind(activity,main2)

# Attach participant ids. 
names(subjectid)<-"subjectid"
main4<-cbind(subjectid,main3)

#get rid of ()'s in col names
gsub("\\(\\)","",names(main4))->names(main4)

# Arrange Main so that each col measurment is a separate observation 
gather(main4,meas_type,meas,-c(activity,subjectid))->FinalMain
# This "FinalMain" dataset has Four Columns-- subjectID, Activity, Meas_type and Measure

#Get a summary tidy dataset of means by subjectid, activity and meas type
tbl_df(FinalMain)%>%filter(grepl("mean",meas_type)) 
%>%group_by(subjectid,activity,meas_type)%>% summarize(average=mean(meas))->summary

write.table(summary,file="./tidy.txt",row.name=FALSE)



