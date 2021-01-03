%****************************************************************************************
%
%                      创建两个信号Mix_Signal_1 和信号 Mix_Signal_2
%
%***************************************************************************************

Fs = 1000; %采样率
N = 1000; %采样点数
n = 0:N - 1;
t = 0:1 / Fs:1 - 1 / Fs; %时间序列
Signal_Original_1 = sin(2 * pi * 10 * t) + sin(2 * pi * 20 * t) + sin(2 * pi * 30 * t);
Noise_White_1 = [0.3 * randn(1, 500), rand(1, 500)]; %前500点高斯分部白噪声，后500点均匀分布白噪声
Mix_Signal_1 = Signal_Original_1 + Noise_White_1; %构造的混合信号

Signal_Original_2 = [zeros(1, 100), 20 * ones(1, 20), -2 * ones(1, 30), 5 * ones(1, 80), -5 * ones(1, 30), 9 * ones(1, 140), -4 * ones(1, 40), 3 * ones(1, 220), 12 * ones(1, 100), 5 * ones(1, 20), 25 * ones(1, 30), 7 * ones(1, 190)];
Noise_White_2 = 0.5 * randn(1, 1000); %高斯白噪声
Mix_Signal_2 = Signal_Original_2 + Noise_White_2; %构造的混合信号

figure(8)

subplot(4, 1, 1);
plot(Signal_Original_1);
axis([0, 1000, -4, 4]);
title('原始信号1 ');

subplot(4, 1, 2);
plot(Mix_Signal_1);
axis([0, 1000, -4, 4]);
title('加噪信号1 ');

subplot(4, 1, 3);
plot(Signal_Original_2);
axis([0, 1000, -10, 30]);
title('原始信号2 ');

subplot(4, 1, 4);
plot(Mix_Signal_2);
axis([0, 1000, -10, 30]);
title('加噪信号2');
