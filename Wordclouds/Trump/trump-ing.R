trumpING <- function () {
  library(tm)
  library(wordcloud)
  library(SnowballC)
  
  
  trump_in <- Corpus(DirSource("trump-in/"))
  trump_in <- tm_map(trump_in, tolower)
  trump_in <- tm_map(trump_in, removePunctuation)
  trump_in <- tm_map(trump_in, removeNumbers)
  trump_in <- tm_map(trump_in, stripWhitespace)
  
  trump_in <- tm_map(trump_in, PlainTextDocument)
  trump_in <- tm_map(trump_in, removeWords, stopwords("english"))
  trump_in <- tm_map(trump_in, content_transformer(gsub), pattern = "americans", replacement = "american")
  trump_in <- tm_map(trump_in, PlainTextDocument)
  
  wordcloud(trump_in, scale=c(9,1), max.words=100, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(5, "Set1"))
}
