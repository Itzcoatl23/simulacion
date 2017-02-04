I = 1;
figure
while I <= 4
    x=0:pi/100:2*pi;
    y=sin(x) + I;
    plot(x,y);
    saveas(gcf,strcat('figure',num2str(I),'.png'));
    I = I+1;
end
