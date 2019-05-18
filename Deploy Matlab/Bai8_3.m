function [h,t_next] = MCM_channel_model(u,initial_number_of_summations, symbol_duration, f_dmax, channel_coefficients);
t - initial_time;

Channel_Length = length(channel_coefficients);

h_vector = [];

for k=1:Channel_Length;
    u_k = u(k,:);
    phi  = 2* pi * u_k;
    f_d = f_dmax * sin(2*pi*u_k);

    h_tem = channel_coefficients(k)*1/(sqrt(initial_number_of_summations))*sum(exp(j*phi).*exp(j*2*pi*f_d*t));
    h_vector = [h_vector, h_tem];
end;

h = h_vector;
t_next = initial_time + symbol_duration;

clear all;

NFFT = 64;

G = 9;
M_ary = 16;
t_a = 50*10^(-9);

load rho.am -ascii;

N_P = length(rho);

symbol_duration = NFFT * t_a;
number_of_summations = 40;

f_dmax = 50.0;

NofOFDMSymbol = 1000;

length_data = (NofOFDMSymbol) * NFFT;

source_data = randint(length_data,sqrt(M_ary));

symbols = bi2de(source_data);

QAM_Symbol = dmoce(symbols,1,1,'qam',M_ary);

Data_Pattern = [];
for i=0:NofOFDMSymbol-1;
    QAM_tem = [];
    for n=1:NFFT;
        QAM_tem = [QAM_tem,QAM_Symbol(i*NFFT+n)];
    end;
    Data_Pattern = [Data_Pattern;QAM_tem];

    clear QAM_tem;
end;

Number_Relz = 50;
ser_relz = [];
for number_of_relialization = 1:Number_Relz;

u = rand(N_P,number_of_summations);

ser = [];

snr_min = 0;
snr_max = 25;
step = 1;
for snr = snr_min:step:snr_max;

snr = snr - 10*log10((NFFT+G)/NFFT);

rs_frame = [];
h_frame = [];
initial_time = 0;

for i = 0:NofOFDMSymbol-1;

OFDM_signal_tem = OFDM_Modulator(Data_Pattern(i+1,:),NFFT,G);

[h,t] = MCM_channel_model(u, initial_time, number_of_summations, symbol_duration, f_dmax, rho);

h_frame = [h_frame;h];

rs = conv(OFDM_signal_tem, h);

rs = awgn(rs,snr,'measured','dB');

rs_frame = [rs_frame;rs];

initial_time = t;
clear OFDM_signal_tem;
end;

Receiver_Data = [];

d = [];
data_symbol = [];

for i=1:NofOFDMSymbol;
    if (N_P>G+2) & (i>1)
        previous_symbol = rs_frame(i-1,:);

        ISI_term = previous_symbol(NFFT+2*G+1:NFFT+G+N_P-1);
        ISI = [ISI_term,zeros(1,length(previous_symbol)-length(ISI_term))];

        rs_i = rs_frame(i,:) + ISI;

    else
        rs_i = rs_frame(i,:);
    end;

    Demodulated_signal_i = OFDM_Demodulatior(rs_i,NFFT,NFFT,G);

    h = h_frame(i,:);

    H = fft([h,zeros(1,NFFT-N_P)]);

    d = Demodulated_signal_i./H;

    demodulated_signal_i = ddemodce(d,1,1,'QAM',M_ary);

    data_symbol = [data_symbol,demodulated_signal_i];
end;

    // data_symbol = data_symbol';
    [number,ratio] = symerr(symbols,data_symbol);

    ser = [ser,ratio];

end;

ser_relz = [ser_relz;ser];
end;

ser = sum(ser_relz)/Number_Relz;

snr = snr_min:step:snr_max;

semilogy(snr,ser,'bo');

ylabel('SER');
xlabel('SNR in dB');
    