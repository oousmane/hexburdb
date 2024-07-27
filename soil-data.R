library(geodata)
library(tidyverse)
library(sf)
library(terra)

source("functions/compute-usda.R")
# hex grid

bf <- read_sf("~/hexburdb/map/hex_grid.gpkg")

# soil types for D1 to D6

hwsd <- rast(x = "hwsd_bf_usda_first_6_layers.tif")

.get_mode <- function(x,na.rm =TRUE) {
  u <- unique(x)
  tab <- tabulate(match(x, u))
  m <- u[tab == max(tab,na.rm = na.rm)]
  # m <- as.character(m)
  if (length(m)>1L) m <- m[1]
  return(m)
}
hwsd_hex <- terra::extract(
  x = hwsd,
  y = bf,
  fun = .get_mode,
  bind = TRUE
) %>% 
  as_tibble() 
  
 
  write_csv(hwsd_hex,file = "data/soil/soil_properties.csv",
            col_names = TRUE,
            quote = "none"
            )
