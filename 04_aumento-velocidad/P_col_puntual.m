function [P_colisionando] = P_col_puntual(n,coordenadasL,d,colisiones,P_colisionando)

% BUSCAR como optimizar la generacion de
% esta matriz.
% Compara cada una de las posiciones en busca
% de la posicion en la que se encuentren en
% el vectore de posiciones (coordenadasL).
for i=1:n
  for j=1:n
    % linea para encontrar posiciones repetidas
    if (sum(coordenadasL(i,:)==coordenadasL(j,:)) == d)
        % Para evitar detectar detectar la comparacion
        % entre la misma particula,
        % la siguiente instruccion
        if(i!=j)
        colisiones(i,j)=1;%probar borrarlo
        % Detecta la posición de la colision.
        colision=j;
        % Todas las posiciones de las coordenadas
        % en el tiempo t se almacenan
        % en P_colisionando.
        P_colisionando=[P_colisionando;colision];
        endif
    else
        colisiones(i,j)=0;%probar borrarlo
    endif
  endfor
endfor
