%**************************************************************************
%
%                           寻找合适的参数
%
%**************************************************************************
run mode_choice.m
best=inf; bestk = 0; besthc = zeros(1, 4);
%% 粗筛得到hc = [1, -0.1, 0, 0.9]
a0 = 1;
for a1 = -1:0.1:1
    for a2 = -1:0.1:1
        for a3 = -1:0.1:1
            hc = [a0 a1 a2 a3];
            for K = 0 : 5
                run step1.m;
                run step2.m;
                run step3.m;
                run value.m;
                if U < best
                    best = U;
                    bestk = K;
                    besthc = hc;
                    fprintf('U[%d] = %f,   ',K, U);
                    fprintf('hc: %f,%f,%f,%f\n', hc(1), hc(2), hc(3), hc(4));
                end
            end
        end
    end
end
%% 细筛hc：间隔不能选到0.1否则四重循环
a0 = 1;
for a1 = -0.2:0.01:0
    for a2 = -0.1:0.01:0.1
        for a3 = -0.9:0.01:-0.8
            hc = [a0 a1 a2 a3];
            for K = 0 : 3
                run step1.m;
                run step2.m;
                run step3.m;
                run value.m;
                if U < best
                    best = U;
                    bestk = K;
                    besthc = hc;
                    fprintf('U[%d] = %f,   ',K, U);
                    fprintf('hc: %f,%f,%f,%f\n', hc(1), hc(2),hc(3), hc(4));
                end
            end
        end
    end
end
fprintf('Final: U[%d] = %f\n',bestk, best);
run tdplot.m;


%% 遍历增益
hc = besthc;
K = bestk;
% hc = [1, -0.1, 0, 0.9];
% K = 0;
run step1.m;
run step2.m;
run step3.m;
bestA = 1;
for A = 1:0.01:2
    Sr = Sr .* A;
    run value.m;
    if U < best
        best = U;
        bestA = A;
        fprintf("U(%f) = %f\n", A, U);
    end
    Sr = Sr ./ A;
end

%% 输出最优
run mode_choice.m
K = 0;
hc = [1, -0.1, 0, 0.9];
run step1.m;
run step2.m;
run step3.m;
Sr = 1.11 * Sr;
run value.m;
run tdplot.m;
