
%  VARIABLES

l=9; % mitad del espacio
p=0.5; % valor del número de salto
n=100; % filas / numero de partículas
d=1; % columnas / dimensión
archivo="datos.txt";


%  Número de valores permitidos a través
%  del espacio.

k=((2*l)/p)+1;


%  Se define una matriz 'particulas'
%  que reune las coordenadas de cada partícula,
%  una por cada fila.

%  Las partículas se generan aleatoreamente
%  en función de la cantidad de
%  valores permitidos.

particulas=randi([1 k],n,d);


%///  particulas


%  Se asigna el valor real en el espacio
%  de las 'l' a cada partícula generada.

for i=1:n
  for j=1:d
    particulas(i,j)=(((particulas(i,j)-1)*p)-l);
  endfor
endfor

%/// particulas

%  Se calcula la distancia al origen
%  y se guardan los valores
%  en 'distancias'.

for i=1:n
  distancias(i,1)=sqrt(sum((particulas(i,:).^2)));
endfor

%///  distancias

hist(distancias)

fid=fopen(archivo,"w");
fprintf(fid,'%2.5f\n',distancias);
fclose(fid);
