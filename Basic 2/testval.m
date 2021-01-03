%**************************************************************************
%
%                        调整时延
%
%**************************************************************************
%% 数据导入和工作区建立
clear; close all; clc
load('data_basic_student_new.mat');
load('weiner_system.mat');
%% 变量准备

rt = r_training(2, :);
st = s_training(2, :);
N1 = length(rt);
N2 = length(st);
if N1 > N2
    N = N1;
    st = [st zeros(1, N1-N2)];
elseif N1 < N2
    N = N2;
    rt1 = [rt1 zeros(1, N2-N1)];
end
%% 近似的维纳系统滤波
Sr = filter(tfb, tfa, rt);

%% 更新调整K值
best = inf; bestk = 0;
for K = 1 : 100
    sr = [Sr(1, K+1: length(Sr)), zeros(1,K)];
    delta = st - sr;
    Perr = sum(delta.^2) / N;
    U = K + log10(Perr);
    if U < best
        best = U;
        bestk = K;
    end
end
%% 输出结果

fprintf("best K = %d,", bestk);
fprintf("U = %f\n", best)