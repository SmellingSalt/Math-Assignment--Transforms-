X = linspace(0,2*pi,100);
Y = X./X;
Z = cumtrapz(X,Y);
plot(X , [Y; Z])