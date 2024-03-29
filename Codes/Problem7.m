clear
clc

fs=1/48e3;
omega=2*pi;
x=linspace(-pi/omega,pi/omega,length(0:fs:0.5-fs));
N=length(x);
%% PROBLEM 7
v0=1;
fx1=v0*sin(omega*x);
fx1(x<=0)=0;

subplot(2,1,1)
plot(x,fx1);
grid minor
xlim([-pi/omega,pi/omega])
xlabel("Time(t)",'Interpreter','Latex')
ylabel('$${f}(t)$$','Interpreter','Latex')
title("Original Function $$f(t)=V_0sin(\Omega t)$$",'Interpreter','Latex')
i=1;
a0=(v0)/pi;
f_approx1=a0;
N1=5000;
for n=1:N1
    if n==1
        an1=0;
        bn1=0.5;
    else
        an1=(((-1).^n+1)*v0)./((1-n.^2)*pi);
        bn1=v0*sin(n*pi)./((1-n.^2)*pi);
    end
    
    cosine_term=cos(n*x*omega).*an1;
    sine_term=sin(n*x*omega).*bn1;
    %Plotting
    
    f_approx1=sine_term+cosine_term+f_approx1;
    
    xlim([0,2])
    %Plotting Harmonics
    if n==2||  n==3 || n==10
        subplot(2,1,2)
        plot(x,f_approx1)
        xlim([0,2])
        legend_name(i,1)=strcat("Upto Harmonic ",num2str(n));
        hold on
        i=i+1;
    end
    if n==N1
        subplot(2,1,2)
        plot(x,f_approx1)
        xlim([0,2])
        legend_name(i,1)=strcat("Upto Harmonic ",num2str(n));
        xlabel("Time (t)",'Interpreter','Latex')
        ylabel('$$\hat{f}(t)$$','Interpreter','Latex')
        title("Fourier Approximated $$f(t)$$",'Interpreter','Latex')
        legend(legend_name);
        grid minor
        
    end
    fprintf("Running Iteration %d\n",n);
end
subplot(2,1,1)
xlim([-pi/omega,pi/omega]);
subplot(2,1,2)
xlim([-pi/omega,pi/omega]);

% %% PROBLEM 1
% fx11=fx;
% fx12=fx;
% fx1=fx11+fx12;
%
% ao
% an
% bn