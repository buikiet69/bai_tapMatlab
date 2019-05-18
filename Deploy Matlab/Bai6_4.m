clear;
b=1/2;
SNR_db=0:5:30;
	Gamma_average = 2*b*10.^(SNR_db/10);
	p_b=(1-sqrt(Gamma_average./(1+Gamma_average)))/2;
	semilogy(SNR_db,p_b,'r--')
	hold on
	load ex6p3_Res BEP

	semilogy(SNR_db,BEP,'bo')

	hold off
	title('BEP of slow flat Rayleigh fading channel')
	xlabel('\gamma_b')
	ylabel('P_b')
	legend('BEP of QPSK over a fading channel (Theory)','-- (Simulation)')