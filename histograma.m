l=5;


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
