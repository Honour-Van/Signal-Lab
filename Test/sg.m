%sgolay滤波
clear
clc
close all

N_window = 5;%窗口长度(最好为奇数）

t = 0:0.1:10;
A = cos(2*pi*0.5*t)+0.4*rand(size(t));

%matlab自带的5点2次插值
B1 = smoothdata(A,'sgolay' ,N_window);
figure(1)
plot(t,A,t,B1)

%5点3次插值
B2 = smooth_SG_hyh(A,5,3,1);
figure(2)
plot(t,B1,t,B2)


function y_new = smooth_SG_hyh(y,M,P,n)
%M点P次插值
%M为窗口长度
%P为拟合阶数
%n为光滑n次

m = length(y);
N_window = M;%窗口长度
b = sgolay( P , N_window );
F_SG = b((N_window+1)/2,:);%5点3次插值
y_new = y;
for k=1:n
    y_new2 = wextend(1,'sym',y_new,(N_window-1)/2);%镜像延拓
    y_new2 = conv(y_new2,F_SG,'same');%利用卷积的方法计算
    y_new = wkeep1(y_new2,m);%中间截断
end

end
