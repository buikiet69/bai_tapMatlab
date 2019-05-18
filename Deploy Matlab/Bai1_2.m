clear;
m_mu=0;
sigma_mu=1;
n=1000000;
x=-4:0.05:4;
p=(1/sqrt(2*pi)*sigma_mu)*exp(-(x-m_mu).^2/2*sigma_mu^2);
check=trapz(x,p)
plot(x,p,'r');
hold on;


y=randn(1,n);
m = mean(y)
variance = std(y)^2
x2=-4:0.1:4;
c=hist(y,x2);
stem(x2,c/n/(x2(2)-x2(1)));

title('Gaussoan distributed PDF');
xlabel('X')
ylabel('P(X)');
legend('theoretical','experimental');
hold off;

