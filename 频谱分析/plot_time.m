function y = plot_time(t,x,s,i)
% 绘制时域波形图
% t：时间轴
% x：幅值
% s：标题名称
% i：标识序号
figure(i);
plot(t,x);
title(s);
xlabel('t (seconds)');
ylabel('x(k)');