function y = plot_freq(Fs,L,x,s,i) 
% 绘制频域幅度波形图
% Fs：采样频率
% L：序列长度
% x：幅值
% s：标题名称
% i：标识序号
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
y_fft = (fft(x)/L*2); % 幅度图 /(N/2) 恢复真实幅值
y2 = abs(fftshift(y_fft)); % 平移
f = (Fs * (0:L-1)/L)';
f_s = (-L/2:L/2-1)*(Fs/L);
plot(f_s,y2);
%plot(f(1:floor(length(f)/2)),y_fft(1:floor(length(f)/2))); % 取正主值区间
title(s);
axis([0 2000 0 max(y2)]); % 取主频部分
xlabel('f (Hz)');
ylabel('|X(k)|');
%}


