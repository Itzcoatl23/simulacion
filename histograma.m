
% VARIABLES

l=3; % mitad del espacio
p=1.5; % valor del número de salto
n=5; % filas / numero de partículas
d=1; % columnas / dimensión


% Número de valores permitidos a través
% del espacio.

k=((2*l)/p)+1;


% Se define una matriz 'particulas'
% que reune las coordenadas de cada partícula,
% una por cada fila.

% Las partículas se generan aleatoreamente
% en función de la cantidad de
% valores permitidos.

particulas=round(unifrnd(1,k,n,d));

particulas

% Se asigna el valor real en el espacio
% de las 'l' a cada partícula generada.

for i=1:n
  particulas(i)=((particulas(i)-1)*p-l);
endfor

particulas


%for i=1:n
%  particulas(i)=sqrt(particulas(i).^2);
%endfor

%particulas

%hist(particulas)
