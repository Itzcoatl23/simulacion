
XYcentros = randi([1,10],10,2);

Xcentros = randi([1,10],10,1);
Ycentros = randi([1,10],10,1);
tri = delaunay (Xcentros,Ycentros);
[vx, vy] = voronoi(Xcentros,Ycentros,tri);

%voronoi(Xcentros,Ycentros)

%plot(vx,vy,"r")
%axis([1 10 1 10])
