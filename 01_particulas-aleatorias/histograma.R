
# Se lee el archivo 'datos.txt' y se le asigna al objeto 'distancias'.

distancias <- read.table('datos.txt')


# Se crea el histograma con la columna 'V1' de 'distancias'
# y se establecen los parámetros del histograma.

hist(distancias$V1,
     main = 'Distancias al origen de las particulas',
     xlab = 'Distancia',
     ylab = 'Frecuencia',
     xlim = c(0,5),
     col = 'red')
