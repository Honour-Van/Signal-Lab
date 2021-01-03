%****************************************************************************************
%  
%                信号Mix_Signal_1 和 Mix_Signal_2  分别作维纳滤波
%
%***************************************************************************************

%混合信号 Mix_Signal_1  维纳滤波
figure(5);
Rxx=xcorr(Mix_Signal_1,Mix_Signal_1);              %得到混合信号的自相关函数
M=100;                                                            %维纳滤波器阶数
for i=1:M                                                          %得到混合信号的自相关矩阵
    for j=1:M
        rxx(i,j)=Rxx(abs(j-i)+N);
    end
end
Rxy=xcorr(Mix_Signal_1,Signal_Original_1);      %得到混合信号和原信号的互相关函数
for i=1:M
    rxy(i)=Rxy(i+N-1);
end                                                                  %得到混合信号和原信号的互相关向量
h = inv(rxx)*rxy';                                              %得到所要涉及的wiener滤波器系数
Signal_Filter=filter(h,1, Mix_Signal_1);              %将输入信号通过维纳滤波器

subplot(4,1,1);                                                  %Mix_Signal_1 原始信号                 
plot(Mix_Signal_1);
axis([0,1000,-5,5]);
title('原始信号 ');

subplot(4,1,2);                                                  %Mix_Signal_1 维纳滤波后信号  
plot(Signal_Filter);
axis([0,1000,-5,5]);
title('维纳滤波后的信号');

%混合信号 Mix_Signal_2  维纳滤波
Rxx=xcorr(Mix_Signal_2,Mix_Signal_2);              %得到混合信号的自相关函数
M=500;                                                            %维纳滤波器阶数
for i=1:M                                                          %得到混合信号的自相关矩阵
    for j=1:M
        rxx(i,j)=Rxx(abs(j-i)+N);
    end
end
Rxy=xcorr(Mix_Signal_2,Signal_Original_2);      %得到混合信号和原信号的互相关函数
for i=1:M
    rxy(i)=Rxy(i+N-1);
end                                                                  %得到混合信号和原信号的互相关向量
h=inv(rxx)*rxy';                                              %得到所要涉及的wiener滤波器系数
Signal_Filter=filter(h,1, Mix_Signal_2);            %将输入信号通过维纳滤波器

subplot(4,1,3);                                                  %Mix_Signal_2 原始信号                 
plot(Mix_Signal_2);
axis([0,1000,-10,30]);
title('原始信号 ');

subplot(4,1,4);                                                  %Mix_Signal_2 维纳滤波后信号  
plot(Signal_Filter);
axis([0,1000,-10,30]);
title('维纳滤波后的信号');