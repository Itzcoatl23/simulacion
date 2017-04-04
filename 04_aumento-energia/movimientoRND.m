function [coordenadasE] = movimientoRND(coordenadasE,k,n,d)

  % Se definen valores especificos
  % de movimiento.
  dataset = [-1;1];

  % Para cada partícula:
  for i=1:n

    % Se elige una coordenada al azar.
    dimension=randi([1 d],1,1);

    % Si esta en el borde superior
    if (coordenadasE(i,dimension) == k)
          % Restar 1
          coordenadasE(i,dimension) --;
        % Si esta en el borde inferior
        elseif(coordenadasE(i,dimension) == 1)
          % Sumar 1
          coordenadasE(i,dimension) ++;
        % Si esta en cualquier otra
        % posicion
        else
        % Se escoge aleatoriamente uno
        % de los valores de 'dataset'
        % y se le suma al valor
        % de la coordenada.
        coordenadasE(i,dimension)=coordenadasE(i,dimension)+dataset(randi([1 2],1,1));

    endif
  endfor

  return

endfunction
