library(caret)
library(randomForest)
urlTrainData = "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
urlTestData = "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"
dataDirectory = "data"
sourceData = file.path(dataDirectory,"StormData.csv.bz2")
loadData = function(url, filename) {
  if (!file.exists(filename)) {
    download.file(url, filename, method = "curl", mode = "w")
    dateDownloaded <- date()
    if (!file.exists(filename)) {
      stop(paste("Unable to download file from:",url))
    }
  }
  return(read.csv(filename, strip.white=TRUE))
}
train_org = loadData(urlTrainData,"pml-training.csv")
test_org = loadData(urlTestData,"pml-testing.csv")

# filtering out data
zero = nearZeroVar(train_org)
nas = which(as.numeric(colSums(is.na(train_org))) > 5000)
col_index = -sort(unique(c(zero,nas)))
row_index = createDataPartition(y=train_org$classe, p=.7, list=F)
train = train_org[row_index,col_index]
validate = train_org[-row_index,]
train$X = NULL
train$raw_timestamp_part_1 = NULL
train$raw_timestamp_part_2 = NULL
train$num_window = NULL
train$user_name = NULL
train$cvtd_timestamp = NULL

# Out of sample error
oose = NULL
#modFit = train(classe~.,data=train,method="gbm")
modFit = randomForest(classe~.,data=train)
table(predict(modFit,validate),validate$classe)

answers = as.character(predict(modFit,test))
pml_write_files = function(x){
  n = length(x)
  for(i in 1:n){
    filename = paste0("problem_id_",i,".txt")
    write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
  }
}

#pml_write_files(answers)