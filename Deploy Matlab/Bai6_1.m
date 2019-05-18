clear all;

load ex5p1_Res S x;

SNR_db=0:2:8;

for i=1:length(SNR_db)
	c(i)=cha(SNR_db(i),S,x);
end

BEP=c/length(x);
semilogy(SNR_db,BEP,'.--')
title('The bit error probability')
xlabel('SNR in dB')
ylabel('P_b')
legend('P_b')
save ex6p1_Res c BEP
