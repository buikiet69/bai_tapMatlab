function chann_1=receiver(SNR_db,S_m,FS,x,S,g);
Es=var(S);
Eb=Es/2;
N_0=sqrt(N_0/2)*(randn(size(FS))+j*randn(size(FS)));
NFS=(FS+N0)./g;

for i=1:length(FS)
	d=abs(S_m-NFS(i));;

	md=min(d);
	if md==d(1);
		R(2*i-1)=0;
		R(2*i)=0;
	elseif md==d(2)
		R(2*i-1)=0;
		R(2*i)=1;
	elseif md==d(3)
		R(2*i-1)=1;
`		R(2*i)=1;
	elseif md==d(4)
		R(2*i-1)=1;
		R(2*i)=0;
	end

end
c=0;
for i=1:length(x)
	if R(i) ~= x(i);
		c=c+1;
	end
end
chann_1=c;

clear;
load ex5p1_Res;
S=S(1:20000);
x=x(1:40000);

f_m=91;
b=1/2;
N1=9;
N2=N1+1;
	f1=f_m*sin(pi/2/N1*((1:N1)-1/2));
	c1=sqrt(2*b/N1)*ones(size(f1));

	th1=rand(size(f1))*2*pi;
	f2=f_m*sin(pi/2/N2*((1:N2)-1/2));
	c2=sqrt(2*b/N2)*ones(size(f2));

	th2=rand(size(f2))*2*pi;
f_s=270800;

T_symb=1/f_s;

t=(0:length(S)-1)*T_symb;
g1=g(c1,f1,th1,t);
g2=g(c2,f2,th2,t);
g=g1+j*g2;

FS=g.*S;

theta_m=[pi/4,3*pi/4,5*pi/4,7*pi/4];
S_m=exp(j*theta_m);
for i=1:length(S)/4
	gS_m(4*i-3:4*i)=S_m.*g(4*i-3:4*i);
end

SNR_db=0:5:30;
for i=1:length(SNR_db)
	c(i)=receiver(SNR_db(i),S_m,FS,x,S,g);
end

BEP=c/length(x);

save ex6p3_Res BEP;

semilogy(SNR_db,BEP,'.--')
title('The bit error probability of QPSK over a fading channel')
xlabel('SNR in dB')
ylabel('P_b')