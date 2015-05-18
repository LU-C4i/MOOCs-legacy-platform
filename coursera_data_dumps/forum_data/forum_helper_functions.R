'
This script contains all the helper functions used on the forum data that Coursera supplied us with.

Written by: Jasper Ginn (j.h.ginn@cdh.leidenuniv.nl)
Date: 23-03-2015
'

# PREPROCESS FUNCTIONS --------

'
FUNCTION 1: Convenience function that converts Unix timestamps into date/time stamps
'
convertunixtm <- function(object) {
  return(as.POSIXct(as.numeric(as.character(object)),
             origin="1970-01-01",tz="GMT"))
  
}

'
FUNCTION 3: Strip all html tags from text (source: http://stackoverflow.com/questions/17227294/removing-html-tags-from-a-string-in-r)
'
removehtml <- function(htmlString) {
  return(gsub("<.*?>", " ", htmlString))
}

'
FUNCTION 4: Strip all URLs from a string and replace with ""
'
removeurl <- function(string) {
  return(gsub("(f|ht)tp(s?)://(.*)[.][a-z]+", "", string))
}
'
FUNCTION 5: Remove common terms
'
removeCommonTerms <- function (x, pct) 
{
  stopifnot(inherits(x, c("DocumentTermMatrix", "TermDocumentMatrix")), 
            is.numeric(pct), pct > 0, pct < 1)
  m <- if (inherits(x, "DocumentTermMatrix")) 
    t(x)
  else x
  t <- table(m$i) < m$ncol * (pct)
  termIndex <- as.numeric(names(t[t]))
  if (inherits(x, "DocumentTermMatrix")) 
    x[, termIndex]
  else x[termIndex, ]
}