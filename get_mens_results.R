# URLs
# Women: https://en.wikipedia.org/wiki/List_of_Olympic_medalists_in_athletics_(women)
# Men:   https://en.wikipedia.org/wiki/List_of_Olympic_medalists_in_athletics_(men)

# TO DO:
# - Extract table of results from wikipedia pages (current & discontinued events)

library(httr)
library(XML)

men <- 'https://en.wikipedia.org/wiki/List_of_Olympic_medalists_in_athletics_(men)'
#men_html <- read_html(men)

r <- GET(men)

doc <- readHTMLTable(
  doc=content(r, "text"))

mens_events <- c(
  '100 metres',
  '200 metres',
  '400 metres',
  '800 metres',
  '1500 metres',
  '5000 metres',
  '10,000 metres',
  'Marathon',
  '110 metres hurdles',
  '400 metres hurdles',
  '3000 metres steeplechase',
  '4 × 100 metres relay',
  '4 × 400 metres relay',
  '20 kilometres race walk',
  '50 kilometres race walk',
  'High jump',
  'Pole vault',
  'Long jump',
  'Triple jump',
  'Shot put',
  'Discus throw',
  'Hammer throw',
  'Javelin throw',
  'Decathlon',
  '60 metres',
  '5 miles',
  '200 metres hurdles',
  '2500 metres steeplechase',
  '2590 metres steeplechase',
  '3200 metres steeplechase',
  '4000 metres steeplechase',
  '1600 metres relay',
  '3000 metres team race',
  '5000 metres team race',
  '3-mile team race',
  '4-mile team race',
  'Cross country (individual)',
  'Cross country (team)',
  '3000 metres walk',
  '3500 metres walk',
  '10 kilometres walk',
  '10 miles walk',
  'Standing high jump',
  'Standing long jump',
  'Standing triple jump',
  'Shot put (two-handed)',
  'Discus throw (Greek style)',
  'Discus throw (two-handed)',
  'Weight throw',
  'Javelin throw (freestyle)',
  'Javelin throw (two-handed)',
  'Triathlon',
  'Pentathlon'
)

for(i in 1:53){
  print(i)
  df <- doc[i]$`NULL`
  colnames(df) <- c('games','gold','silver','bronze')
  df <- df[-1, ] 
  df$event <- rep(mens_events[i],nrow(df))
  df$gender <- rep('men',nrow(df))
  if(i == 1){
    mens_results <- df
  }
  if(i != 1){
    mens_results <- rbind(mens_results,df)
  }
}

write.csv(mens_results,"data/mens_results.csv", row.names = F)