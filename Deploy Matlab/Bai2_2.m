clear;
f_c=900e6;
c_0=3e8;
v=109.2e3/3600;
f_m=v*f_c/c_0
ohm_p=2;
z=-100:1:100;
for i =1:201;
	f=i-101;
if abs(f) <= f_m
	S_glgl(i)=(ohm_p/2*pi*f_m)/sqrt(1-(f/f_m)^2);
else
	S_glgl(i)=0;
end
end
plot(z,S_glgl)
title('The power spectral density (PSD)')
xlabel('f')
ylabel('S_{glgl}(f)')
legend('S_{glgl}(f)')