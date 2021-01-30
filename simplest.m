clear; close all; clc;
load('data_basic_student_new.mat')
load('basicsimplest.mat')
rt = r_training(1, :);
st = [s_training(1, :), zeros(1, 3)];
sr = filter(tfb, tfa, rt);
delta = st - sr;
N = 8195; K = 0;
Perr = sum(delta.^2) / N;
U = K + 10*log10(Perr);
fprintf('U = %f\n', U);
rt1 = rt;
tdplot
