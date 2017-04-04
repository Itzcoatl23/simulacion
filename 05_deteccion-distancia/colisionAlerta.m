function [] = colisionAlerta(coordenadasL,n,d,t)

  % numero de colisiones en el tiempo t
  Ncolisiones=0;
  % matriz que almacena las coordenadas
  % de colision
  coordenadasCol=[];
  % Deteccion de colisiones
  if n>1
      for i=1:n-1
        for j=(i+1):n
          if (sum(coordenadasL(i,:)==coordenadasL(j,:)) == d)
            %t
            Ncolisiones=Ncolisiones+1;
            colision=coordenadasL(i,:); %choque individual
            coordenadasCol=[coordenadasCol;colision]; %Muestra posición de colisión
            %i
            %j

            hold on
            plot(coordenadasCol(:,1),coordenadasCol(:,2),'ro','markersize',13);
            hold off

          endif
        endfor
      endfor
  endif
  % FIN deteccion de colisiones

  %Ncolisiones
  %coordenadasCol


  return
endfunction
