x=20
tiempos=10;



for i=1:tiempos

  paso=randi([1 2],1,1);

  if (paso == 1)
      x++;
    elseif(paso == 2)
      x--;
    else
      x=x;
  endif

  x

endfor


%{
switch paso
case 1
  x=x++;
case 2
  x=x--;
otherwise
  x=x;
end
%}
