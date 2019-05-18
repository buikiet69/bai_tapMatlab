clear;
f_m=91;
b=1;
N1=9;
tau_max = 0.08;
t_a = 0.001;
for n=1:N1;
	c1(n)=sqrt(2*b/N1);
	f1(n)=f_m*sin(pi*(n-0.5)/(2*N1));
	th1(n)=2*pi*n/(N1+1);
end

tau=0:t_a:tau_max;
k=1:length(tau);
for n=1:N1
	x(n,k)=(c1(n)^2/2)*cos(2*pi*f1(n).*tau);
end
fay=sum(x);

tau_s=-tau_max:t_a:tau_max;
k=1:length(tau_s);
for n=1:N1
	xs(n,k)=(c1(n)^2/2)*cos(2*pi*f1(n).*tau_s);
end
phi_g1g1_theory =sum(xs);

plot(tau,fay);
hold on;
f_c=900e6;
c_0=3e8;
v=109.2e3/3600;
f_m=v*f_c/c_0;
ohm_p=2;
t=0:0.001:tau_max;
z=2*pi*f_m*t;
phi_g1g1=(ohm_p/2)*besselj(0,z);
plot(tau,phi_g1g1,'r')

load ex4p5_Res;
N = length(phi_g1g1);
phi_g1g1_s = phi_g1g1(N/2:N/2+tau_max/t_a)

plot(tau,phi_g1g1_s,'k.')
title('The autocorrelation fuction (ACF) of the process g1')
xlabel('\tau in seconds')
ylabel('\phi_{g1g1}(\tau)')
legend('\phi_{g1g1}(\tau) Simulation model (Theory)','\phi_{g1g1}(\tau) Reference model','\phi_{g1g1}(\tau) Simulation')
hold off