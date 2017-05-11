setwd("C:/boxsync/rthakar/Courses/Spring2017/ESM262/EnvInformatics/Assignment2")

install.packages ("tidyverse")
library (tidyverse)

gaz_raw <- read.delim("C:/boxsync/rthakar/Courses/Spring2017/ESM262/EnvInformatics/Assignment2/CA_Features_20170401.txt", sep = "|", as.is = TRUE)

gaz <- gaz_raw %>% select (ï..FEATURE_ID,FEATURE_NAME,FEATURE_CLASS,STATE_ALPHA, COUNTY_NAME, PRIM_LAT_DEC, PRIM_LONG_DEC, SOURCE_LAT_DEC, SOURCE_LONG_DEC, ELEV_IN_M, MAP_NAME, DATE_CREATED, DATE_EDITED)

colnames(gaz) <- c("featureID","feature_name","feature_class", "state_alpha", "county_name", "primary_latitude", "primary_longitude", "source_latitude", "source_longitude", "elevation", "map_name", "date_created", "date_edited")

gaz <- as.tibble(gaz)

apply(gaz,2,class)

gaz$primary_latitude <- as.numeric(gaz$primary_latitude)