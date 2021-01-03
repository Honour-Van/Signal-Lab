%**************************************************************************
%
%                       工具脚本：寻找合适的参数
%
%**************************************************************************
%             运行当前节、粗筛和遍历增益三节可以得到比较好的结果
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
figure(1);
run tdplot.m;
%% 细筛hc：间隔不能选到0.1否则四重循环
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
figure(2);
run tdplot.m;

%% 遍历增益
hc = besthc;
K = bestk;
% run step1.m;
% run step2.m;
% run step3.m;
best = inf;
bestA = 1;
for A = 1:0.01:3
    Sr = Sr .* A;
    run value.m;
    if U < best
        best = U;
        bestA = A;
        fprintf("U(%f) = %f\n", A, U);
    end
    Sr = Sr ./ A;
end
sr .* bestA;
figure(3);
run tdplot.m
%% 输出最优
% run mode_choice.m
% K = 0;
% hc = [1, -0.1, 0, 0.9];
% run step1.m;
% run step2.m;
% run step3.m;
% Sr = 1.11 * Sr;
% run value.m;
% run tdplot.m;
