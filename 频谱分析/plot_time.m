function y = plot_time(t,x,s,i)
% ����ʱ����ͼ
% t��ʱ����
% x����ֵ
% s����������
% i����ʶ���
figure(i);
plot(t,x);
title(s);
xlabel('t (seconds)');
ylabel('x(k)');