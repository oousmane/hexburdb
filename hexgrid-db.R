library(sf)
library(tidyverse)

# read shapefile adm0 

bf <- read_sf("~/zoning-bfa/shapefile/bfa_adm_igb_20200323_shp/bfa_admbnda_adm0_igb_20200323.shp")

ggplot(data = bf)+ geom_sf()

hex <- st_make_grid(
  x = bf,
  cellsize = 0.18, # ~ 20 km grid spacing
  square = FALSE
)

# prepare to write dataset (gpkg format)
if (!fs::dir_exists("data")) fs::dir_create("data")
if (!fs::dir_exists("map")) fs::dir_create("map")

x <- st_intersection(
  hex,
  bf,
  ) %>% 
  st_as_sf() %>% 
  mutate(
    hex_id = 1:nrow(.), # adding hex_id to facilitate data joining
    .before = everything()
    ) %>% 
  write_sf(
    "map/hex_grid.gpkg"
  )

# test loading

hex_grid <- read_sf("map/hex_grid.gpkg")

ggplot(hex_grid)+geom_sf()


