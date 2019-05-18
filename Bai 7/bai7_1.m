function y=cha2(SNR_db,S,meg,trellis)
Es=var(S);
Eb=Es/2;
N_0=Eb/10^(SNR_db/10);
N0=sqrt(N_0/2)*(randn(size(S))+j*randn(size(S)));
NS=S+N0;

theta_m=[pi/4,3*pi/4,5*pi/4,7*pi/4];
S_m=exp(j*theta_m);

for i=1:length(S)
    
    d=abs(S_m-NS(i));
    md=mind(d);
    if md==d(1);
        R(2*i-1)=0;
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

opmode='trunc';
dectype='hard';
tblen=12;
r=vitdec(R,trellis,tblen,opmode,dectype);

c=0;
for i=1:length(r)
    if r(i)~=meg(i)
        c=c+1;
    end
end
y=c;
clear;
k=3;
R_c=1/2;
meg=round(rand(1,5000));
conlen=3;
codegen=[7 5];
trellis=poly2trellis(conlen,codegen);
x=convenc(meg,trellis);

for i=1:2:length(x)
    if x(i)==0 && x(i+1)==0
        S((i+1)/2=exp(j*pi/4);
    elseif x(i)==0 & x(i+1)==1
        S((i+1)/2=exp(j*3*pi/4);
    elseif x(i)==1 & x(i+1)==1
        S((i+1)/2=exp(j*5*pi/4);
    elseif x(i)==1 & x(i+1)==0
        S((i+1)/2=exp(j*7*pi/4);
    end
end

SNR_db=0:5;
for i=1:length(SNR_db)
    c(i)=cha2(SNR_db(i),S,meg,trellis);
end
BEF=c/length(meg);
semilogy(SNR_db,BEP,'--')
hold on
SNR_db=0:8
load ex6p1_Res
BEP2=c/length(x);
semilogy(SNR_db,BEP2,'--')
title('The bit error probability')
xlabel('SNR in db'
ylabel('P_b')
legend(P_b with coder','P_b without coder'
hold off
