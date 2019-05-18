t_a=0.05;
x=-4:t_a:4;

p=(1/sqrt(2*pi))*exp(-x.^2/2);

check = trapz(x,p);

plot(x,p);
title('\fontsize{12}PDF a Gaussian distributed random variable');
xlabel('x','FontSize',12);
ylabel('P(x)','FontSize',12);