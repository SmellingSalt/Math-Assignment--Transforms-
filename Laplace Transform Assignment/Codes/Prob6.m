%% CREATE VARIABLES
fs=1e1;
[X,Y] = meshgrid((-12+1/fs):1/fs:12);
s=X+1j*Y;
t=0:1/(fs*10):15;

%% ENTER THE FUNCTION IN TIME DOMAIN
ft=sin(t)+heaviside(t-1).*(1-cos(t-1));

subplot(2,4,5:8)
plot(t,ft);
grid minor
% xlim([-pi,pi])
xlabel("$$time (s)$$",'Interpreter','Latex')
ylabel('$${f}(t)$$','Interpreter','Latex')
title("Time Domain Function $$f(t)=sint+H(t-1)(1-cos(t-1))$$",'Interpreter','Latex')
%% ENTER THE FUNCTION IN LAPLACE DOMAIN
Xs= abs((1./(s.^2+1))+exp(-s)./(s.*(s^2+1)));

for j=1:4
    subplot(2,4,j)
    mesh(X,Y,Xs)
    
    xlabel("$$\sigma$$",'Interpreter','Latex')
    ylabel('$$j\omega$$','Interpreter','Latex')
    zlabel('$$Magnitude Plot$$','Interpreter','Latex')
    title(" $$\frac{1}{(s^2+1)}+\frac{e^{-s}}{s(s^2+1)}$$",'Interpreter','Latex')
    grid minor
    hold on
end
