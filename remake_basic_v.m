%% 验证

rtest = r_training(2, :);
stest = s_training(2, :);
sr1 = conv(hr, rtest);
sr1 = sr1(1:8195);
delta = st - sr;
Perr = sum(delta.^2) / N;
U = K + 10 * log10(Perr);
fprintf('U = %f\n', U);
%% 输出
tmp = r_test(1, :);
output1 = conv(hr, tmp);
output1 = output1(1: 8195);
output2 = conv(hr, r_test(2, :));
output2 = output2(1: 8195);