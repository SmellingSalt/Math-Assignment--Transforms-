%% CREATE VARIABLES
fs=1e1;
[X,Y] = meshgrid((-10+1/fs):1/fs:10);
s=X+1j*Y;
t=0:1/(fs*10):15;

%% ENTER THE FUNCTION IN TIME DOMAIN
ft=((sinc(t/pi)).^2);

subplot(2,4,1:4)
plot(t,ft);
grid minor
% xlim([-pi,pi])
xlabel("$$time (s)$$",'Interpreter','Latex')
ylabel('$${f}(t)$$','Interpreter','Latex')
title("Time Domain Function $$f(t)=\frac{sin(t)^2}{t^2} $$",'Interpreter','Latex')
%% ENTER THE FUNCTION IN LAPLACE DOMAIN
f=atan(2./s)-(s./4).*log(abs(1+(4./s^2)));
Xs= abs(f);

for j=5:8
    subplot(2,4,j)
    mesh(X,Y,Xs)
    
    xlabel("$$\sigma$$",'Interpreter','Latex')
    ylabel('$$j\omega$$','Interpreter','Latex')
    zlabel('$$Magnitude Plot$$','Interpreter','Latex')
    title(" $$arctan(\frac{2}{s})-\frac{s}{4}ln|1+\frac{4}{s}|$$",'Interpreter','Latex')
    grid minor
    hold on
end
