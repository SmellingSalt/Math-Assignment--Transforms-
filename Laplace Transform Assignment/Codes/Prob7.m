%% CREATE VARIABLES
fs=1e1;
[X,Y] = meshgrid((-10+1/fs):1/fs:10);
s=X+1j*Y;
t=0:1/(fs*10):15;

%% ENTER THE FUNCTION IN TIME DOMAIN
ft=t-(sin(2*t)./2)-heaviside(t-1).*((2*(t-1)-sin(2*(t-1)))/2);

subplot(2,4,5:8)
plot(t,ft);
grid minor
% xlim([-pi,pi])
xlabel("$$time (s)$$",'Interpreter','Latex')
ylabel('$${x}(t)$$','Interpreter','Latex')
title("Time Domain Function $$x(t)=t-\frac{sin2t}{2}+H(t-1)(\frac{2(t-1)-sin(2(t-1))}{2})$$",'Interpreter','Latex')
%% ENTER THE FUNCTION IN LAPLACE DOMAIN
Xs= abs((4.*(1-exp(-s)))./((s.^2).*(s.^2+4)));

for j=1:4
    subplot(2,4,j)
    mesh(X,Y,Xs)
    
    xlabel("$$\sigma$$",'Interpreter','Latex')
    ylabel('$$j\omega$$','Interpreter','Latex')
    zlabel('$$Magnitude Plot$$','Interpreter','Latex')
    title(" $$\frac{4(1-e^{-s})}{s^2(s^2+4)}$$",'Interpreter','Latex')
    grid minor
    hold on
end
