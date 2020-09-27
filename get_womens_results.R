# URLs
# Women: https://en.wikipedia.org/wiki/List_of_Olympic_medalists_in_athletics_(women)
# Men:   https://en.wikipedia.org/wiki/List_of_Olympic_medalists_in_athletics_(men)

# TO DO:
# - Extract table of results from wikipedia pages (current & discontinued events)

library(httr)
library(XML)

women <- 'https://en.wikipedia.org/wiki/List_of_Olympic_medalists_in_athletics_(women)'
women_html <- read_html(women)

r <- GET(women)

doc <- readHTMLTable(
  doc=content(r, "text"))

womens_events <- c(
  '100 metres',
  '200 metres',
  '400 metres',
  '800 metres',
  '1500 metres',
  '5000 metres',
  '10,000 metres',
  'Marathon',
  '100 metres hurdles',
  '400 metres hurdles',
  '3000 metres steeplechase',
  '4 × 100 metres relay',
  '4 × 400 metres relay',
  '20 kilometres race walk',
  'High jump',
  'Pole vault',
  'Long jump',
  'Triple jump',
  'Shot put',
  'Discus throw',
  'Hammer throw',
  'Javelin throw',
  'Heptathlon',
  '3000 metres',
  '80 metres hurdles',
  'Pentathlon',
  '10 kilometers race walk'
)

for(i in 1:27){
  print(i)
  df <- doc[i]$`NULL`
  colnames(df) <- c('games','gold','silver','bronze')
  df <- df[-1, ] 
  df$event <- rep(womens_events[i],nrow(df))
  df$gender <- rep('women',nrow(df))
  if(i == 1){
    womens_results <- df
  }
  if(i != 1){
    womens_results <- rbind(womens_results,df)
  }
}

write.csv(womens_results,"data/womens_results.csv", row.names = F)