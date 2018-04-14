
#setting up web scrapping using rtimes


library(rtimes)

#AS IS ARTICLE SEARCH API

Sys.setenv(NYTIMES_AS_KEY = "b4969dfbe67548568bf022335e4bd5fb")
  
bit <- as_search(q="bitcoin", begin_date = "20100101", end_date = '20180401', all_results = TRUE)  

crypt <- as_search(q="cryptocurrency", begin_date = "20100101", end_date = '20180401', all_results = TRUE)  


#bitcoin yields more data points (1154 to cryto's 125)

#want to use sentiment analysis to rate headlines

#bring in tm_cleaner function

tm_cleaner <- function(corpus, stop=stopwords("en"), rm_num=TRUE) {
  require(tm)
  corpus <- tm_map(corpus, stripWhitespace)
  corpus <- tm_map(corpus, removeNumbers)
  corpus <- tm_map(corpus, content_transformer(tolower))
  corpus <- tm_map(corpus, removeWords, stop)
  corpus <- tm_map(corpus, removePunctuation)
  corpus <- tm_map(corpus, content_transformer(function(x) gsub("http\\w+", "", x)))
  return(corpus)
}


#created function to generate dataframes of sentiment analysis with diffrent dictionarys
#where 
#"dataNYT" is a dataframe generated from rtimes. 


sentimentoutput <- function(dataNYT)  {
  
library(rvest)
library(SentimentAnalysis)
library(stringr)
library(dplyr)
library(tm)

data <-  dataNYT$data   
  
headlines <- data$headline.main

headlinecorpus <- Corpus(VectorSource(headlines))

headlineclean <- tm_cleaner(headlinecorpus)

sentimentnum <- analyzeSentiment(headlineclean)

GI <-convertToBinaryResponse(sentimentnum$SentimentGI)
LM <-convertToBinaryResponse(sentimentnum$SentimentLM)
QDAP <-convertToBinaryResponse(sentimentnum$SentimentQDAP)

headlineoriginal <- factor(data$headline.main)

GI_num <- ifelse(GI =="positive",1,-1) 
LM_num <- ifelse(LM =="positive",1,-1) 
QDAP_num <- ifelse(QDAP =="positive",1,-1) 

analysis <- data.frame(Score=factor(GI_num + LM_num + QDAP_num),
  GI=factor(GI),
  LM=factor(LM),
  QDAP=factor(QDAP),
  Headline=factor(data$headline.main),
  date=as.Date(data$pub_date),
  stringsAsFactors=FALSE)

return(analysis)

}


bitdata <- sentimentoutput(bit)

cryptdata <- sentimentoutput(crypt)

