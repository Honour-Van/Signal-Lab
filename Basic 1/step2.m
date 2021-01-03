%**************************************************************************
%
%                          对信号rt作自适应滤波
%
%**************************************************************************

N1 = length(rt1);
N2 = length(st);
if N1 > N2
    N = N1;
    st = [st zeros(1, N1-N2)];
elseif N1 < N2
    N = N2;
    rt1 = [rt1 zeros(1, N2-N1)];
end


%输入信号抽样点数N
k=100;                                           %时域抽头LMS算法滤波器阶数
u=0.0001;                                      %步长因子，同k都是待调整参数

%设置初值
yn=zeros(1,N);                                               %output signal
yn(1:k)=rt1(1:k);     %将输入信号SignalAddNoise的前k个值作为输出yn的前k个值
w=zeros(1,k);                                             %设置抽头加权初值
e=zeros(1,N);                                                     %误差信号

%用LMS算法迭代滤波
for i=(k+1):N
    XN=rt1((i-k+1):(i));
    yn(i)=w*XN';
    e(i)=st(i)-yn(i);
    w=w+2*u*e(i)*XN;
end

