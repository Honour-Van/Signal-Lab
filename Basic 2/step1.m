%**************************************************************************
%
%                           对信号rt作低通滤波
%
%**************************************************************************
wc = 0.5;
% rt1 = lowpass(rt, wc);
[b, a] = butter(4, wc);
rt1 = filter(b, a, rt);