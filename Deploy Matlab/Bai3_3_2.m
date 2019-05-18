clear;
k=2;
x=0:0.01:3;
ohm_p=1;
p_elfa=(2.*x.*(k+1)/ohm_p).*exp(-k- ...
((k+1).*x.^2/ohm_p)).*besseli(0,(2.*x.*sqrt(k*(k+1)/ohm_p)));
plot(x,p_elfa)
hold on

m=1.8;
p_alpha1=(2*m^m.*x.^(2*m-1)/gamma(m)*ohm_p^m).*exp(-m.*x.^2/ohm_p);
plot(x,p_alpha1,'r-.')
hold off
title('The Rice & Nakagami distribution p_{\alpha}(x)')
xlabel('x')
ylabel('p_{\alpha}(x)')
legend('Rice p_{\alpha}(x) with k=2','Nakagami p_{\alpha}(x) with m=1.8')
