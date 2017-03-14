%  ---- VARIABLES ----

l=10; % mitad del espacio
p=2; % valor del número de salto
n=10; % filas / numero de partículas
d=2; % columnas / dimensión
archivo="datos.txt"; % nombre del archivo donde se guardan las distancias
tiempos=10; %numero de tiempo corriendo la simulacion
colisiones=zeros(n);% matriz de colisiones......
energia=randi([1 10],n,1); % matriz de la energia ......
% ---- PROGRAMA ----

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

% Se grafican SOLAMENTE imagenes en 2D
plot(coordenadasL(:,1),coordenadasL(:,2),'*','markersize', 13);
axis([-l l -l l])

% Funcion que compara todas las coordenadas
% en busca de coordenadas repetidas.
% Cuando exncuentra una: guarda las
% coordenadas y la grafica sobre el plot
% de las particulas.
colisionAlerta(coordenadasL,n,d,t)






P_colisionando=[];
% BUSCAR como optimizar la generacion de
% esta matriz
for i=1:n

  for j=1:n
    if (sum(coordenadasL(i,:)==coordenadasL(j,:)) == d)
      if(i!=j)
      colisiones(i,j)=1;%probar borrarlo
      colision=j;
      P_colisionando=[P_colisionando;colision];
    endif
    else
      colisiones(i,j)=0;%probar borrarlo
    endif

  endfor

  % si la suma es mayor a 1 hubo colisiones
  % modificar el valor de la energia
  % en este punto
  %i
  %sum(colisiones(i,:))

  %intercambio de energia entre todas las particulas
  %colisionando al mismo tiempo.
  %Falta separar por colisiones.
  energia_final=zeros(rows(P_colisionando),1);
  for i=1:rows(P_colisionando)

    for j=1:rows(P_colisionando)

      energia_final(i,1)=energia_final(i,1)+(energia(P_colisionando(j,1),1)/rows(P_colisionando));

    endfor
    %energia(P_colisionando(i,1),1)=(energia(P_colisionando(j,1),1)/rows(P_colisionando))
    %P_colisionando(i,1)


  endfor

for i=1:rows(P_colisionando)
  energia(P_colisionando(i,1),1)=energia_final(i,1);
endfor





endfor


%descomentar para seguir trabajando
%t
%P_colisionando
energia
%energia_final


pause()










% Se guardan las imagenes en formato .png
%saveas(gcf,strcat('figura',num2str(t),'.png'));

% 'Enter' para avanzar en el tiempo
pause();

% Termina ciclo de tiempo
endfor
