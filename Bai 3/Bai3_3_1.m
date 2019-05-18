clear;
m1=0.5;
m2=1;
m3=4;
m4=20;
x=0:0.05:3;
m=m1;
p_alpha1=(2*m^m.*x.^(2*m-1)/gamma(m)*ohm_p^m).*exp(-m.*x.^2/ohm_p);
plot(x,p_alpha1)
hold on

m=m2;
p_alpha2=(2*m^m.*x.^(2*m-1)/gamma(m)*ohm_p^m).*exp(-m.*x.^2/ohm_p);
plot(x,p_alpha2,'r.')

m=m3
p_alpha3=(2*m^m.*x.^(2*m-1)/gamma(m)*ohm_p^m).*exp(-m.*x.^2/ohm_p);
plot(x,p_alpha3,'g-.')

m=m4
p_alpha4=(2*m^m.*x.^(2*m-1)/gamma(m)*ohm_p^m).*exp(-m.*x.^2/ohm_p);
plot(x,p_alpha4,'m--')
hold off
title('The Nakagami distribution p_{\alpha}(x)')
xlabel('x')
ylabel('p_{alpha}(x)')
legend('m=0.5','m=1','m=4','m=20')


