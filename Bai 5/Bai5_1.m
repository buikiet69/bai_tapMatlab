clear; 
x=round(rand(1,10000)); 
for i=1:2:length(x) 
if x(i)==0 && x(i+1)==0 
S((i+1)/2)=exp(1i*pi/4);
elseif x(i)==0 && x(i+1)==1 
S((i+1)/2)=exp(1i*3*pi/4); 
elseif x(i)==1 && x(i+1)==1
S((i+1)/2)=exp(1i*5*pi/4); 
elseif x(i)==0 && x(i+1)==1
S((i+1)/2)=exp(1i*7*pi/4); 
end 
end 
save ex5p1_Res S x; 	% will be used in exercise 5.2 
plot(S,'*'); 
hold on; 
t=0:0.01:2*pi; 
plot(exp(1i*t),'r--') ; 
xlabel('\phi(t)'); 
ylabel('S_m'); 
title('The complex signal-space diagram for 4-QPSK');

 
         