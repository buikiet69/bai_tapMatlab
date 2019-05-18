clear;
SNR_db=0:8;

SNR_db_simulation=0:2:8;

for i=1:length(SNR_db)
	SNR(i)=10^(SNR_db(i)/10);
	gamma_b(i)=SNR(i);
	p_b(i)=erfc(sqrt(2*gamma_b(i))/sqrt(2))/2;
end
semilogy(SNR_db,p_b,'ro--')
hold on
load ex6p1_Res c BEP;
semilogy(SNR_db_simulation, BEP,'x--')
title('The bit error probability')
xlabel('SNR in dB')
ylabel('P_b')
legend('Theory','Simulation')
hold off