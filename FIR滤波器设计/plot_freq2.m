function y = plot_freq2(Fs,L,x,s,i) 
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
% axis([0 3000 0 0.005]); 




