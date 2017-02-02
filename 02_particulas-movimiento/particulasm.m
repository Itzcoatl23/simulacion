
%  VARIABLES

l=10; % mitad del espacio
p=2; % valor del número de salto
n=3; % filas / numero de partículas
d=2; % columnas / dimensión
archivo="datos.txt"; % nombre del archivo donde se guardan las distancias
tiempos=3; %numero de tiempo corriendo la simulacion


%  Número de valores permitidos a través
%  del espacio.

k=((2*l)/p)+1;


%  Se define una matriz 'particulas'
%  que reune las coordenadas de cada partícula,
%  una por cada fila.

%  Las partículas se generan aleatoreamente
%  en función de la cantidad de
%  valores permitidos.

particulas=round(unifrnd(1,k,n,d));
%particulas=randi([1 k],n,d);

particulas



% ####################################
% FUNCION MOVIMIENTO

% pasos para mover a las particulas
% de manera aleatoria, un paso a la vez
% y una coordenada a la vez.


% Se definen valores especificos
% de movimiento.
dataset = [-1;1];

for t=1:tiempos
% Para cada partícula:
for i=1:n

  % Se elige una coordenada al azar.
  dimension=randi([1 d],1,1);

  % Si esta en el borde superior
  if (particulas(i,dimension) == k)
        % Restar 1
        particulas(i,dimension) --;
      % Si esta en el borde inferior
      elseif(particulas(i,dimension) == 1)
        % Sumar 1
        particulas(i,dimension) ++;
      % Si esta en cualquier otra
      % posicion
      else
      % Se escoge aleatoriamente uno
      % de los valores de 'dataset'
      % y se le suma al valor
      % de la coordenada.
      particulas(i,dimension)=particulas(i,dimension)+dataset(randi([1 2],1,1));

  endif
endfor


plot(particulas(:,1),particulas(:,2),'*','markersize', 13);
xlim([1,11]);
ylim([1,11]);
saveas(gcf, ['figure_' num2str(tiempos) ], 'jpeg');


endfor
particulas
%axis([0,11,0,11], 'particulas')




% FUNCION MOVIMIENTO
% ####################################











%{



%  Se asigna el valor real en el espacio
%  de las 'l' a cada partícula generada.

for i=1:n
  for j=1:d
    particulas(i,j)=(((particulas(i,j)-1)*p)-l);
  endfor
endfor

 %particulas

%  Se calcula la distancia al origen
%  y se guardan los valores
%  en 'distancias'.

for i=1:n
  distancias(i,1)=sqrt(sum((particulas(i,:).^2)));
endfor

%///  distancias

hist(distancias)



%  Se genera un archivo de texto
%  guardando las distancias


fid=fopen(archivo,"w");
fprintf(fid,'%2.5f\n',distancias);
fclose(fid);



%}
