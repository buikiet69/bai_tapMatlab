clear;

load ex4p1_Res f1 f2 c1 c2 th1 th2

f_s=1000;
T_s=1/f_s;
I1=10000*T_s;
I2=20000*T_s;

t=I1:T_s:I2;

g1=g(c1,f1,th1,t);
phi_g1g1=xcorr(g1,'biased');
i=1:81;
x=(i-1) * T_s;
phi_g1g1_select=phi_g1g1(10001:10081);
plot(x,phi_g1g1_select);
title('The autocorrelation fuction ACF of g1');
save ex4p5_Res phi_g1g1_select f_s phi_g1g1;