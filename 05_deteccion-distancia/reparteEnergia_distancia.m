function [energia] = reparteEnergia_distancia(P_colisionando,energia)

    %intercambio de energia entre todas las particulas
    %colisionando al mismo tiempo.
    %Falta separar por colisiones.


    % se crea una matriz donde se alamacenara
    % temporalmente los valores de la energia
    % para hacer calculos.
    energia_final=zeros(rows(P_colisionando),1);



    % Para cada colision:
    for i=1:rows(P_colisionando)
        energia_temporal=0;
        % Se obtiene la suma de las energias
        % de las particulas que colisionan:
        for j=1:columns(P_colisionando)
          energia_temporal=energia_temporal+energia(P_colisionando(i,j));

        endfor

        % Se divide la energia entre el numero
        % de particulas colisionando:
        energia_temporal=energia_temporal/columns(P_colisionando);

        energia_final(i,1)=energia_temporal;
        %for j=1:columns(P_colisionando)
        %  eneriga(P_colisionando(i,j),1)=energia_temporal;
        %endfor



    endfor




    % Se asigna el valor anterior a cada
    % una de las particulas colisionando:
    %%for j=1:columns(P_colisionando)
    %%  eneriga(P_colisionando(i,j))=energia_temporal;
    %%endfor
    %%energia
    %%pause()





    % Se sustituyen los valores modificados de la
    % energia en el vector de energias original.
    for i=1:rows(P_colisionando)
       energia(P_colisionando(i,1),1)=energia_final(i,1);
    endfor

  %descomentar para seguir trabajando
  %t
  %P_colisionando
  %energia
  %energia_final
  return

endfunction
