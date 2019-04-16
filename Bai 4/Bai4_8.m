clear
fm=91;
b=1;
N1=9;
f_1_n=fm*sin(pi*((1:N1)-1/2)/(2*N1));
c_1_n=sqrt(2*b/N1)*ones(size(f_1_n));
theta_1_n=2*pi*(1:N1)/(N1+1);

fs=1000;
t_sim=(10E3:20E3)/fs;

g1_t_tilde=zeros(size(t_sim));
for k=1:length(f_1_n)
	g1_t_tilde =g1_t_tilde+c_1_n(k)*cos(2*pi*f_1_n(k)*t_sim+theta_1_n(k));
end

r_g1_g1=xcorr(g1_t_tilde,'biased');

PSD_S = fft(r_g1_g1);
len_S=length(PSD_S);
f_PSD=(-(len_S-1)/2:(len_S-1)/2)/len_S*fs;

plot(f_PSD,fftshift(abs(PSD_S)/len_S),'b--')
hold on

Omega_p=2;
f=(-fm):1:(fm);
S_f=Omega_p/2/pi/fm./sqrt(1-(f/fm).^2);
plot(f,S_f,'r-')

f_tilde = [-f_1_n(N1:-1:1),f_1_n];
S_mm_tilde=[c_1_n(N1:-1:1).^2,c_1_n.^2]/4;
Stem(f_tilde,S_mm_tilde,'m:x')

hold off

ax=axis;ax(1)=-100;ax(2)=100;ax(3)=0;ax(4)=0.08;axis(ax)
legend('Simulation','Reference Model','Simulation Model')
xlabel('Doppler frequency, f in Hz')
ylabel('PSD, S_{g_1 g_1}(f)')