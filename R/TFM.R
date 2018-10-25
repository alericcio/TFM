rm(list=ls())
DCO = read.csv("DCO.csv", header = FALSE)
GRD = read.csv("GRD.csv", header = FALSE)
patologia = read.csv("patologia.csv", header = FALSE)
servicios = read.csv("Servicios.csv", header = FALSE)
colnames(DCO) <- c("id","DCO", "Description")
colnames(GRD) <- c("id","GRD", "Description")
colnames(patologia) <- c("id","N_historia", "Gender", "Edad", "Fec_Serv", "S_ingreso", "S_alta", "GRD", "Severidad", "Version_Grd", "Cdm", "Peso_Grd", "DCO")
colnames(servicios) <- c("id","serv", "description")

summary(patologia) # mostra la statistica basica descrittiva generale della tabella patologia

barplot(table(patologia$Edad)) # interessante grafico che mostra la distrubuzione degli ingressi all'ospedale in base all'et?? delle persone
summary(patologia)

hist(patologia$Edad, color = 'tomato', probability = TRUE)
