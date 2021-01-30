%% 数据准备

clear; close all; clc
load('data_advance_student_new.mat');
K = 0;
rt = r_training(1, :);
st = s_training(1, :);
% 
% rt = r_training(2, :);
% st = s_training(2, :);

% rt = r_test(1, :);
% rt = r_test(2, :);
%% 低通滤波

wc = 0.9999;
% rt1 = lowpass(rt, wc);
[b, a] = butter(4, wc);
rt1 = filter(b, a, rt);
%% 多径转单径

hc = [1,0.4,0.6,0.8];
rt1 = filter(1, hc, rt1);

N_window = 7;
rt1 = smoothdata(rt1,'sgolay' ,N_window);
%% 维纳滤波

N1 = length(rt1);
N2 = length(st);
if N1 > N2
    N = N1;
    st = [st zeros(1, N1-N2)];
elseif N1 < N2
    N = N2;
    rt1 = [rt1 zeros(1, N2-N1)];
end

Rxx=xcorr(rt1,rt1);                               %得到混合信号的自相关函数
M=100;                                                      %维纳滤波器阶数
rxx = zeros(M, M);
for i=1:M                                         %得到混合信号的自相关矩阵
    for j=1:M
        rxx(i,j)=Rxx(abs(j-i)+N);
    end
end
Rxy=xcorr(rt1,st);                         %得到混合信号和原信号的互相关函数
rxy = zeros(1, M);
for i=1:M
    rxy(i)=Rxy(i+N-1);
end                                       %得到混合信号和原信号的互相关向量
h = inv(rxx)*rxy';                          %得到所要涉及的wiener滤波器系数
Sr=filter(h,1, rt1);                              %将输入信号通过维纳滤波器

%% 评估

sr = [Sr(1, K+1: length(Sr)), zeros(1,K)];
delta = st - sr;
Perr = sum(delta.^2) / N;
U = K + 10 * log10(Perr);
fprintf('U = %f\n', U);
%% 绘图
tdplot
%% 求解系统的冲激响应
SR = fft(sr);
RT = fft(rt);
HR = SR ./ RT;
hr = ifft(HR);
