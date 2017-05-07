% VARIABLES
G_actual = 4; % grano actual
%XYcentros = randi([1,40],30,2); % Centros de todos los granos
XYcentros = [6,3;3,3;4,8;5,1;10,9;7,3;3,10;1,10]





tri = delaunay (XYcentros(:,1),XYcentros(:,2));
[vx, vy] = voronoi(XYcentros(:,1),XYcentros(:,2),tri);

%triplot (tri, XYcentros(:,1), XYcentros(:,2), "r");
%hold on;
voronoi(XYcentros(:,1),XYcentros(:,2))
%hold off

%plot(vx,vy,"r")
%axis([1 10 1 10])







% -- se visualizan las coordenadasa de triangulacion
% tri





XYelectrones = 0;

% Funcion para detectar todos los vecinos
% de G_actual.
G_vecinos = vecinos_ind(G_actual,tri);
G_vecinos





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
