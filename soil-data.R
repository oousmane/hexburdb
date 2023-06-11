library(geodata)
library(tidyverse)
library(sf)
library(terra)

# Soil data gathering and processing.
# Original data files are from Regridded Harmonized World Soil Database v1.2
# link : https://daac.ornl.gov/SOILS/guides/HWSD.html
# reference paper : Wieder, W.R., J. Boehnert, and G.B. Bonan. (2014).
#  Evaluating soil biogeochemistry parameterizations in Earth system models with observations, Global Biogeochem. 
# Cycles, 28, 211–222, doi:10.1002/2013GB004665.

# hex grid
bf <- read_sf("~/hexburdb/map/hex_grid.gpkg")
# read clay, top and s
t_clay <- rast(x = "HWSD_1247/data/T_CLAY.nc4")

t_clay_hex <- terra::extract(
  x = t_clay,
  y = bf,
  fun = "mean",
  bind = TRUE
) %>% 
  as_tibble() %>% 
  `names<-`(c("hex_id","t_clay_perc"))
  

t_clay <- rast(x = "HWSD_1247/data/T_CLAY.nc4")

t_clay_hex <- terra::extract(
  x = t_clay,
  y = bf,
  fun = "mean",
  bind = TRUE
) %>% 
  as_tibble() %>% 
  `names<-`(c("hex_id","t_clay_perc"))

t_silt <- rast(x = "HWSD_1247/data/T_SILT.nc4")

t_silt_hex <- terra::extract(
  x = t_silt,
  y = bf,
  fun = "mean",
  bind = TRUE
) %>% 
  as_tibble() %>% 
  `names<-`(c("hex_id","t_silt_perc"))
  
t_silt_hex

t_sand <- rast(x = "HWSD_1247/data/T_SAND.nc4")

t_sand_hex <- terra::extract(
  x = t_sand,
  y = bf,
  fun = "mean",
  bind = TRUE
) %>% 
  as_tibble() %>% 
  `names<-`(c("hex_id","t_sand_perc"))
  
t_sand_hex

.l <- list(
  t_sand_hex,
  t_silt_hex,
  t_clay_hex
)

soil_properties <- reduce(
  .x = .l,
  .f = left_join
  
)

soil_properties %>% 
  write_csv(file = "data/soil/soil_properties.csv",
            col_names = TRUE,
            quote = "none"
            )
 

# soil af permanent wilting point (volumetric percent vperc)
 pwp <- geodata::soil_af_water(
   "pwp",
   depth = "30cm",
   path = "geodata/soilafwater"
 )
bf <- read_sf("~/hexburdb/map/hex_grid.gpkg")
pwp_hex <- terra::extract(
  x = pwp,
  y = bf ,
  fun ="mean",
  bind = TRUE
) %>% 
  as_tibble() %>% 
  `names<-`(c("hex_id","pwp_30cm_vperc"))



 