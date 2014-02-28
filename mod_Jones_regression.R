# Cargar algunas librerias
library(lattice) # Para las gráficas de regresión múltiple
library(DAAG)
library(plm) # para las regresiones Fama-MacBeth

#Importar los datos
mod_Jones_data <- read.delim("~/Dropbox/UP/Investigacion/Proyectos_Investigacion/earnings/earnings_R/mod_Jones_data.txt", stringsAsFactors = FALSE)
head(mod_Jones_data)

# ajuste de datos de caracter a numeric
sapply(mod_Jones_data, class)
mod_Jones_data$REV_REC_diff <- as.numeric(mod_Jones_data$REV_REC_diff)
sapply(mod_Jones_data, class)

summary(mod_Jones_data)
# Cargar la base de datos
attach(mod_Jones_data)

# Revisa los datos
head(NDA)
head(A_inverse)
head(REV_REC_diff)
head(PPE)

# Corre la regresion
jones.lm <- lm(formula = NDA ~ A_inverse + REV_REC_diff + PPE)

# Resultados de la regresión
summary(jones.lm)

#grafica las relaciones entre vars
splom(~ mod_Jones_data [, c("NDA","A_inverse", "REV_REC_diff","PPE")])









