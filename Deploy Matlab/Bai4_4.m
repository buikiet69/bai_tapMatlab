clear;

load ex4p1_Res f1 f2 c1 c2 th1 th2

f_s=50000;
T_sim=20;

t=0:1/f_s:T_sim;
g1=g(c1,f1,th1,t);
g2=g(c2,f2,th2,t);
g=g1+j*g2;
alpha=abs(g);
g_mean=mean(g);
g_variance=var(g);
g1_mean=mean(g1);
g1_variance=var(g1);
alpha_mean=mean(alpha);
alpha_variance=var(alpha);
n=length(alpha);
x=0:0.1:3;
b=hist(alpha,x);

figure(1);
stem(x,b/n/(x(2)-x(1)));
hold on;

k=0;
ohm_p=2;
p_alpha=(2.*x.*(k+1)/ohm_p).*exp(-k-((k+1).*x.^2/ohm_p)).*besseli(0,(2.*x.*sqrt(k*(k+1)/ohm_p)));
plot(x,p_alpha,'r');
title('The PDF of alpha(x)');
xlabel('x');
ylabel('P_{\alpha}(x)');
legend('p_{\alpha}(x)','Rayleigh distribution(Theory)');
hold off;

figure(2);

n1=length(g1);
x1=-4:0.1:4;
c=hist(g1,x1);
stem(x1,c/n1/(x1(2)-x1(1)));
hold on;
p=(1/sqrt(2*pi))*exp(-x1.^2/2);
plot(x1,p,'r');
title('The PDF of g1 process')
xlabel('x');
ylabel('P_{g1}(x)');
legend('p_{g1}(x)','Gaussian distribution (Theory)');
hold off;