clc;
clear all;
close all;

sigma_s = 10e-6;
sigma_g = 1;
s = 20;
V_b = 1;

% Rango para ver toda la curva de 0 a 2
V = [0:0.01:2];
       %V=1.5;




I_v = 0.1+(V*sigma_s)+(0.5*V*sigma_g).*(1+tanh(s*(V-V_b)));

plot(V,I_v,'r')
