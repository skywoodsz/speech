%% 声音的采集
clc;
clear;
close all;
filename = '三狮.wav';
[y,Fs] = audioread(filename); 
y = y(:,1); % 取单声道
L = length(y); % 采样点
T = 1/Fs; % 周期
t = (0:L-1)*T;   
info = audioinfo(filename); % wav详细信息
disp(info); % 输出音频信号 采样频率，采样位数 等信息
%sound(y,Fs); %以采样率 Fs 向扬声器发送音频信号 y
i = 0;

%% 原音频信号频域波形图
i= i+1;
s = '原音频信号频域波形图';
plot_freq2(Fs,L,y,s,i); % 绘制频域波形图

%% 加噪
A = 0.002;
f = 1.5 * 10000;
x = A * cos(2 * pi * f * t)';
y = y + x;
i= i+1;
s = '加噪信号频域波形图';
plot_freq2(Fs,L,y,s,i); % 绘制频域波形图
%sound(y,Fs);
%% fir滤波器设计
% 类型与指标：
% 低通滤波器
% 通带截至频率 5kHz
% 阻带截至频率 10kHz
% 阻带最小衰减 50dB
% 采样频率 44100Hz
fp = 5 * 1000;
fs = 10 * 1000;
wp = 2 * pi * fp/Fs;
ws = 2 * pi *fs/Fs;
fc = (fp + fs)/2; % FIR截止频率
w_bw = ws - wp; % 过渡带宽

%% 基于汉宁窗
% 44dB
% A = 6.2 * pi
A_hanning = 6.2 *pi;
N0 = ceil(A_hanning / w_bw); % N = A/Bt
N = N0 + mod(N0+1,2); % 确保N为奇数，方便设计
win = hann(N); % 汉宁窗
F_Nyquist  = Fs/2; % 奈奎斯特频率
Wc = fc/F_Nyquist; % 奈奎斯特频率归一化

lpf = fir1(N-1,Wc,win);
i = i+1;
figure(i);
stem(lpf); % 波形
i = i+1;
figure(i);
freqz(lpf,1,512); %幅频响应损耗函数曲线

%% 基于哈明窗
% 53dB
% A = 6.6 * pi
A_hamming = 6.6 *pi;

N0 = ceil(A_hamming / w_bw); % N = A/Bt
N = N0 + mod(N0+1,2); % 确保N为奇数，方便设计

win = hamming(N); % 哈明窗

F_Nyquist  = Fs/2; % 奈奎斯特频率
Wc = fc/F_Nyquist; % 奈奎斯特频率归一化

lpf = fir1(N-1,Wc,win);
i = i+1;
figure(i);
stem(lpf); % 波形
i = i+1;
figure(i);
freqz(lpf,1,512); %幅频响应损耗函数曲线

%% 基于布莱克曼窗
% 74dB
% A = 11 * pi
A_hamming = 11 *pi;

N0 = ceil(A_hamming / w_bw); % N = A/Bt
N = N0 + mod(N0+1,2); % 确保N为奇数，方便设计

win = blackman(N); % 布莱克曼窗

F_Nyquist  = Fs/2; % 奈奎斯特频率
Wc = fc/F_Nyquist; % 奈奎斯特频率归一化

lpf = fir1(N-1,Wc,win);
i = i+1;
figure(i);
stem(lpf); % 波形
i = i+1;
figure(i);
freqz(lpf,1,512); %幅频响应损耗函数曲线

%% 低通滤波
y_filter = filter(lpf,1,y);
i= i+1;
s = '低通滤波信号频域波形图';
plot_freq2(Fs,L,y_filter,s,i); % 绘制频域波形图
sound(y_filter,Fs);















