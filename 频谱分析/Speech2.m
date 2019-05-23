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
sound(y,Fs); %以采样率 Fs 向扬声器发送音频信号 y
i = 0;

%% 绘图
i = i+1;
s = '原音频信号时域波形图';
plot_time(t,y,s,i); % 绘制时域波形图

i = i+1;
s = '原音频信号频域波形图';
plot_freq(Fs,L,y,s,i); % 绘制频域波形图

%% 窗函数对频谱分析的影响
%% 矩形窗
win_r = boxcar(length(y));
y_win_r = y.*win_r; % 时域乘积
sound(y_win_r,Fs);
i = i+1;
s = '矩形窗时域波形图';
plot_time(t,y_win_r,s,i);

i = i+1;
s = '矩形窗频率域波形图';
plot_freq(Fs,L,y_win_r,s,i); 

% 矩形窗 1/2
win_r_2 = boxcar(floor(length(y)/2)); % 取语音长度1/2为窗口长度
win_r_2 = [win_r_2;zeros(ceil(length(y)/2),1)]; % 对齐补0
y_win_r_w = y.*win_r_2;
sound(y_win_r_w,Fs);

i = i+1;
s = '矩形窗(N = L/2)时域波形图';
plot_time(t,y_win_r_w,s,i);

i = i+1;
s = '矩形窗(N = L/2)频率域波形图';
plot_freq(Fs,L,y_win_r_w,s,i); 

%% 汉宁窗
win_h = hann(length(y));
y_win_h = y.*win_h;
sound(y_win_h,Fs);

i = i+1;
s = '汉宁窗时域波形图';
plot_time(t,y_win_h,s,i);

i = i+1;
s = '汉宁窗频率域波形图';
plot_freq(Fs,L,y_win_h,s,i);

% 汉宁窗 1/2
win_h_2 = hann(floor(length(y)/2));
win_h_2 = [win_h_2;zeros(ceil(length(y)/2),1)]; % 对齐补0
y_win_h_2 = y.*win_h_2;
sound(y_win_h_2,Fs);

i = i+1;
s = '汉宁窗(N = L/2)时域波形图';
plot_time(t,y_win_h_2,s,i);

i = i+1;
s = '汉宁窗(N = L/2)频率域波形图';
plot_freq(Fs,L,y_win_h_2,s,i);

%% 哈明窗
win_hm = hamming(length(y));
y_win_hm = y.*win_hm;
sound(y_win_hm,Fs);

i = i+1;
s = '哈明窗时域波形图';
plot_time(t,y_win_hm,s,i);

i = i+1;
s = '哈明窗频率域波形图';
plot_freq(Fs,L,y_win_hm,s,i);
% 哈明窗 1/2
win_hm_2 = hamming(floor(length(y)/2));
win_hm_2 = [win_hm_2;zeros(ceil(length(y)/2),1)]; % 对齐补0
y_win_hm_2 = y.*win_hm_2;
sound(y_win_hm_2,Fs);

i = i+1;
s = '哈明窗(N = L/2)时域波形图';
plot_time(t,y_win_hm_2,s,i);

i = i+1;
s = '哈明窗(N = L/2)频率域波形图';
plot_freq(Fs,L,y_win_hm_2,s,i);
%% 布莱克曼窗
win_blk = blackman(length(y));
y_win_blk = y.*win_blk;
sound(y_win_blk,Fs);

i = i+1;
s = '布莱克曼窗时域波形图';
plot_time(t,y_win_blk,s,i);

i = i+1;
s = '布莱克曼窗频率域波形图';
plot_freq(Fs,L,y_win_blk,s,i);
% 布莱克曼窗 1/2
win_blk_2 = blackman(floor(length(y)/2));
win_blk_2 = [win_blk_2;zeros(ceil(length(y)/2),1)]; % 对齐补0
y_win_blk_2 = y.*win_blk_2;
sound(y_win_blk_2,Fs);

i = i+1;
s = '布莱克曼窗(N = L/2)时域波形图';
plot_time(t,y_win_blk_2,s,i);

i = i+1;
s = '布莱克曼窗(N = L/2)频率域波形图';
plot_freq(Fs,L,y_win_blk_2,s,i);
%% 截取2s
time = 2;
samples = [1,floor(L/2)];
[y_cut,Fs_cut] = audioread(filename,samples);
y_cut = y_cut(:,1); % 取单声道
L_cut = length(y_cut); % 采样点
T_cut = 1/Fs_cut; % 周期
t_cut = (0:L_cut-1)*T_cut;   
sound(y_cut,Fs_cut);

i = i+1;
s = '音频信号截取2s时域波形图';
plot_time(t_cut,y_cut,s,i); % 绘制时域波形图

i = i+1;
s = '音频信号截取2s频域波形图';
plot_freq(Fs_cut,L_cut,y_cut,s,i); % 绘制频域波形图


%% 降采样对频谱分析的影响
Fs_res = Fs/2;
y_res=resample(y,Fs_res,Fs);%信号降采样处理
% y_res = downsample(y,2);
L_res = length(y_res);
sound(y_res,Fs_res);
t_res = 1/(Fs_res) * (0:L_res-1);

i = i+1;
s = '降采样时域波形图';
plot_time(t_res,y_res,s,i);

i = i+1;
s = '降采样频率域波形图';
plot_freq(Fs_res,L_res,y_res,s,i);










