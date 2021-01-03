%**************************************************************************
%
%                          对信号rt作维纳滤波
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

Rxx=xcorr(rt,rt);                                 %得到混合信号的自相关函数
M=100;                                                      %维纳滤波器阶数
rxx = zeros(M, M);
for i=1:M                                         %得到混合信号的自相关矩阵
    for j=1:M
        rxx(i,j)=Rxx(abs(j-i)+N);
    end
end
Rxy=xcorr(rt,st);                         %得到混合信号和原信号的互相关函数
rxy = zeros(1, M);
for i=1:M
    rxy(i)=Rxy(i+N-1);
end                                       %得到混合信号和原信号的互相关向量
h = inv(rxx)*rxy';                          %得到所要涉及的wiener滤波器系数
rt1=filter(h,1, rt);                              %将输入信号通过维纳滤波器
