function [G_siguiente] = siguiente_preferencia(G_vecinos,XYcentros)

  % Matriz que almacena los valores de 'Y' de los vecinos
  % del grano actual.
  Y_vecinos = [];

  for i=1:length(G_vecinos)
    Y_vecinos = [Y_vecinos, XYcentros(G_vecinos(i),2)];
  endfor

  %Y_vecinos
  % Se asigna probabilidades en funcion del valor de 'Y'.
  Y_vecinos_prob = Y_vecinos/sum(Y_vecinos);
  % Ver test2 para ver el funcionamiento de la siguiente linea.
  G_siguiente = G_vecinos(find(rand<cumsum(Y_vecinos_prob),1,'first'));
return
endfunction
