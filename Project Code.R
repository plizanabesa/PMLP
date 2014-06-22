library(caret)
training<-read.csv("/Users/pedrolizana/Documents/Continous Education/Coursera 2014/Practical Machine Learning/Project/training.csv",header=TRUE)
names(training)
trainingsb<-training[,-c(1,2)]
featurePlot(x=trainingsb[,c(1,2,3,4,5,6,7,53)],y=trainingsb$classe,plot="pairs")
set.seed(33245)
tControl<-trainControl(method="cv",number=20)
modFit<-train(classe~.,method="rf",data=trainingsb,trControl=tControl)
modFit
tree2<-getTree(modFit$finalModel,k=2)
tree1<-getTree(modFit$finalModel,k=1)
varImp(modFit$finalModel)
testing<-read.csv("/Users/pedrolizana/Documents/Continous Education/Coursera 2014/Practical Machine Learning/Project/testing.csv",header=TRUE)
names(testing)
testingsb<-testing[,-c(1,2)]
pred <- predict(modFit,testingsb)
trainingsb2<-trainingsb[,-c(53)]
cor(trainingsb2)