%% CREATE VARIABLES
fs=1e1;
[X,Y] = meshgrid((-10+1/fs):1/fs:10);
s=X+1j*Y;
t=0:1/(fs*10):15;

%% ENTER THE FUNCTION IN TIME DOMAIN
ft=exp(-4*t).*sinint(t);

subplot(2,4,1:4)
plot(t,ft);
grid minor
% xlim([-pi,pi])
xlabel("$$time (s)$$",'Interpreter','Latex')
ylabel('$${f}(t)$$','Interpreter','Latex')
title("Time Domain Function $$f(t)=e^{-4t} \int_{0}^{t} \frac{sint}{t} dt$$",'Interpreter','Latex')
%% ENTER THE FUNCTION IN LAPLACE DOMAIN
Xs= abs((atan(3./(s+4)))./(s+4));

for j=5:8
    subplot(2,4,j)
    mesh(X,Y,Xs)
    
    xlabel("$$\sigma$$",'Interpreter','Latex')
    ylabel('$$j\omega$$','Interpreter','Latex')
    zlabel('$$Magnitude Plot$$','Interpreter','Latex')
    title(" $$\frac{1}{s+4}arctan(\frac{3}{s+4})$$",'Interpreter','Latex')
    grid minor
    hold on
end
