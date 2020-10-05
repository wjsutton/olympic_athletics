library(dplyr)

events <- read.csv("data/event_lookup.csv", stringsAsFactors = F)
sunburst <- read.csv("data/sunburst_mapping.csv", stringsAsFactors = F)
combined <- read.csv("data/combined_results.csv", stringsAsFactors = F)

template <- data.frame(
  year=rep(sunburst$Year,nrow(events))
  ,level=rep(sunburst$Level,nrow(events))
  ,path=rep(sunburst$Path,nrow(events))
  ,distance=rep(sunburst$Distance,nrow(events))
  ,value=rep(sunburst$Value,nrow(events))
  ,event=rep(events$event,nrow(sunburst))
  ,event_type=rep(events$event_type,nrow(sunburst))
)

sunburst_mapped <- unique(dplyr::left_join(template,combined))
write.csv(sunburst_mapped,"oylmpic_results_as_sunburst.csv",row.names = F)

  