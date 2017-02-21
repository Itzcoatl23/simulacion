%  VARIABLES

l=10; % mitad del espacio
p=2; % valor del número de salto
n=10; % filas / numero de partículas
d=2; % columnas / dimensión
archivo="datos.txt"; % nombre del archivo donde se guardan las distancias
tiempos=10; %numero de tiempo corriendo la simulacion




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
axis([-l l -l l])



contador=0;
choque=[];
% Deteccion de colisiones
if n>1
    for i=1:n-1
      for j=(i+1):n
        if (sum(coordenadasL(i,:)==coordenadasL(j,:)) == d)

          contador=contador+1;
          crash=coordenadasL(i,:); %choque individual
          choque=[choque;crash]; %Muestra posición de colisión
          hold on
          plot(choque(:,1),choque(:,2),'ro','markersize',13);
          hold off

        endif
      endfor
    endfor
endif

contador
choque





saveas(gcf,strcat('figura',num2str(t),'.png'));
pause();

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
