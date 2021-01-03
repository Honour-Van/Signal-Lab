# 朴素巴特沃斯低通

$$
U = -1.727019\\
U = -1.711272
$$



# 自适应滤波器效果检验

原图

![image-20210102163159627](D:\signal lab\result.assets\image-20210102163159627.png)

第一阶段使用低通滤波（后来改成Butterworth，见第二张图）

![image-20210102163654752](D:\signal lab\result.assets\image-20210102163654752.png)

![image-20210103081336007](D:\signal lab\result.assets\image-20210103081336007.png)

第二阶段使用自适应滤波

![image-20210102164130625](D:\signal lab\result.assets\image-20210102164130625.png)
$$
U = -1.089360\\

U = -1.087249
$$
![image-20210103083741518](D:\signal lab\result.assets\image-20210103083741518.png)

时延非常严重，考虑放弃这个方法。

# 维纳滤波方法

由于test没有给出，所以虽然要使用现代滤波方法，但是看似自适应滤波不能使用了。

我们接下来分别利用维纳滤波和小波分析方法进行调整。

