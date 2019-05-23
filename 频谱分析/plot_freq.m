function y = plot_freq(Fs,L,x,s,i) 
% ����Ƶ����Ȳ���ͼ
% Fs������Ƶ��
% L�����г���
% x����ֵ
% s����������
% i����ʶ���
figure(i);

y_fft = fft(x);
P2 = abs(y_fft/L);
P1 = P2(1:floor(L/2)+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;

plot(f,P1);
title(s);
xlabel('f (Hz)');
ylabel('|X(k)|');
axis([0 3000 0 0.005]); 
%{
y_fft = (fft(x)/L*2); % ����ͼ /(N/2) �ָ���ʵ��ֵ
y2 = abs(fftshift(y_fft)); % ƽ��
f = (Fs * (0:L-1)/L)';
f_s = (-L/2:L/2-1)*(Fs/L);
plot(f_s,y2);
%plot(f(1:floor(length(f)/2)),y_fft(1:floor(length(f)/2))); % ȡ����ֵ����
title(s);
axis([0 2000 0 max(y2)]); % ȡ��Ƶ����
xlabel('f (Hz)');
ylabel('|X(k)|');
%}


