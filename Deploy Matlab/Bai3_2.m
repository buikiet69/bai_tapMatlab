clear;
k0=0;
k1=3;
k2=10;
R=0.0001:0.05:4.51;
ohm_p=1;
rau=R./sqrt(ohm_p);
k=k0;
L_R=sqrt(2*pi*(k+1)).*rau.*exp(-k- ...
(k+1).*rau.^2).*besseli(0,(2.*rau.*sqrt(k*(k+1))));
for r = 0:0.05:4.5
	x=linspace(0,r);
	a=0:0.05:r;
	i=length(a);
	p=(2.*x.*(k+1)/ohm_p).*exp(-k- ...
((k+1).*x.^2/ohm_p)).*besseli(0,(2.*x.*sqrt(k*(k+1)/ohm_p)));
	CDF(i)=trapz(x,p);
end
ADF= CDF./L_R;
plot(R,ADF)
hold on
k=k1;
L_R1=sqrt(2*pi*(k+1)).*rau.*exp(-k- ...
(k+1).*rau.^2).*besseli(0,(2.*rau.*sqrt(k*(k+1))));
for r =0:0.05:4.5
	x=linspace(0,r);
	a=0:0.05:r;
	i=length(a);
	p=(2.*x.*(k+1)/ohm_p).*exp(-k- ...
((k+1).*x.^2/ohm_p)).*besseli(0,(2.*x.*sqrt(k*(k+1)/ohm_p)));
	CDF1(i)=trapz(x,p);
end
ADF1= CDF1./L_R1;
plot(R,ADF1,'r.')
hold on

k=k2;
L_R2=sqrt(2*pi*(k+1)).*rau.*exp(-k- ...
(k+1).*rau.^2).*besseli(0,(2.*rau.*sqrt(k*(k+1))));
for r = 0:0.05:4.5
	x=linspace(0,r);
	a=0:0.05:r;
	i=length(a);
	p=(2.*x.*(k+1)/ohm_p).*exp(-k- ...
((k+1).*x.^2/ohm_p)).*besseli(0,(2.*x.*sqrt(k*(k+1)/ohm_p)));
	CDF2(i)=trapz(x,p);
end

ADF2= CDF2./L_R2;
plot(R,ADF2,'g-.')
axis([0 2 0 3])
title('The average duration of fading (ADF)')
xlabel('R')
ylabel('t(R) * f_m')
legend('k=0','k=1','k=10')
hold off

	