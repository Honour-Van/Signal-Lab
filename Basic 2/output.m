%**************************************************************************
%
%                          最终输出
%
%**************************************************************************
clear; close all; clc
load('data_basic_student_new.mat');
load('weiner_system.mat');
rt1 = r_test(1, :);
output1 = filter(tfb, tfa, rt1);
rt2 = r_test(2, :);
output2 = filter(tfb, tfa, rt2);
K = 1;