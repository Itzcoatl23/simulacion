function [energia] = reparteEnergia(P_colisionando,energia)

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

  %descomentar para seguir trabajando
  %t
  %P_colisionando
  %energia
  %energia_final
