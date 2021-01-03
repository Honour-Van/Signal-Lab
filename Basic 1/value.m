sr = [Sr(1, K+1: length(Sr)), zeros(1,K)];
delta = st - sr;
Perr = sum(delta.^2) / N;
U = K + log10(Perr);
fprintf('U = %f\n', U);