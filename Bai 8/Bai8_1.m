function [y]= OFDM_Modulator(data,NFFT,G);

chnr = length(data);
N= NFFT;

x= [data,zeros(1,NFFT - chrn)];

a= ifft(x);
y=[a(NFFT-G+1:NFFT),a];

function [y]= OFDM_Demodulator(data,chnr,NFFT,G);

x_remove_guard_interval = [data(G+1:NFFT+G)];
	x=fft(x_remove_guard_interval);
	
	y=x(1:chnr);

	clear all;
	
	NFFT = 64;
	G = 9;

	M_ary = 16;
	t_a = 50*10^(-9);
	load rho,am-ascii;
	rho = [100, 0.6095, 0.4945, 0.3940, 0.2371, 0.19, 0.1159, 0.0699, 0.046]
	h = sqrt(rho);
	N_P = length(rho);
	H = fft[h,zeros(1,NFFT-N_P)];
	NofOFDMSymbol = 100;

	length_data = (NofOFDMSymbol) * NFFT;

	source_data = randint(length_data,sqrt(M_ary));
	symbols = bi2de(source_data);
	QAM_Symbol = dmodce(symbols,1,1,'qam',M_ary);
	
	Data_Pattern = [];
	
	for i=0:NofOFDMSymbol-1;
		QAM_tem=[];
		for n=1:NFFT;
			QAM_tem = [QAM_tem,QAM_Symbol(i*NFFT+n)];
		end;
		Data_Pattern = [Data_Pattern;QAM_tem];

		clear QAM_tem;
end;

ser=[];
snr_min = 0;
snr_max = 25;
step = 1;
for snr = snr_min:step:snr_max;

snr = snr - 10*log10((NFFT+G)/NFFT);

rs_frame = [];

for i=0:NofOFDMSymbol-1;
	OFDM_signal_tem = OFDM_Modulator(Data_Pattern(i+1,:),NFFT,G);
	rs = conv(OFDM_signal_tem,h);

	rs = awgn(rs,snr,'measured','dB');
	
	rs_frame = [rs_fram; rs];
	
	clear OFDM_signal_tem;
end;

Receiver_Data = [];
d = [];
data_symbol = [];

for i=1:NofOFDMSymbol;
	if(N_P > G+1) & (i>1)
		previous_symbol = rs_frame(i-1,:);
		ISI_term = previous_symbol(NFFT+2*G+1: NFFT+G+N_P-1);
		ISI = [ISI_term,zeroz(1,length(previous_symbol)-length(ISI_term))];
		rs_i = rs_frame(i,:) + ISI;
	else
		rs_i = rs_frame(i,:);
end;

	Demodulated_signal_i = OFDM_Demodulator(rs_i,NFFT,NFFT,G);
	d=Demodulated_signal_i./H;
	demodulated_symbol_i= ddemodce(d,1,1,'QAM',M_ary);
	data_symbol = [data_symbol, demodulated_symbol_i];
end;
	
	data_symbol = data_symbol';
	[number,ratio] = symerr(symbols,data_symbol);

	ser = [ser, ratio];
end;

snr = snr_min:step:snr_max;

semilogy(snr,ser,'bo');

ylabel('SER');
xlabel('SNR in dB');
