
library(tidyverse)
usda_texture <- function(sand,clay,silt) {
  
  
  # if (sand + clay + silt > 100 | sand<0 | silt<0 |clay<0  ) {
  #   stop("Inputs adds over 100% or are negative")
  # } else {
  #   textural_class <- NA
  # }
  
  # 
  textural_class <- case_when(
    is.na(silt+clay+sand) ~ NA,
    silt + 1.5 * clay < 15 ~ 1,
    
    silt + 1.5 * clay >= 15 & silt + 2 * clay < 30 ~ 2,
    
    (clay >= 7 & clay < 20 & sand > 52 & silt + 2 * clay >= 30) |
      (clay < 7 & silt < 50 & silt + 2 * clay >= 30) ~ 3,
    
    clay >= 7 & clay < 27 & silt >= 28 & silt < 50 & sand <= 52 ~ 4,
    
    (silt >= 50 & clay >= 12 & clay < 27) |
      (silt >= 50 & silt < 80 & clay < 12) ~ 5,
    
    silt >= 80 & clay < 12 ~ 6,
    
    clay >= 20 & clay < 35 & silt < 28 & sand > 45 ~ 7,
    
    clay >= 27 & clay < 40 & sand > 20 & sand <= 45 ~ 8,
    
    clay >= 27 & clay < 40 & sand <= 20 ~ 9,
    
    clay >= 35 & sand > 45 ~ 10,
    
    clay >= 40 & silt >= 40 ~ 11,
    
    clay >= 40 & sand <= 45 & silt < 40 ~ 12,
    
    TRUE ~ NA
  )
 # textural_class <- factor(x=textural_class ,levels = c(1,2,3,4,5,6,7,8,9,10,11,12),
   #    labels = c("Sand","Loamy Sand","Sandy Loam","Loam","Silt Loam",
        #          "Silt","Sandy Clay Loam", "Clay Loam", "Silty Clay Loam",
        #        "Sandy Clay","Silty Clay","Clay"))
  return(textural_class)
}

# factor(x=c(NA,1,3,4) ,levels = c(1,2,3,4,5,6,7,8,9,10,11,12),
#      labels = c("Sand","Loamy Sand","Sandy Loam","Loam","Silt Loam",
#                 "Silt","Sandy Clay Loam", "Clay Loam", "Silty Clay Loam",
#                "Sandy Clay","Silty Clay","Clay")
