%**************************************************************************
%
%                           对信号rt作低通滤波
%
%**************************************************************************
wc = 0.25;
rt1 = lowpass(rt, wc);