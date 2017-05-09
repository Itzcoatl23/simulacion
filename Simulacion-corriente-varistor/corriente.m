clc;
clear all;
close all;



% VARIABLES
pasos = 10; % numero de pasos que daran los electrones.
resolucion = 10; % resolucion de las celdas.
espacio = 80; % tamaño del espacio.
desorden = 4; % Grado de desorden en las celdas.



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
hold off
pause


% Empieza el ciclo de pasos
for p=1:pasos

% Se obtiene el grano actual
G_actual = electrones(1,1);
% Funcion para detectar todos los vecinos
% de G_actual.
G_vecinos = vecinos_ind(G_actual,tri);
G_vecinos

% Funcion que selecciona de manera preferencial
% el grano siguiente en funcion de las coordenadas
% Y de los vecinos. Existe mayor probabilidad de
% avanzar hacia un grano que se encuentre arriba.
G_siguiente = siguiente_preferencia(G_vecinos,XYcentros)

% Se asigna el numero de grano obtenido por la funcion
% 'siguiente_preferencia' a la posicion de los electrones.
electrones(1,1) = G_siguiente;




voronoi(XYcentros(:,1),XYcentros(:,2))
hold on
plot(XYcentros(electrones(1,1),1),XYcentros(electrones(1,1),2),'ro','markersize',13)
hold off


pause

% Termina el ciclo de pasos.
endfor



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
