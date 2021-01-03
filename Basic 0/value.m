%**************************************************************************
%
%                          评估滤波之后信号的质量
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

sr = [Sr(1, K+1: length(Sr)), zeros(1,K)];
delta = st - sr;
Perr = sum(delta.^2) / N;
U = K + log10(Perr);
fprintf('U = %f\n', U);