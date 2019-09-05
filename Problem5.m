clear
clc

fs=1/48e3;
x=-10:fs:10;
fx=zeros(length(x),1);
%% PROBLEM 3
my_support=x;
my_support=my_support(my_support>0);
my_support=my_support(my_support<2*pi);

x1=my_support;
fx1=x1.*cos(x1);
subplot(2,1,1)
plot(x1,fx1);
grid minor
xlim([0,2*pi])
xlabel("Time(t)",'Interpreter','Latex')
ylabel('$${f}(t)$$','Interpreter','Latex')
title("Original Function $$f(t)=xcos(x)$$",'Interpreter','Latex')
i=1;
a0=(1-exp(-2*pi))/(2*pi);
f_approx1=a0;
N1=1000;
for n=2:N1
    an1=(1-exp(-2*pi))./((n.^2-1)*pi);
    bn1=(n.*(1-exp(-2*pi)))./((n.^2+1)*pi);
    
    cosine_term=cos(n*x1).*an1;
    sine_term=sin(n*x1).*bn1;
    %Plotting
    
    f_approx1=sine_term+cosine_term+f_approx1;
    xlim([0,2*pi])
    %Plotting Harmonics
    if n==2||  n==3 || n==10
        subplot(2,1,2)
        plot(x1,f_approx1)
        xlim([0,2*pi])
        legend_name(i,1)=strcat("Upto Harmonic ",num2str(n));
        hold on
        i=i+1;
    end  
    if n==N1
        subplot(2,1,2)
        plot(x1,f_approx1)
        xlim([0,2*pi])
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