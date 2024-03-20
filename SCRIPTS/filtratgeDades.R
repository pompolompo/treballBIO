# PAS 1
#Crear un vector amb els valors a considerar
valors_considerats <- c("CYT", "ME1", "ME2", "ME3", "MIT", "NUC")

#Seleccionar les files amb valors en la columna "MIT" que estàn a la llista de valors a considerar
data_filtrat <- subset(data, MIT %in% valors_considerats)

# Reasignar els valors de “ME1”, “ME2” y “ME3” com “MEM”
data_filtrat$MIT <- ifelse(data_filtrat$MIT %in% c("ME1", "ME2", "ME3"), "MEM", data_filtrat$MIT)

#Obtenció de les mostres aleatóries "train" i "test". Al tenir menys de 5000 
#observacions, s'opta per tenir una proporció de 75% i 25%.
set.seed(42)
indexs <- sample(nrow(data_filtrat), 0.75 * nrow(data_filtrat))
train_data <- data_filtrat[indexs, ]
test_data <- data_filtrat[-indexs,]

