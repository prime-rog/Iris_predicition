library(randomForest)

iris <- iris



TrainingSet <- iris[1:135 , ]
TestingSet <- iris[135:150 , ]

write.csv(TrainingSet , "training.csv")
write.csv(TestingSet , "testing.csv")

TrainSet<-read.csv("training.csv" , header = TRUE)
str(TrainSet)
TrainSet <- TrainSet[,-1]

model <- randomForest(as.factor(Species) ~ ., data = TrainSet, ntree = 500, mtry = 4, importance = TRUE)

saveRDS(model , "model.rds")

