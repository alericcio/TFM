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
dim(DCO)
dim(GRD)
dim(patologia)
dim(servicios)

barplot(table(patologia$Edad)) # interessante grafico che mostra la distrubuzione degli ingressi all'ospedale in base all'et?? delle persone
summary(patologia)

hist(patologia$Edad, probability = TRUE)

# Número de filas en la tabla patologia
nrows = nrow(patologia)
# Identifo diferencias entre S_ingreso y S_alta
y <- matrix(nrow = nrows, ncol = 1)
for (i in 1:nrows){
  if ( patologia[i, 6] == patologia[i, 7] ) {
    y[i,]<- "iguale"
  } else {
    y[i,]<- "distinto"
  }
}
summary(y) # Hay 6338 iguales y 37813 casos distintos

primermerge <- merge(patologia, GRD, by = "GRD", all = TRUE)
segundomerge <- merge(primermerge, DCO, by = "DCO", all = TRUE)
subsetsegundomerge <- subset(segundomerge, select = -c(id.x, N_historia, S_ingreso, S_alta, Version_Grd, Cdm, Peso_Grd, id.y, id))
colnames(subsetsegundomerge)[colnames(subsetsegundomerge)=="Description.x"] <- "Descripcion_GRD"
colnames(subsetsegundomerge)[colnames(subsetsegundomerge)=="Description.y"] <- "Descripcion_DCO"
