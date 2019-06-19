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
%sound(y,Fs); %�Բ����� Fs ��������������Ƶ�ź� y
i = 0;

%% ԭ��Ƶ�ź�Ƶ����ͼ
i= i+1;
s = 'ԭ��Ƶ�ź�Ƶ����ͼ';
plot_freq2(Fs,L,y,s,i); % ����Ƶ����ͼ

%% ����
A = 0.002;
f = 1.5 * 10000;
x = A * cos(2 * pi * f * t)';
y = y + x;
i= i+1;
s = '�����ź�Ƶ����ͼ';
plot_freq2(Fs,L,y,s,i); % ����Ƶ����ͼ
%sound(y,Fs);
%% fir�˲������
% ������ָ�꣺
% ��ͨ�˲���
% ͨ������Ƶ�� 5kHz
% �������Ƶ�� 10kHz
% �����С˥�� 50dB
% ����Ƶ�� 44100Hz
fp = 5 * 1000;
fs = 10 * 1000;
wp = 2 * pi * fp/Fs;
ws = 2 * pi *fs/Fs;
fc = (fp + fs)/2; % FIR��ֹƵ��
w_bw = ws - wp; % ���ɴ���

%% ���ں�����
% 44dB
% A = 6.2 * pi
A_hanning = 6.2 *pi;
N0 = ceil(A_hanning / w_bw); % N = A/Bt
N = N0 + mod(N0+1,2); % ȷ��NΪ�������������
win = hann(N); % ������
F_Nyquist  = Fs/2; % �ο�˹��Ƶ��
Wc = fc/F_Nyquist; % �ο�˹��Ƶ�ʹ�һ��

lpf = fir1(N-1,Wc,win);
i = i+1;
figure(i);
stem(lpf); % ����
i = i+1;
figure(i);
freqz(lpf,1,512); %��Ƶ��Ӧ��ĺ�������

%% ���ڹ�����
% 53dB
% A = 6.6 * pi
A_hamming = 6.6 *pi;

N0 = ceil(A_hamming / w_bw); % N = A/Bt
N = N0 + mod(N0+1,2); % ȷ��NΪ�������������

win = hamming(N); % ������

F_Nyquist  = Fs/2; % �ο�˹��Ƶ��
Wc = fc/F_Nyquist; % �ο�˹��Ƶ�ʹ�һ��

lpf = fir1(N-1,Wc,win);
i = i+1;
figure(i);
stem(lpf); % ����
i = i+1;
figure(i);
freqz(lpf,1,512); %��Ƶ��Ӧ��ĺ�������

%% ���ڲ���������
% 74dB
% A = 11 * pi
A_hamming = 11 *pi;

N0 = ceil(A_hamming / w_bw); % N = A/Bt
N = N0 + mod(N0+1,2); % ȷ��NΪ�������������

win = blackman(N); % ����������

F_Nyquist  = Fs/2; % �ο�˹��Ƶ��
Wc = fc/F_Nyquist; % �ο�˹��Ƶ�ʹ�һ��

lpf = fir1(N-1,Wc,win);
i = i+1;
figure(i);
stem(lpf); % ����
i = i+1;
figure(i);
freqz(lpf,1,512); %��Ƶ��Ӧ��ĺ�������

%% ��ͨ�˲�
y_filter = filter(lpf,1,y);
i= i+1;
s = '��ͨ�˲��ź�Ƶ����ͼ';
plot_freq2(Fs,L,y_filter,s,i); % ����Ƶ����ͼ
sound(y_filter,Fs);















