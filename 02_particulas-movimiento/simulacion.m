%  VARIABLES

l=10; % mitad del espacio
p=2; % valor del número de salto
n=3; % filas / numero de partículas
d=2; % columnas / dimensión
archivo="datos.txt"; % nombre del archivo donde se guardan las distancias
tiempos=20; %numero de tiempo corriendo la simulacion




%  Número de valores permitidos a través
%  del espacio:
k=((2*l)/p)+1;

%  Se define una matriz 'coordenadasE'
%  que reune las coordenadas de cada partícula,
%  una por cada fila.
%  Las partículas se generan aleatoreamente
%  en función de la cantidad de
%  valores permitidos.
coordenadasE=round(unifrnd(1,k,n,d));
% OTRA OPCION que genera numeros enteros:
% coordenadasE=randi([1 k],n,d);

% Empieza ciclo de tiempo
for t=1:tiempos

% Se generan movimientos aleatorios
% un paso a la vez, una unidad de
% movimiento a la vez, una coordenada
% a la vez con la funcion 'movimientoRND'.
coordenadasE = movimientoRND(coordenadasE,k,n,d);

% Se transforman las coordenadas
% del espacio de los enteros
% al espacio de las 'l'.
coordenadasL = ((coordenadasE-1)*p)-l;

% Se guradan SOLAMENTE imagenes en 2D
plot(coordenadasL(:,1),coordenadasL(:,2),'*','markersize', 13);
xlim([-l,l]);
ylim([-l,l]);
saveas(gcf,strcat('figura',num2str(t),'.png'));

% Termina ciclo de tiempo
endfor







%{



 % ####################################
 % ####################################
 % FUNCION CALCULAR DISTANCIAS


%  Se calcula la distancia al origen
%  y se guardan los valores
%  en 'distancias'.
for i=1:n
  distancias(i,1)=sqrt(sum((particulasL(i,:).^2)));
endfor

% Se genera un histograma con los
% datos de las distancias.
hist(distancias)

%  Se genera un archivo de texto
%  guardando las distancias
fid=fopen(archivo,"w");
fprintf(fid,'%2.5f\n',distancias);
fclose(fid);


% FUNCION CALCULAR DISTANCIAS
% ####################################
% ####################################

%}
