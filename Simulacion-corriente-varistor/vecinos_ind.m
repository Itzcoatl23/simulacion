function [G_vecinos] = vecinos_ind(G_actual,tri)

  % PARA GENERAR TODOS LOS VECINOS DE UN GRANO
  % EN ESPECIFICO


  % Matriz que alamacenara los vecinos del
  % grano actual:
  G_vecinos = [];

  % Comparacion en busqueda de vecinos para el
  % grano actual.
  for i=1:rows(tri)
      % Si el grano actual se encuentra dentro
      % de la fila 'i' de la matriz 'tri', se
      % almacena la posicion en 'A'.
      A=find(tri(i,:)==G_actual);
      % Si el gano actual se encuentra dentro
      % de la fila 'i', 'A' tiene un tamaño
      % diferente de 0 y sigue el calculo.
      % Si A=0 se analiza la siguiente fila.
      if(length(A) != 0)
        % Se genera 'G_vecinos' que alamacena
        % todos los valores de todas las filas
        % que contengan al grano actual.
        G_vecinos = [G_vecinos,tri(i,:)];
      endif
  endfor

  % Se obtienen los valores sin repetir
  G_vecinos = unique(G_vecinos);
  % Se elimina el valor del grano actual para
  % obtener los vecinos reales.
  G_vecinos(find(G_vecinos==G_actual)) = [];





  return
endfunction
