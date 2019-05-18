clear;
k0=0;
k1=3;
k2=10;
R=0:0.05:4.5;

ohm_p=1;
rau=R./sqrt(ohm_p);
k=k0;

L_R=sqrt(2*pi*(k+1)).*rau.*exp(-k- ...
(k+1).*rau.^2).*besseli(0,2.*rau.*sqrt(k*(k+1))));
plot(R,L_R)
hold on

k=k1;
L_R1=sqrt(2*pi*(k+1)).*rau.*exp(-k- ...
(k+1).*rau.^2).*besseli(0,(2.*rau.*sqrt(k*(k+1))));
plot(R,L_R1,'r.')

k=k2;
L_R2=sqrt(2*pi*(k+1)).*rau.*exp(-k- ...
(k+1).*rau.^2).*besseli(0,(2.*rau.*sqrt(k*(k+1))));
plot(R,L_R2,'k-.')
title('The Level Crossing Rate (LCR)')
xlabel('R')
ylabel('L_R(R)/f_m')
legend('k=0','k=1','k=10')
hold off

