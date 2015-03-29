library(tm)
library(qdap)
library(RWeka)
library(wordcloud)


# file name of the data
files.blogs <- "E:\\Coursera-SwiftKey\\final\\en_US\\en_US.blogs.txt"
files.twitter <- "E:\\Coursera-SwiftKey\\final\\en_US\\en_US.twitter.txt"
files.news <- "E:\\Coursera-SwiftKey\\final\\en_US\\en_US.news.txt"

files.small_def <- 256

# small data set
sb <- readLines(file(files.blogs,"r"),encoding = "UTF-8", files.small_def)
sn <- readLines(file(files.news,"r"),encoding = "UTF-8", files.small_def)
st <- readLines(file(files.twitter,"r"),encoding = "UTF-8", files.small_def)
small <- paste(st, sn,sb)
rm(list=c("sb","sn","st"))
small <- sent_detect(small, language = "en", model = NULL) #qdap::sentence split

## if we were to remove profanity, we first grab a list of profane words
profanity <- "http://github.com/shutterstock/List-of-Dirty-Naughty-Obscene-and-Otherwise-Bad-Words/raw/master/en"


scorpus <- VCorpus(VectorSource(small))

banned <- VectorSource(readLines(url(profanity)))

scorpus.cleaned <- tm_map(scorpus, removeWords, banned) # simply remove occurances of those words

# term document matrix
tdm <-TermDocumentMatrix(scorpus.cleaned)
inspect(tdm[1:2,1:2])

tmatrix <- as.matrix(tdm) # marshal as matrix

set.seed(124) # setting pseudo random seed

## fancy display
wordcloud(rownames(tmatrix),rowSums(tmatrix),min.freq=1, max.words=200,colors=brewer.pal(6,"Dark2"))

### exploration ###
# building training set with a little larger set than the descrpitive set
files.medium_def <- 10000

mb <- readLines(file(files.blogs,"r"),encoding = "UTF-8", files.medium_def)
mn <- readLines(file(files.news,"r"),encoding = "UTF-8", files.medium_def)
mt <- readLines(file(files.twitter,"r"),encoding = "UTF-8", files.medium_def)

medium <- paste(mb, mt, mn)
rm(list=c("mb","mn","mt"))
dataset.medium <- sent_detect(medium, language = "en", model = NULL) #qdap::sentence split

corpus.medium <- VCorpus(VectorSource(dataset.medium))

# removing profanities from traning set will result in biased prediction. the better approach here is
# to censor the profanities at last minute e.g "bad" -> "!#@$"

## another pointer to preprocessing: https?
corpus.medium.processed <- gsub("https?://\\w+", "", corpus.medium)
delimiter <- " \\r\\n\\t.,;:\"()?!"

## building ngram
ngram.single_token <- NGramTokenizer(corpus.medium.processed, Weka_control(min = 1, max = 1))
ngram.triple <- NGramTokenizer(corpus.medium.processed, Weka_control(min=3, max=3, delimiters = delimiter))
