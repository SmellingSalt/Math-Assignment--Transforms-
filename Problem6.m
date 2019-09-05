clear
clc

fs=1/48e3;
x=0:fs:2-fs;
N=length(x);
%% PROBLEM 6
% my_support=my_support(my_support>=0);
% my_support=my_support(my_support<2);
x1=x;
x2=x;
x1(1,N/2:end)=0;
x2(1,1:N/2-1)=2;


fx1=x1*pi;
fx2=(2-x2)*pi;

fx=fx1+fx2;

subplot(2,1,1)
plot(x,fx);
grid minor
xlim([0,2])
xlabel("Time(t)",'Interpreter','Latex')
ylabel('$${f}(t)$$','Interpreter','Latex')
title("Original Function $$f(t)=x\pi $$ or $$ (2-x)\pi$$",'Interpreter','Latex')
i=1;
a0=pi/2;
f_approx1=a0;
N1=500;
for n=1:N1
    an1=2*((-1).^n-1)./(n.^2*pi);
    bn1=2*sin(n*pi)./(n.^2*pi);
    
    cosine_term=cos(n*x*pi).*an1;
    sine_term=sin(n*x*pi).*bn1;
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


% %% PROBLEM 1
% fx11=fx;
% fx12=fx;
% fx1=fx11+fx12;
%
% ao
% an
% bn