%**************************************************************************
%
%                           对信号rt作低通滤波
%
%**************************************************************************
wc = 0.25;
[b, a] = butter(4, wc);
rt1 = filter(b, a, rt);