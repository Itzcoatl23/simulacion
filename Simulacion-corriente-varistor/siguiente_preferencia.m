function [G_siguiente] = siguiente_preferencia(G_actual,G_vecinos,XYcentros)

  % Matriz que almacena los valores de 'Y' de los vecinos
  % del grano actual.
  Y_vecinos_mayores = [];
  G_vecinos_mayores = [];

  for i=1:length(G_vecinos)
    if(XYcentros(G_vecinos(i),2) > XYcentros(G_actual,2))
        Y_vecinos_mayores = [Y_vecinos_mayores, XYcentros(G_vecinos(i),2)];
        G_vecinos_mayores = [G_vecinos_mayores, G_vecinos(i)];
    endif
  endfor



  %%%Y_vecinos_mayores
  %%%G_vecinos_mayores

  % Se asigna probabilidades en funcion del valor de 'Y'.
  Y_vecinos_prob = Y_vecinos_mayores/sum(Y_vecinos_mayores);
  % Ver test2 para ver el funcionamiento de la siguiente linea.
  G_siguiente = G_vecinos_mayores(find(rand<cumsum(Y_vecinos_prob),1,'first'));
return
endfunction
