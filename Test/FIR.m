%****************************************************************************************
%  
%                信号Mix_Signal_1 和 Mix_Signal_2  分别作FIR低通滤波。
%
%***************************************************************************************

%混合信号 Mix_Signal_1  FIR低通滤波
figure(2);
F  =  0:0.05:0.95; 
A  =  [1    1      0    0    0    0      0    0    0    0    0    0    0    0    0    0    0  0  0   0] ;
b  =  firls(20,F,A);
Signal_Filter = filter(b,1,Mix_Signal_1);

subplot(4,1,1);                                          %Mix_Signal_1 原始信号                 
plot(Mix_Signal_1);
axis([0,1000,-4,4]);
title('原始信号1 ');

subplot(4,1,2);                                          %Mix_Signal_1 FIR低通滤波滤波后信号  
plot(Signal_Filter);
axis([0,1000,-5,5]);
title('FIR低通滤波后的信号1');

%混合信号 Mix_Signal_2  FIR低通滤波
F  =  0:0.05:0.95; 
A  =  [1    1      1    1    1    0      0    0    0    0    0    0    0    0    0    0    0  0  0   0] ;
b  =  firls(20,F,A);
Signal_Filter = filter(b,1,Mix_Signal_2);
subplot(4,1,3);                                          %Mix_Signal_2 原始信号                 
plot(Mix_Signal_2);
axis([0,1000,-10,30]);
title('原始信号2 ');

subplot(4,1,4);                                          %Mix_Signal_2 FIR低通滤波滤波后信号  
plot(Signal_Filter);
axis([0,1000,-10,30]);
title('FIR低通滤波后的信号2');
