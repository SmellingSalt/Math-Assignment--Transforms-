fs=1/48e3;
x=-10:fs:10;
fx=zeros(length(x),1);
%% PROBLEM 1
my_support=x;
my_support=my_support(my_support>-pi);
my_support=my_support(my_support<pi);

x1=my_support;
fx1=x1+pi;
subplot(2,1,1)
plot(x1,fx1);
grid minor
xlim([-pi,pi])
xlabel("Time(t)",'Interpreter','Latex')
ylabel('$${f}(t)$$','Interpreter','Latex')
title("Original Function $$f(t)=(x+pi)$$",'Interpreter','Latex')
i=1;
a0=2*pi^2;
f_approx1=a0;
N1=600;
for n=1:N1
    an1=2*sin(n*pi)./n;
    bn1=2*(sin(n*pi)-pi*n.*cos(n*pi))./(pi*n^2);
    
    sine_term=cos(n*x).*an1;
    cosine_term=sin(n*x).*bn1;
    %Plotting
    
    f_approx1=sine_term+cosine_term+f_approx1;
    
    xlim([-pi,pi])
    %Plotting Harmonics
    if n==2||  n==3 || n==10
        subplot(2,1,2)
        plot(x,f_approx1)
        legend_name(i,1)=strcat("Upto Harmonic ",num2str(n));
        hold on
        i=i+1;
    end
    if n==N1
        subplot(2,1,2)
        plot(x,f_approx1)
        legend_name(i,1)=strcat("Convergence Failing Harmonic ",num2str(n));
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