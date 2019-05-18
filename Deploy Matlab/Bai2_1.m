clear;
f_c=900e6;
c_0=3e8;
v=109.2e3/3600;
f_m=v*f_c/c_0;
ohm_p=2;
t=0:0.001:0.08;
phi_glgl=(ohm_p/2)*besselj(0,2*pi*f_m*t);

plot(t,phi_glgl);

title('The autocrrelation function ACF');
xlabel('\tau');
ylabel('\phi_{glgl}(\tau)');
legend('\phi_{glgl}(\tau)');
phi_glgl_0=(ohm_p/2)*besselj(0,0);