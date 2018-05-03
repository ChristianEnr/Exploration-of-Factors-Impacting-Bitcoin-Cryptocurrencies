
 

Exploration of Factors Impacting Bitcoin/Cryptocurrencies
=======
This folder contains my final project for INFO 550 Software Engineering, a exploration of data relating to
the Cyptocurrency phenomenon. The bulk of the project deals with sentiment analysis but also general clustering and trends.
------------------------------------------------------------------------------------------------
##Intent:

To document my use of techniques learned in INFO 550 to explore and learn about cryptocurrencies.  
------------------------------------------------------------------------------------------------
##Software:

All code is in R markdown files, coded using R programming language.
------------------------------------------------------------------------------------------------
##Contents:

INFO550 Write-Up.docx:Overview of Project and main findings

Intro.Rmd: Crypto package, and code to generate graphs of cryptocurrencies closing prices.

Cluster.Rmd: Functions to generate time series cluster graphs from dataframes generated 
from the crypto package 

LanguageProcessing.Rmd: Sentiment Analysis functions and word cloud functions. Functions 
specific to dataframes returned from the rtimes package, but are easily modifiable for any 
character vector. 

ForumWebScraper.Rmd:
Functions to web scrape Bitcointalk.org, and word cloud funtions for the corresponding output. Modifiable for 
most online forums.

TwitterAPI: Sentiment Analysis functions. Functions 
specific to dataframes returned from the rtweet package, modified from the functions in LanguageProcessing.Rmd. 
Correlation plots with sentiment analysis from tweets and data generated from crypto package.