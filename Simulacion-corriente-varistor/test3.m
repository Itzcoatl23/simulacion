clc;
clear all;
close all;



while(1)
  r=randi([0 10],1,1)
    if(r==0)
      printf("el numero cero\n")
      break
    endif
    printf("el numero no es cero\n")
  pause
endwhile
