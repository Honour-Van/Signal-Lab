%****************************************************************************************
%  
%                信号Mix_Signal_1 和 Mix_Signal_2  分别作巴特沃斯低通滤波。
%
%***************************************************************************************

%混合信号 Mix_Signal_1  巴特沃斯低通滤波
figure(1);
Wc=2*50/Fs;                                          %截止频率 50Hz
[b,a]=butter(4,Wc);
Signal_Filter=filter(b,a,Mix_Signal_1);

subplot(4,1,1);                                        %Mix_Signal_1 原始信号                 
plot(Mix_Signal_1);
axis([0,1000,-4,4]);
title('原始信号1 ');

subplot(4,1,2);                                        %Mix_Signal_1 低通滤波滤波后信号  
plot(Signal_Filter);
axis([0,1000,-4,4]);
title('巴特沃斯低通滤波后信号1');

%混合信号 Mix_Signal_2  巴特沃斯低通滤波
Wc=2*100/Fs;                                          %截止频率 100Hz
[b,a]=butter(4,Wc);
Signal_Filter=filter(b,a,Mix_Signal_2);

subplot(4,1,3);                                        %Mix_Signal_2 原始信号                 
plot(Mix_Signal_2);
axis([0,1000,-10,30]);
title('原始信号2 ');

subplot(4,1,4);                                      %Mix_Signal_2 低通滤波滤波后信号  
plot(Signal_Filter);
axis([0,1000,-10,30]);
title('巴特沃斯低通滤波后信号2');
