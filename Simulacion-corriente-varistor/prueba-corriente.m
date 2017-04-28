XYcentros=randi([1,10],10,2);

%x = randi([1,10],10,2);
%y = randi([1,10],10,1);
%tri = delaunay (XYcentros(1,:), XYcentros(2,:));
[vx, vy] = voronoi(XYcentros(1,:), XYcentros(2,:));

voronoi(XYcentros(1,:), XYcentros(2,:))

%plot(vx,vy,"r")
axis([1 10 1 10])
