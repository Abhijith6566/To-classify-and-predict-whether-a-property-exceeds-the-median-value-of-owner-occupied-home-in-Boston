library(randomForest)
library(ISLR)
library(caret)
library(dplyr)
library(ggplot2)
Ac_df<- read.csv("C:/Users/asibh/OneDrive/Desktop/Fall 2021/ADBA/BostonHousing.csv",na.string=c("NA",""))
str(Ac_df)
summary(Ac_df)
AC_df1<-subset(Ac_df,select=-c(MEDV))
cor(AC_df1)
AC_df1<-AC_df1%>%rename(MEDV=CAT..MEDV)

str(AC_df1)
AC_df1$MEDV<-as.factor(AC_df1$MEDV)

set.seed(101)
trainInd<-createDataPartition(AC_df1$MEDV,p=0.7,list=FALSE,times=1)
train_ac<-AC_df1[trainInd,]
valid_ac<-AC_df1[-trainInd,]

#Random Forest 

Ac_rfd<-train(MEDV~.,data=train_ac,method='rf',metric='Accuracy',ntree=100)
print(Ac_rfd)
tuneGrid<- expand.grid(.mtry=c(1:12))

AC_rfmtry<-train(MEDV~.,data=train_ac,method='rf',tuneGrid=tuneGrid,importance=TRUE,ntree=100)
print(AC_rfmtry)


AC_pred<- predict(AC_rfmtry,valid_ac)
confusionMatrix(AC_pred,valid_ac$MEDV)

varImp(AC_rfmtry)

#SVM

trControl<-trainControl(method='cv',number=10,search='grid')

AC_svm_lin<-train(MEDV~.,data=train_ac,method='svmLinear',trControl=trControl,preProcess=c('center','scale'))
print(AC_svm_lin)


linear_pred<-predict(AC_svm_lin,valid_ac)
confusionMatrix(linear_pred,valid_ac$MEDV)


#Using SVM kernel function

svm_radial<-train(MEDV~.,train_ac,method='svmRadial',trControl=trControl,preProcess=c('center','scale'))
print(svm_radial)
radial_pred<-predict(svm_radial,valid_ac)
confusionMatrix(radial_pred,valid_ac$MEDV)


#More tuning

AC_grid_radial <- expand.grid(sigma=c(0,0.75,1,1.3,1.5,1.75),
                             C=c(0,0.1,0.2,0.25,0.5,0.75,1))

AC_svm_radial_tune <- train(MEDV~.,
                           data= train_ac,
                           method='svmRadial',
                           trControl=trControl,
                           preProcess=c('center','scale'),
                           tuneGrid = AC_grid_radial)
print(AC_svm_radial_tune)

AC_radial_tune_pred <- predict(AC_svm_radial_tune,valid_ac)
confusionMatrix(AC_radial_tune_pred,valid_ac$MEDV)