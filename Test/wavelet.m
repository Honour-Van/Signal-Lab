%****************************************************************************************
%  
%                信号Mix_Signal_1 和 Mix_Signal_2  分别作小波滤波
%
%***************************************************************************************

%混合信号 Mix_Signal_1  小波滤波
figure(7);
subplot(4,1,1);
plot(Mix_Signal_1);                                %Mix_Signal_1 原始信号
axis([0,1000,-5,5]);
title('原始信号 ');

subplot(4,1,2);
[xd,cxd,lxd] = wden(Mix_Signal_1,'sqtwolog','s','one',2,'db3');
plot(xd);                                                %Mix_Signal_1 小波滤波后信号
axis([0,1000,-5,5]);
title('小波滤波后信号 ');

%混合信号 Mix_Signal_2  小波滤波
subplot(4,1,3);
plot(Mix_Signal_2);                                %Mix_Signal_2 原始信号
axis([0,1000,-10,30]);
title('原始信号 ');

subplot(4,1,4);
[xd,cxd,lxd] = wden(Mix_Signal_2,'sqtwolog','h','sln',3,'db3');
plot(xd);                                                %Mix_Signal_2 小波滤波后信号
axis([0,1000,-10,30]);
title('小波滤波后信号 ');
