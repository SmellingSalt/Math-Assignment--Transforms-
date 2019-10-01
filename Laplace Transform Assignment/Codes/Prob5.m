%% CREATE VARIABLES
fs=1e1;
[X,Y] = meshgrid((-10+1/fs):1/fs:10);
s=X+1j*Y;
t=0:1/(fs*10):15;

%% ENTER THE FUNCTION IN TIME DOMAIN
ft=(t.*sin(t)./2);

subplot(2,4,5:8)
plot(t,ft);
grid minor
% xlim([-pi,pi])
xlabel("$$time (s)$$",'Interpreter','Latex')
ylabel('$${f}(t)$$','Interpreter','Latex')
title("Time Domain Function $$f(t)=t \frac{sint}{2}$$ $$[\alpha=0;$$ $$ n=1]$$",'Interpreter','Latex')
%% ENTER THE FUNCTION IN LAPLACE DOMAIN
Xs= abs((s./((s+1).^2)));

for j=1:4
    subplot(2,4,j)
    mesh(X,Y,Xs)
    
    xlabel("$$\sigma$$",'Interpreter','Latex')
    ylabel('$$j\omega$$','Interpreter','Latex')
    zlabel('$$Magnitude Plot$$','Interpreter','Latex')
    title(" $$\frac{s}{(s+4^2)}$$",'Interpreter','Latex')
    grid minor
    hold on
end
