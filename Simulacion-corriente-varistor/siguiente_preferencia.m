function [G_siguiente] = siguiente_preferencia(G_vecinos,XYcentros)

  Y_vecinos = [];

  for i=1:length(G_vecinos)
    Y_vecinos = [Y_vecinos, XYcentros(G_vecinos(i),2)];
  endfor

  Y_vecinos

  Y_vecinos_prob = Y_vecinos/sum(Y_vecinos)

  G_siguiente = G_vecinos(find(rand<cumsum(Y_vecinos_prob),1,'first'))
  pause
return
endfunction
