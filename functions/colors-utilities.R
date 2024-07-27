"#77655B"
"#8F7863"
"#A68C6A"
"#BFA072" 
"#D8B579"
"#F1CA80"
"#FFD88D" 
"#FFDF9F" 
"#FFE7B1"
"#FFEEC3"
"#FFF5D5"
"#FEFCE7"

#colors for soil textures

cols_abr <-  c(
    Cl     = "#77655B",
    SiCl   = "#8F7863",
    SaCl   = "#A68C6A",
    ClLo   = "#BFA072",
    SiClLo = "#D8B579",
    SaClLo = "#F1CA80",
    Lo     = "#FFD88D",
    SiLo   = "#FFDF9F",
    SaLo   = "#FFE7B1",
    Si     = "#FFEEC3",
    LoSa   = "#FFF5D5",
    Sa     = "#FEFCE7"
  )

coltab_abr <- data.frame(
  value = 1:12,
  col = c(
    "#77655B",
    "#8F7863",
    "#A68C6A",
    "#BFA072",
    "#D8B579",
    "#F1CA80",
    "#FFD88D",
    "#FFDF9F",
    "#FFE7B1",
    "#FFEEC3",
    "#FFF5D5",
    "#FEFCE7"
  )
  )

labels_name_fr <- c(
    Cl     = "argile", 
    SiCl   = "argile limoneuse",
    SaCl   = "argile sableuse",
    ClLo   = "limon argileux",
    SiClLo = "limon argileux fin",
    SaClLo = "limon argilo-sableux",
    Lo     = "limon",
    SiLo   = "limon fin",
    SaLo   = "limon sableux",
    Si     = "limon très fin",
    LoSa   = "sable limoneux" ,
    Sa     = "sable"
  )

labels_name_en <- c(
    Cl     = "clay", 
    SiCl   = "silty clay",
    SaCl   = "sandy clay",
    ClLo   = "clay loam",
    SiClLo = "silty clay loam",
    SaClLo = "sandy clay loam",
    Lo     = "loam",
    SiLo   = "silty loam",
    SaLo   = "sandy loam",
    Si     = "silt",
    LoSa   = "loamy sand" ,
    Sa     = "sand"
  )

facet_labels_fr<- c(
  `D1` = "Profondeur : 00 - 20 cm",
  `D2` = "Profondeur : 20 - 40 cm",
  `D3` = "Profondeur : 40 - 60 cm",
  `D4` = "Profondeur : 60 - 80 cm",
  `D5` = "Profondeur : 080 - 100 cm",
  `D6` = "Profondeur : 100 - 150 cm"
)
facet_labels_en<- c(
  `D1` = "Layer : 00 - 20 cm",
  `D2` = "Layer : 20 - 40 cm",
  `D3` = "Layer : 40 - 60 cm",
  `D4` = "Layer : 60 - 80 cm",
  `D5` = "Layer : 080 - 100 cm",
  `D6` = "Layer : 100 - 150 cm"
)

facet_labels_slayer_fr<- c(
  `s_texture` = "Couche inférieure : 040 - 100 cm",
  `t_texture` = "Couche supérieure :  00 - 40 cm"
)

facet_labels_slayer_en<- c(
  `s_texture` = "Subsoil : 040 - 100 cm",
  `t_texture` = "Topsoil : 00 - 40 cm"
)
