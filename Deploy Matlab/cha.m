function y=cha(SNR_db,S,x)

Es=var(S);
Eb=Es/2;
N_0=Eb/10^(SNR_db/10);
N0=sqrt(N_0/2)*(randn(size(S))+j*randn(size(S)));
NS=S+N0;

theta_m=[pi/4,3*pi/4,5*pi/4,7*pi/4];
S_m=exp(j*theta_m);

for i=1:length(S)
	d=abs(S_m-NS(i));
	md=min(abs(S_m-NS(i)));
	if md==d(1);
		R(2*i-i)=0;
		R(2*i)=0;
	elseif md==d(2)
		R(2*i-1)=0;
		R(2*i)=1;
	elseif md==d(3)
		R(2*i-1)=1;
		R(2*i)=1;
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
y=c;