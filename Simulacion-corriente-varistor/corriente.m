clc;
clear all;
close all;

% Para guardar imagen
%%          axis off
%%          print -color -depsc test.eps


% VARIABLES
pasos = 10; % numero de pasos que daran los electrones.
resolucion = 20; % resolucion de las celdas.
espacio = 100; % tamaño del espacio.
desorden = 10; % Grado de desorden en las celdas.
voltaje = 0;

% Ecuacion de corriente con
% respecto al voltaje
sigma_s = 10e-6;
sigma_g = 1;
s = 20;
V_b = 1;
% Rango para ver toda la curva de 0 a 2
V = [0:0.01:1];
I_v = 0.1+(V*sigma_s)+(0.5*V*sigma_g).*(1+tanh(s*(V-V_b)));
% valor máximo de corriente I_v(101)=0.60001







d = espacio/resolucion;

XYcentros = [];
XY = [];

for i=1:d
  X_min = (i-1)*resolucion;
  X_max = i*resolucion;
  X_medio = (X_max-X_min)/2;
  for j=1:d
    Y_min = (j-1)*resolucion;
    Y_max = j*resolucion;
    Y_medio = (Y_max-Y_min)/2;

    Y = unifrnd(X_min+X_medio-desorden,X_min+X_medio+desorden,1,1);
    X = unifrnd(Y_min+Y_medio-desorden,Y_min+Y_medio+desorden,1,1);

    %Y = randi([X_min X_max],1,1);
    %X = randi([Y_min Y_max],1,1);

    XYcentros = [XYcentros; X, Y];

  endfor
endfor


punto_ref = [0 0];



%{
do
  punto_ref=[0 espacio];
  k + 2;
until(k == 10)
%}



% Determinar celdas borde-superior
borde_superior=[];
for j=0:espacio
  punto_ref=[j espacio];
  for i=1:length(XYcentros)
    distancias(i,1)=sqrt((punto_ref(1,1)-XYcentros(i,1)).^2 + (punto_ref(1,2)-XYcentros(i,2)).^2);
  endfor
  borde_superior=[borde_superior;find(distancias==min(distancias))];
endfor


borde_superior=unique(borde_superior);

% Determinar celdas borde_inferior
borde_inferior=[];
for j=0:espacio
  punto_ref=[j 0];
  for i=1:length(XYcentros)
    distancias(i,1)=sqrt((punto_ref(1,1)-XYcentros(i,1)).^2 + (punto_ref(1,2)-XYcentros(i,2)).^2);
  endfor
  borde_inferior=[borde_inferior;find(distancias==min(distancias))];
endfor


borde_inferior=unique(borde_inferior);


pause






% Genera celdas con tamaño controlable
%{
XYcentros = [];
XY = [];

for i=1:d
  X_min = (i-1)*resolucion;
  X_max = i*resolucion;
  for j=1:d
    Y_min = (j-1)*resolucion;
    Y_max = j*resolucion;

    Y = randi([X_min X_max],1,1);
    X = randi([Y_min Y_max],1,1);

    XYcentros = [XYcentros; X, Y];

  endfor
endfor
%}




%XYcentros = randi([1,40],30,2); % Centros de todos los granos
%XYcentros = [6,3;3,3;4,8;5,1;10,9;7,3;3,10;1,10]





tri = delaunay (XYcentros(:,1),XYcentros(:,2));
[vx, vy] = voronoi(XYcentros(:,1),XYcentros(:,2),tri);

%triplot (tri, XYcentros(:,1), XYcentros(:,2), "r");
%hold on;
voronoi(XYcentros(:,1),XYcentros(:,2))
%hold off

%plot(vx,vy,"r")
%axis([1 10 1 10])

axis([0 espacio 0 espacio])
pause




% -- se visualizan las coordenadasa de triangulacion
% tri



% matriz que guarda el grano en el que se encuentran
% los electrones. Cada fila es un electron.
electrones = [4]

% Se grafica la primera posicion de los electrones.
hold on
plot(XYcentros(electrones(1,1),1),XYcentros(electrones(1,1),2),'ro','markersize',13)
%plot(XYcentros(electrones(2,1),1),XYcentros(electrones(2,1),2),'ro','markersize',13)
hold off
pause







contador=0;
pasos=0;

while(1)
% Empieza el ciclo de pasos
%for p=1:pasos



for i=1:length(electrones)

% Se obtiene el grano actual
G_actual = electrones(i)
% Funcion para detectar todos los vecinos
% de G_actual.
G_vecinos = vecinos_ind(G_actual,tri);
%%%G_vecinos



% Si el límite logra ser conductor, el electron
% se moverá y entrará a la función 'siguiente_preferencia'

if %COMPLETAR
      % Funcion que selecciona de manera preferencial
      % el grano siguiente en funcion de las coordenadas
      % Y de los vecinos. Existe mayor probabilidad de
      % avanzar hacia un grano que se encuentre arriba.
      G_siguiente = siguiente_preferencia(G_actual,G_vecinos,XYcentros)
      % Se asigna el numero de grano obtenido por la funcion
      % 'siguiente_preferencia' a la posicion de los electrones.
      electrones(i) = G_siguiente;
endif




endfor


%{ quitar comentario para ver graficamente

%voronoi(XYcentros(:,1),XYcentros(:,2))
%hold on
%for j=1:length(electrones)
%plot(XYcentros(electrones(j,1),1),XYcentros(electrones(j,1),2),'ro','markersize',13)
%endfor
%hold off
%pause

%}





%



% Revisar los electrones que puedan estar
% en el borde superior.
for i=1:length(electrones)

A=find(electrones(i)==borde_superior);



if(isempty(A)==0)
  electrones(i)=[];
  contador++;
endif

endfor

pasos++;

%B=find(electrones(1,1)==borde_superior);

if(isempty(electrones)==1)
  break
endif





% Termina el ciclo de pasos.
%endfor
endwhile

contador

%{

PARA GENERAR TODOS LOS VECINOS DE TODOS LOS GRANOS

for i=1:rows(XYcentros)
  for j=1:rows(XYcentros)
    A=find(tri(j,:)==i);

    if(length(A) != 0)
      AQUI VA LA CONDICION
    endif



    pause
  endfor
endfor
%}
