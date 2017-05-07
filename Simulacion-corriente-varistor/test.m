sigma_s = 10e-6;
sigma_g = 1;
s = 20;
V_b = 1;
V = [0:0.01:2];

%I_v = (V*sigma_s)+((sigma_g*V*0.5));

%plot(V,(V*sigma_s)+((sigma_g*V*0.5)*(1+tanh(V))))


I_v = (V*sigma_s)+(0.5*V*sigma_g).*(1+tanh(s*(V-V_b)));

plot(V,I_v,'r')
