clear;
x=round(rand(1,10000));
 for i=1:2:length(x)
     if x(i)==0 & x(i+1)==0
         S((i+1)/2)=exp(j*pi/4);
     elseif x(i)==0 & x(i+1)==1
         S((i+1)/2)=exp(j*3*pi/4);
     elseif x(i)==1 & x(i+1)==1
         S((i+1)/2)=exp(j*5*pi/4);
     elseif x(i)==1 & x(i+1)==0
         S((i+1)/2)=exp(j*7*pi/4);
     end
 end
 
 save ex5p1_Res S x;
 plot(S,'*');
 hold on;
 
 t=0;0.01:2*pi;
 plot(exp(j*t),'r--');
 
 xlabel('\phi(t)');
 ylabel('S_m');
 title('Te complex signal-space diagram for 4-QPSK');
 
         