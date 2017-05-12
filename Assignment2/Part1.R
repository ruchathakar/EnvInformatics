setwd("C:/boxsync/rthakar/Courses/Spring2017/ESM262/EnvInformatics/Assignment2")

library (tidyverse)
library (dplyr)
library (gdata)
library (lubridate)

gaz_raw <- read.delim("C:/boxsync/rthakar/Courses/Spring2017/ESM262/EnvInformatics/Assignment2/CA_Features_20170401.txt", sep = "|", as.is = TRUE)

gaz <- gaz_raw %>% select (ï..FEATURE_ID,FEATURE_NAME,FEATURE_CLASS,STATE_ALPHA, COUNTY_NAME, PRIM_LAT_DEC, PRIM_LONG_DEC, SOURCE_LAT_DEC, SOURCE_LONG_DEC, ELEV_IN_M, MAP_NAME, DATE_CREATED, DATE_EDITED)

colnames(gaz) <- c("featureID","feature_name","feature_class", "state_alpha", "county_name", "primary_latitude", "primary_longitude", "source_latitude", "source_longitude", "elevation", "map_name", "date_created", "date_edited")

gaz <- as.tibble(gaz)
gaz

gaz$primary_latitude <- as.numeric(gaz$primary_latitude)
gaz$primary_longitude <- as.numeric(gaz$primary_longitude)
gaz$source_latitude <- as.numeric(gaz$source_latitude)
gaz$source_longitude <- as.numeric(gaz$source_longitude)
gaz$elevation <- as.numeric(gaz$elevation)
gaz$date_created <- mdy (gaz$date_created)
gaz$date_edited <- mdy (gaz$date_edited)
gaz

gaz <- unknownToNA(gaz, unknown = c("NA",""))
gaz

gaz %>%
  filter(!is.na(primary_latitude)) %>%
  filter(!is.na(primary_longitude))

new <- gaz %>%
  drop_na(primary_latitude) %>%
  drop_na(primary_longitude)
  
final_file <- gaz %>% filter(state_alpha == "CA")

write.table(final_file, file="final_file_part1.csv", sep = "|")
# write.table(MyData, file = "MyData.csv",row.names=FALSE, na="",col.names=FALSE, sep=",")