
l=3; % mitad del espacio
p=1.5; % valor del número de salto

k=((2*l)/p)+1; % número de valores permitidos a través del espacio





%tamaño de coordenadas
n1=10; %filas o numero de partículas
n2=1; %columnas o dimensión

particulas=round(unifrnd(-1*l,l,n1,n2));

particulas


for i=1:10
  particulas(i)=sqrt(particulas(i).^2);
endfor

particulas

hist(particulas)
