clear;
load ex4p1_Res f1 f2 c1 c2 th1 th2

f_s=270800;
T_sim=0.4;
t=0:1/f_s:T_sim;

g1=g(c1,f1,th1,t);

g2=g(c2,f2,th2,t);
g= g1+j*g2;

alpha=abs(g);
alpha_dB=20*log10(alpha);
plot(t,alpha_dB);
title('The channel amplitude in dB');
xlabel('t);
ylabel('\alpha(t)');
legend('\alpha(t) in dB',0);