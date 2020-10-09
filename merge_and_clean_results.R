# read data and resolve any issues

library(dplyr)
library(stringr)
library(rworldmap)

womens <- read.csv("data/womens_results.csv", stringsAsFactors = F)
mens <- read.csv("data/mens_results.csv", stringsAsFactors = F)
events <- read.csv("data/event_lookup.csv", stringsAsFactors = F)

# merging cells that have become additional rows 
womens$silver[17] <- paste0(womens$silver[17],' & ',womens$games[18])
womens$silver[20] <- paste0(womens$silver[20],' & ',womens$games[21])
womens$bronze[111] <- paste0(womens$bronze[111],' & ',womens$games[112])
womens$silver[176] <- paste0(womens$silver[176],' & ',womens$games[177])
womens$silver[178] <- paste0(womens$silver[178],' & ',womens$games[179])
womens$bronze[189] <- paste0(womens$bronze[189],' & ',womens$games[190])

mens$bronze[1] <- paste0(mens$bronze[1],' & ',mens$games[2])
mens$bronze[69] <- paste0(mens$bronze[69],' & ',mens$games[70])
mens$silver[380] <- paste0(mens$silver[380],' & ',mens$games[381])
mens$silver[384] <- paste0(mens$silver[384],' & ',mens$games[385],' & ',mens$games[386])
mens$bronze[403] <- paste0(mens$bronze[403],' & ',mens$games[404])
mens$bronze[405] <- paste0(mens$bronze[405],' & ',mens$games[406],' & ',mens$games[407])
mens$bronze[412] <- paste0(mens$bronze[412],' & ',mens$games[413],' & ',mens$games[414])
mens$bronze[416] <- paste0(mens$bronze[416],' & ',mens$games[417])
mens$bronze[420] <- paste0(mens$bronze[420],' & ',mens$games[421],' & ',mens$games[423])
mens$gold[420] <- paste0(mens$gold[420],' & ',mens$games[422])
mens$bronze[424] <- paste0(mens$bronze[424],' & ',mens$games[425],' & ',mens$games[427])
mens$silver[424] <- paste0(mens$silver[424],' & ',mens$games[426])
mens$silver[441] <- paste0(mens$silver[441],' & ',mens$games[442])
mens$bronze[443] <- paste0(mens$bronze[443],' & ',mens$games[444])
mens$gold[617] <- paste0(mens$gold[617],' & ',mens$games[618])
mens$gold[692] <- paste0(mens$gold[692],' & ',mens$games[693])

womens <- dplyr::filter(womens,grepl('details',womens$games))
mens <- dplyr::filter(mens,grepl('details',mens$games))

combined <- rbind(womens,mens)
combined$games <- gsub('details','',combined$games)
combined$year <- stringr::str_extract(combined$games,'\\d+')
combined$location <- gsub('\\d+ ','',combined$games)

# Add event type column from lookup file
combined <- dplyr::left_join(combined,events, by = c("event" = "event"))

# use world map package to get list of countries

data(countryExData)
countries <- c('Great Britain','Soviet Union','East Germany'
               ,'West Germany','United Team of Germany','Czechoslovakia','Trinidad and Tobago'
               ,'Unified Team','Czech Republic','Dominican Republic','Bahamas','Grenada','Bahrain'
               ,trimws(countryExData[, 2]))
country_list <- paste(countries,collapse = '|')

combined$gold_athlete <- gsub(country_list,'',combined$gold)
combined$silver_athlete <- gsub(country_list,'',combined$silver)
combined$bronze_athlete <- gsub(country_list,'',combined$bronze)

combined$gold_country <- str_extract(combined$gold,country_list)
combined$silver_country <- str_extract(combined$silver,country_list)
combined$bronze_country <- str_extract(combined$bronze,country_list)

write.csv(combined,"data/combined_results.csv", row.names = F)