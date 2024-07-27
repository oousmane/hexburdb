#'@title Compute USDA soil texture
#'@description
#'A wrapper of soiltexture::TT.points.in.classes() function that allow vectorization.
#'This function can be used easily in dplyr::mutate() function.
#'@param sand soil sample sand fraction in %.
#'@param clay soil sample clay fraction in %.
#'@param silt soil sample silt fraction in %.
#'@param oc soil sample organic content fraction in g/kg. can be NULL. 
#'@param type USDA soil texture output type. One of "num" for numeric (1 to 12); "abbr" for abbreviated texture;"name_en" for texture name in english; "name_fr" for texture name in french.
#'@importFrom stringr str_split_i
#'@importFrom stringr str_trim
#'@importFrom soiltexture TT.points.in.classes
#'@importFrom dplyr case_when
#'@returns soil texture (numeric = 1 to 12or character string = abbreviation, or name in english or french) according to USDA texture triangle 
#'@note 
#'the french translation of USDA soil texture is adapted from the web resource Parlons science.
#'Parlons sciences. (n.d.). Science du sol. Retrieved 5 September 2023, from https://parlonssciences.ca/ressources-pedagogiques/documents-dinformation/science-du-sol
#'@export
compute_usda <- function(sand = 10, clay = 70, silt = 20,oc=NULL, type = "num", border = 1) {
  if (is.null(oc)){
    df <- data.frame(SAND = sand, CLAY = clay, SILT = silt)
  } else{
    df <- data.frame(SAND = sand, CLAY = clay, SILT = silt,OC=oc)
  }
  texture <- soiltexture::TT.points.in.classes(
    df,
    "USDA.TT",
    PiC.type = "t"
  )
  if (!is.null(border) && !(border %in% c(1,2))) stop("Possible values for border argument are: NULL, 1 or 2")
  if (is.null(border)){
    texture <- texture
  } else{
  itexture <- stringr::str_split_i(string = texture, ",", i = border)
  texture <- ifelse(is.na(itexture), yes = texture, itexture)
  texture <- stringr::str_trim(texture)
  }
  
  if (!(type %in% c("num", "abr","name_en","name_fr"))) stop("No supported type. possible `type` are 'num'or'abr','nam_en','name_fr'")
  
  if (type=="abr"){
    res <- texture
  } else{
    res <- .translate_usda(texture = texture,to = type)
  }
  return(res)
}

# translating helper for USDA soil texture.

.translate_usda <- function(texture="SaCl",to = "num"){
  if ( !(to %in% c("num","name_en","name_fr"))) stop("Can not translate USDA texture. `to` argument is one of 'num','name_en','name_fr'")
  if (to == "num"){
    res <- dplyr::case_when(
    texture == "Cl" ~ 1,
    texture == "SiCl" ~ 2,
    texture == "SaCl" ~ 3,
    texture == "ClLo" ~ 4,
    texture == "SiClLo" ~ 5,
    texture == "SaClLo" ~ 6,
    texture == "Lo" ~ 7,
    texture == "SiLo" ~ 8,
    texture == "SaLo" ~ 9,
    texture == "Si" ~ 10,
    texture == "LoSa" ~ 11,
    .default = 12
  )
  } else if (to == "name_en") {
    res <- dplyr::case_when(
    texture == "Cl" ~     "clay", 
    texture == "SiCl" ~   "silty clay",
    texture == "SaCl" ~   "sandy clay",
    texture == "ClLo" ~   "clay loam",
    texture == "SiClLo" ~ "silty clay loam",
    texture == "SaClLo" ~ "sandy clay loam",
    texture == "Lo" ~     "loam",
    texture == "SiLo" ~   "silty loam",
    texture == "SaLo" ~   "sandy loam",
    texture == "Si" ~     "silt",
    texture == "LoSa" ~   "loamy sand" ,
    .default =            "sand"
  )
  } else {
    res <- dplyr::case_when(
    texture == "Cl" ~    "argile", 
    texture == "SiCl" ~  "argile limoneuse",
    texture == "SaCl" ~  "argile sableuse",
    texture == "ClLo" ~  "limon argileux",
    texture == "SiClLo" ~"limon argileux fin",
    texture == "SaClLo" ~"limon argilo-sableux",
    texture == "Lo" ~    "limon",
    texture == "SiLo" ~  "limon fin",
    texture == "SaLo" ~  "limon sableux",
    texture == "Si" ~    "limon très fin",
    texture == "LoSa" ~  "sable limoneux" ,
    .default =           "sable"
    )

  }
  return(res)
}
num_to_usda <- function(texture = 1,to ="abr"){
  if (to == "abr"){
    res <- dplyr::case_when(
    texture == 1  ~  "Cl", 
    texture == 2  ~  "SiCl", 
    texture == 3  ~  "SaCl",
    texture == 4  ~  "ClLo", 
    texture == 5  ~  "SiClLo",
    texture == 6  ~  "SaClLo",
    texture == 7  ~  "Lo",
    texture == 8  ~  "SiLo",
    texture == 9  ~  "SaLo",
    texture == 10 ~  "Si",
    texture == 11 ~  "LoSa",
    texture == 12 ~  "Sa",
    .default = NA_character_
  )
  } else if (to == "name_fr"){
    res <- dplyr::case_when(
    texture == 1  ~  "argile", 
    texture == 2  ~  "argile limoneuse",
    texture == 3  ~  "argile sableuse",
    texture == 4  ~  "limon argileux",
    texture == 5  ~  "limon argileux fin",
    texture == 6  ~  "limon argilo-sableux",
    texture == 7  ~  "limon",
    texture == 8  ~  "limon fin",
    texture == 9  ~  "limon sableux",
    texture == 10 ~  "limon très fin",
    texture == 11 ~  "sable limoneux" ,
    texture == 12 ~  "sable",
    .default = NA_character_
  )
  } else{
   res <- dplyr::case_when(
    texture == 1  ~  "clay", 
    texture == 2  ~  "silty clay",
    texture == 3  ~  "sandy clay",
    texture == 4  ~  "clay loam",
    texture == 5  ~  "silty clay loam",
    texture == 6  ~  "sandy clay loam",
    texture == 7  ~  "loam",
    texture == 8  ~  "silty loam",
    texture == 9  ~  "sandy loam",
    texture == 10 ~  "silt",
    texture == 11 ~  "loamy sand" ,
    texture == 12 ~  "sand",
    .default = NA_character_
  ) 
  }
  return(res)
}
