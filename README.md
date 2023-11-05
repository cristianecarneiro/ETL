# Project: ETL

ETL project during Ironhack's Data Analytics BootCamp  

![albums](https://github.com/cristianecarneiro/ETL/tree/main/img/albums.jpg)


## Objectives

The goal of this project is to apply the skills we've developed during Ironhacks's Data Analytics BootCamp in a full ETL process. 

We were given flexibility to choose datasources of our choice, observing the following: 
+ get data from three different sources (the sources should be complementary/enrich each other)
+ use at least two different extraccion methods 

Once we've extracted the data, we proceeded to transform/clean them and load it into a database (SQL or Mongo)

## Data sources  and extraction methods 

The final output of this project consists of a database of music albums and their related artists, tracks and genres. The main drive has been to enrich Rolling Stones Managine lists of 1) top 500 albums and 2) 'horrible 50 albums with data available through the Spotify API. 

There are the sources: 
+ **Rolling Stone's 500 Greatest Albums of All Time**
Available on Kaggle: https://www.kaggle.com/datasets/joebeachcapital/rolling-stones-500-greatest-albums-of-all-time
Extraction via CVS file

+ **50 Genuinely Horrible Albums by Brilliant Artists**
Available on Web: https://www.rollingstone.com/music/music-lists/horrible-albums-by-brilliant-artists-1234672895/
Extraccion via Web Scrapping, Selenium 

+ **Spotify API**
Documentation on : https://developer.spotify.com/
Extraccion via API 


## Deliverables  

The output of this project is stored in this repository, as follows: 

<li> DATA: Both the raw CSV data provided and the cleaned CSV tables 
<li> NOTEBOOKS: Jupyter notebooks with a step-by-step cleaning process of each CSV file
<li> SQL: Script for the final MySQL database 
<ations: this table will be associated with table films in a 'many-to-many' relationship (fk = actor_id and film_id)
</details>




