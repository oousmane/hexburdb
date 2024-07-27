library(sf)
library(tidyverse)
# Data from Humanitarian Data Exchange, HDX
adm0 <- read_sf("~/hwsd-db/shapefile/bfa_adm_igb/bfa_adm0_igb.shp")

write_sf(adm0,"map/admin0.gpkg")

adm1 <- read_sf("~/hwsd-db/shapefile/bfa_adm_igb/bfa_adm1_igb.shp")

write_sf(adm1,"map/admin1.gpkg")

adm2 <- read_sf("~/hwsd-db/shapefile/bfa_adm_igb/bfa_adm2_igb.shp")

write_sf(adm2,"map/admin2.gpkg")

adm3 <- read_sf("~/hwsd-db/shapefile/bfa_adm_igb/bfa_adm3_igb.shp")

write_sf(adm3,"map/admin3.gpkg")
