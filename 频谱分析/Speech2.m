%% �����Ĳɼ�
clc;
clear;
close all;
filename = '��ʨ.wav';
[y,Fs] = audioread(filename); 
y = y(:,1); % ȡ������
L = length(y); % ������
T = 1/Fs; % ����
t = (0:L-1)*T;   
info = audioinfo(filename); % wav��ϸ��Ϣ
disp(info); % �����Ƶ�ź� ����Ƶ�ʣ�����λ�� ����Ϣ
sound(y,Fs); %�Բ����� Fs ��������������Ƶ�ź� y
i = 0;

%% ��ͼ
i = i+1;
s = 'ԭ��Ƶ�ź�ʱ����ͼ';
plot_time(t,y,s,i); % ����ʱ����ͼ

i = i+1;
s = 'ԭ��Ƶ�ź�Ƶ����ͼ';
plot_freq(Fs,L,y,s,i); % ����Ƶ����ͼ

%% ��������Ƶ�׷�����Ӱ��
%% ���δ�
win_r = boxcar(length(y));
y_win_r = y.*win_r; % ʱ��˻�
sound(y_win_r,Fs);
i = i+1;
s = '���δ�ʱ����ͼ';
plot_time(t,y_win_r,s,i);

i = i+1;
s = '���δ�Ƶ������ͼ';
plot_freq(Fs,L,y_win_r,s,i); 

% ���δ� 1/2
win_r_2 = boxcar(floor(length(y)/2)); % ȡ��������1/2Ϊ���ڳ���
win_r_2 = [win_r_2;zeros(ceil(length(y)/2),1)]; % ���벹0
y_win_r_w = y.*win_r_2;
sound(y_win_r_w,Fs);

i = i+1;
s = '���δ�(N = L/2)ʱ����ͼ';
plot_time(t,y_win_r_w,s,i);

i = i+1;
s = '���δ�(N = L/2)Ƶ������ͼ';
plot_freq(Fs,L,y_win_r_w,s,i); 

%% ������
win_h = hann(length(y));
y_win_h = y.*win_h;
sound(y_win_h,Fs);

i = i+1;
s = '������ʱ����ͼ';
plot_time(t,y_win_h,s,i);

i = i+1;
s = '������Ƶ������ͼ';
plot_freq(Fs,L,y_win_h,s,i);

% ������ 1/2
win_h_2 = hann(floor(length(y)/2));
win_h_2 = [win_h_2;zeros(ceil(length(y)/2),1)]; % ���벹0
y_win_h_2 = y.*win_h_2;
sound(y_win_h_2,Fs);

i = i+1;
s = '������(N = L/2)ʱ����ͼ';
plot_time(t,y_win_h_2,s,i);

i = i+1;
s = '������(N = L/2)Ƶ������ͼ';
plot_freq(Fs,L,y_win_h_2,s,i);

%% ������
win_hm = hamming(length(y));
y_win_hm = y.*win_hm;
sound(y_win_hm,Fs);

i = i+1;
s = '������ʱ����ͼ';
plot_time(t,y_win_hm,s,i);

i = i+1;
s = '������Ƶ������ͼ';
plot_freq(Fs,L,y_win_hm,s,i);
% ������ 1/2
win_hm_2 = hamming(floor(length(y)/2));
win_hm_2 = [win_hm_2;zeros(ceil(length(y)/2),1)]; % ���벹0
y_win_hm_2 = y.*win_hm_2;
sound(y_win_hm_2,Fs);

i = i+1;
s = '������(N = L/2)ʱ����ͼ';
plot_time(t,y_win_hm_2,s,i);

i = i+1;
s = '������(N = L/2)Ƶ������ͼ';
plot_freq(Fs,L,y_win_hm_2,s,i);
%% ����������
win_blk = blackman(length(y));
y_win_blk = y.*win_blk;
sound(y_win_blk,Fs);

i = i+1;
s = '����������ʱ����ͼ';
plot_time(t,y_win_blk,s,i);

i = i+1;
s = '����������Ƶ������ͼ';
plot_freq(Fs,L,y_win_blk,s,i);
% ���������� 1/2
win_blk_2 = blackman(floor(length(y)/2));
win_blk_2 = [win_blk_2;zeros(ceil(length(y)/2),1)]; % ���벹0
y_win_blk_2 = y.*win_blk_2;
sound(y_win_blk_2,Fs);

i = i+1;
s = '����������(N = L/2)ʱ����ͼ';
plot_time(t,y_win_blk_2,s,i);

i = i+1;
s = '����������(N = L/2)Ƶ������ͼ';
plot_freq(Fs,L,y_win_blk_2,s,i);
%% ��ȡ2s
time = 2;
samples = [1,floor(L/2)];
[y_cut,Fs_cut] = audioread(filename,samples);
y_cut = y_cut(:,1); % ȡ������
L_cut = length(y_cut); % ������
T_cut = 1/Fs_cut; % ����
t_cut = (0:L_cut-1)*T_cut;   
sound(y_cut,Fs_cut);

i = i+1;
s = '��Ƶ�źŽ�ȡ2sʱ����ͼ';
plot_time(t_cut,y_cut,s,i); % ����ʱ����ͼ

i = i+1;
s = '��Ƶ�źŽ�ȡ2sƵ����ͼ';
plot_freq(Fs_cut,L_cut,y_cut,s,i); % ����Ƶ����ͼ


%% ��������Ƶ�׷�����Ӱ��
Fs_res = Fs/2;
y_res=resample(y,Fs_res,Fs);%�źŽ���������
% y_res = downsample(y,2);
L_res = length(y_res);
sound(y_res,Fs_res);
t_res = 1/(Fs_res) * (0:L_res-1);

i = i+1;
s = '������ʱ����ͼ';
plot_time(t_res,y_res,s,i);

i = i+1;
s = '������Ƶ������ͼ';
plot_freq(Fs_res,L_res,y_res,s,i);










