%****************************************************************************************
%  
%                信号Mix_Signal_1 和 Mix_Signal_2  分别作移动平均滤波
%
%***************************************************************************************

%混合信号 Mix_Signal_1  移动平均滤波
figure(3);
b  =  [1 1 1 1 1 1]/6;
Signal_Filter = filter(b,1,Mix_Signal_1);

subplot(4,1,1);                                          %Mix_Signal_1 原始信号                 
plot(Mix_Signal_1);
axis([0,1000,-4,4]);
title('原始信号1 ');

subplot(4,1,2);                                          %Mix_Signal_1 移动平均滤波后信号  
plot(Signal_Filter);
axis([0,1000,-4,4]);
title('移动平均滤波后的信号1');

%混合信号 Mix_Signal_2  移动平均滤波
b  =  [1 1 1 1 1 1]/6;
Signal_Filter = filter(b,1,Mix_Signal_2);
subplot(4,1,3);                                          %Mix_Signal_2 原始信号                 
plot(Mix_Signal_2);
axis([0,1000,-10,30]);
title('原始信号2 ');

subplot(4,1,4);                                          %Mix_Signal_2 移动平均滤波后信号  
plot(Signal_Filter);
axis([0,1000,-10,30]);
title('移动平均滤波后的信号2');
