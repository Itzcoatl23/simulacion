
# Se lee el archivo 'datos.txt' y se le asigna al objeto 'distancias'.

distancias <- read.table('datos.txt')


# Se crea el histograma con la columna 'V1' de 'distancias'
# y se establecen los parámetros del histograma.
# xlim = c(0,5)  rango del eje x

hist(distancias$V1,
     main = 'Distancias al origen de las particulas',
     xlab = 'Distancia',
     ylab = 'Frecuencia',
     
     las = 1,
     breaks = 10,
     prob = TRUE,
     col = 'red')


# Se genera una línea de probabilidad

lines(density(distancias$V1))
