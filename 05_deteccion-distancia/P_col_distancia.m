function [P_colisionando] = P_col_distancia(n,coordenadasL,r,P_colisionando)

contador=0;
% Se calcula la distancia entre
% cada una de las particulas.
  for i=1:n-1
    for j=(i+1):n

      % Distancia euclidiana
      distancia=sqrt(sum((coordenadasL(i,:)-coordenadasL(j,:)).^2));

      if (distancia<r)
        contador=contador+1;
        P_colisionando=[P_colisionando;i,j];
      endif

    endfor
  endfor
contador
P_colisionando

return

endfunction
