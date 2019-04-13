clear
f_m=91;
b=1;
N1=9;
N2=10;

for n=1:1:N1;
	cl(n)=sqrt(2*b/N1);
	f1(n)=f_m*sin(pi*(n-0.5)/(2*N1));
end

for n=1:1:N2;
	c2(n)=sqrt(2*b/N2);
	f2(n)=f_m*sin(pi*(n-0.5)/(2*N2));
	th2(n)=2*pi*n/(N2+1);
end

save ex4p1_Res f1 f2 cl c2 th1 th2
	
