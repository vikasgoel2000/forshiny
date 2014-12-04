library(stringr)
library(tm)
load("final.rdata")

predict<-function(input)
{
str<-input
# user input

str<-gsub("[^a-zA-Z\n\']", " ", str) # it will remove numbers and special characters and punctuations
str<-tolower(str)

corpus = Corpus(VectorSource(str))

corpus <- tm_map(corpus, stripWhitespace)
corpus = tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, stripWhitespace)
badwords <- VectorSource(readLines("badwords.txt"))
corpus = tm_map(corpus, removeWords, badwords)
corpus <- tm_map(corpus, stripWhitespace)
trim <- function (x) gsub("^\\s+|\\s+$", "", x)
corpus <- tm_map(corpus, trim)
corpus <- tm_map(corpus, PlainTextDocument)

str= data.frame(text=unlist(sapply(corpus, `[`, "content")), stringsAsFactors=FALSE)
m <- str_match_all( str$text, "\\S+" )
m<-data.frame(m)
count<-length(m[[1]])

rm(corpus)

if (count >=4)
{
forng5<-paste(m[(count-3):count,], collapse=" ")
subpred<-subset(ng5,grepl(paste("^",forng5,sep=""), ng5$Var1))
forpred<-subpred[which.max(subpred$Freq),][1]
x<-strsplit(forpred[1,],' ')
y<-as.data.frame(x,stringsAsFactors=FALSE)
pred<-y[5,] # final prediction words
if (paste(pred)=="NA")
{
forng4<-paste(m[(count-2):count,], collapse=" ")
subpred<-subset(ng4,grepl(paste("^",forng4,sep=""), ng4$Var1))
forpred<-subpred[which.max(subpred$Freq),][1]
x<-strsplit(forpred[1,],' ')
y<-as.data.frame(x,stringsAsFactors=FALSE)
pred<-y[4,] # final prediction words
if (paste(pred)=="NA")
{
forng3<-paste(m[(count-1):count,], collapse=" ")
subpred<-subset(ng3,grepl(paste("^",forng3,sep=""), ng3$Var1))
forpred<-subpred[which.max(subpred$Freq),][1]
x<-strsplit(forpred[1,],' ')
y<-as.data.frame(x,stringsAsFactors=FALSE)
pred<-y[3,] # final prediction words
if (paste(pred)=="NA")
{
forng2<-paste(m[count,], collapse=" ")
subpred<-subset(ng2,grepl(paste("^",forng2,sep=""), ng2$Var1))
forpred<-subpred[which.max(subpred$Freq),][1]
x<-strsplit(forpred[1,],' ')
y<-as.data.frame(x,stringsAsFactors=FALSE)
pred<-y[2,] # final prediction words
if (paste(pred)=="NA")
{
paste("No Prediction Found")
}
}
}
}
}

if (count == 3)
{
forng4<-paste(m[(count-2):count,], collapse=" ")
subpred<-subset(ng4,grepl(paste("^",forng4,sep=""), ng4$Var1))
forpred<-subpred[which.max(subpred$Freq),][1]
x<-strsplit(forpred[1,],' ')
y<-as.data.frame(x,stringsAsFactors=FALSE)
pred<-y[4,] # final prediction words
if (paste(pred)=="NA")
{
forng3<-paste(m[(count-1):count,], collapse=" ")
subpred<-subset(ng3,grepl(paste("^",forng3,sep=""), ng3$Var1))
forpred<-subpred[which.max(subpred$Freq),][1]
x<-strsplit(forpred[1,],' ')
y<-as.data.frame(x,stringsAsFactors=FALSE)
pred<-y[3,] # final prediction words
if (paste(pred)=="NA")
{
forng2<-paste(m[count,], collapse=" ")
subpred<-subset(ng2,grepl(paste("^",forng2,sep=""), ng2$Var1))
forpred<-subpred[which.max(subpred$Freq),][1]
x<-strsplit(forpred[1,],' ')
y<-as.data.frame(x,stringsAsFactors=FALSE)
pred<-y[2,] # final prediction words
if (paste(pred)=="NA")
{
paste("No Prediction Found")
}
}
}
}

if (count == 2)
{
forng3<-paste(m[(count-1):count,], collapse=" ")
subpred<-subset(ng3,grepl(paste("^",forng3,sep=""), ng3$Var1))
forpred<-subpred[which.max(subpred$Freq),][1]
x<-strsplit(forpred[1,],' ')
y<-as.data.frame(x,stringsAsFactors=FALSE)
pred<-y[3,] # final prediction words
if (paste(pred)=="NA")
{
forng2<-paste(m[count,], collapse=" ")
subpred<-subset(ng2,grepl(paste("^",forng2,sep=""), ng2$Var1))
forpred<-subpred[which.max(subpred$Freq),][1]
x<-strsplit(forpred[1,],' ')
y<-as.data.frame(x,stringsAsFactors=FALSE)
pred<-y[2,] # final prediction words
if (paste(pred)=="NA")
{
paste("No Prediction Found")
}
}
}


if (count <= 1)
{
forng2<-paste(m[count,], collapse=" ")
subpred<-subset(ng2,grepl(paste("^",forng2,sep=""), ng2$Var1))
forpred<-subpred[which.max(subpred$Freq),][1]
x<-strsplit(forpred[1,],' ')
y<-as.data.frame(x,stringsAsFactors=FALSE)
pred<-y[2,] # final prediction words
if (paste(pred)=="NA")
{
paste("No Prediction Found")
}
}

if (count == 0)
{
pred<-"NA" # final prediction words
if (paste(pred)=="NA")
{
paste("No Prediction Found")
}
}
return(pred)
}