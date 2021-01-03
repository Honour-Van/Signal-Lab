%% 输出脚本
%% 导入数据
load('data_advance_student_new.mat')
load('wiener_tf.mat')

%% test序列滤波
rt1 = r_test(1, :);
output1 = filter(tfb, tfa, rt1);
rt2 = r_test(2, :);
output2 = filter(tfb, tfa, rt2);
K = 0;

