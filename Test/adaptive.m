%****************************************************************************************
%  
%                信号Mix_Signal_1 和 Mix_Signal_2  分别作自适应滤波
%
%***************************************************************************************

%混合信号 Mix_Signal_1 自适应滤波
figure(6);
N=1000;                                            %输入信号抽样点数N
k=100;                                                  %时域抽头LMS算法滤波器阶数
u=0.001;                                            %步长因子

%设置初值
yn_1=zeros(1,N);                                  %output signal
yn_1(1:k)=Mix_Signal_1(1:k);                %将输入信号SignalAddNoise的前k个值作为输出yn_1的前k个值
w=zeros(1,k);                                        %设置抽头加权初值
e=zeros(1,N);                                        %误差信号

%用LMS算法迭代滤波
for i=(k+1):N
        XN=Mix_Signal_1((i-k+1):(i));
        yn_1(i)=w*XN';
        e(i)=Signal_Original_1(i)-yn_1(i);
        w=w+2*u*e(i)*XN;
end

subplot(4,1,1);
plot(Mix_Signal_1);                              %Mix_Signal_1 原始信号
axis([k+1,1000,-4,4]);
title('原始信号1');

subplot(4,1,2);
plot(yn_1);                                            %Mix_Signal_1 自适应滤波后信号
axis([k+1,1000,-4,4]);
title('自适应滤波后信号1');

%混合信号 Mix_Signal_2 自适应滤波
N=1000;                                            %输入信号抽样点数N
k=500;                                                %时域抽头LMS算法滤波器阶数
u=0.000011;                                        %步长因子

%设置初值
yn_1=zeros(1,N);                                  %output signal
yn_1(1:k)=Mix_Signal_2(1:k);                  %将输入信号SignalAddNoise的前k个值作为输出yn_1的前k个值
w=zeros(1,k);                                        %设置抽头加权初值
e=zeros(1,N);                                        %误差信号

%用LMS算法迭代滤波
for i=(k+1):N
        XN=Mix_Signal_2((i-k+1):(i));
        yn_1(i)=w*XN';
        e(i)=Signal_Original_2(i)-yn_1(i);
        w=w+2*u*e(i)*XN;
end

subplot(4,1,3);
plot(Mix_Signal_2);                              %Mix_Signal_1 原始信号
axis([k+1,1000,-10,30]);
title('原始信号2');

subplot(4,1,4);
plot(yn_1);                                            %Mix_Signal_1 自适应滤波后信号
axis([k+1,1000,-10,30]);
title('自适应滤波后信号2');