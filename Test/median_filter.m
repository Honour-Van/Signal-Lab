%****************************************************************************************
%  
%                信号Mix_Signal_1 和 Mix_Signal_2  分别作中值滤波
%
%***************************************************************************************

%混合信号 Mix_Signal_1  中值滤波
figure(4);
Signal_Filter=medfilt1(Mix_Signal_1,10);

subplot(4,1,1);                                          %Mix_Signal_1 原始信号                 
plot(Mix_Signal_1);
axis([0,1000,-5,5]);
title('原始信号 ');

subplot(4,1,2);                                          %Mix_Signal_1 中值滤波后信号  
plot(Signal_Filter);
axis([0,1000,-5,5]);
title('中值滤波后的信号');

%混合信号 Mix_Signal_2  中值滤波
Signal_Filter=medfilt1(Mix_Signal_2,10);
subplot(4,1,3);                                          %Mix_Signal_2 原始信号                 
plot(Mix_Signal_2);
axis([0,1000,-10,30]);
title('原始信号 ');

subplot(4,1,4);                                          %Mix_Signal_2 中值滤波后信号  
plot(Signal_Filter);
axis([0,1000,-10,30]);
title('中值滤波后的信号');
