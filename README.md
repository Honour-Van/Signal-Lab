# Recovery of multi-path transmission signals

## 理想低通滤波

课件Ch4-1 Filtering P47~48
$$
H(e^{j\omega})=\begin{cases}1, & |\omega| \leq \omega_c\\ 0, & \omega_c < |\omega| \leq \pi\end{cases}
$$
<img src="D:\workspace\tex\3" alt="image-20201227105722093" style="zoom:50%;" />

为了实现非因果系统，可以有如下近似理想的低通滤波器：
$$
h_N[n] = \frac{\omega_c}{\pi}\mathrm{Sa}[\omega_c(n-N)]\left(u[n]-u[n-2N-1]\right)
$$
<img src="D:\workspace\tex\4" alt="image-20201227110224582" style="zoom:50%;" />

> $$
> h[n]=\frac{1}{2\pi}\int_{-\omega_c}^{\omega_c}e^{j\omega n}\mathrm d\omega=\frac{\sin\omega_cn}{n\pi}=\frac{\omega_c}{\pi}\mathrm{Sa}(\omega_cn)
> $$

##  滤除白噪可能的方法

移动平均法（很朴素）适合于大趋势的分析

中值滤波：会使得图像变得模糊。由于信噪比并不低，行不通。

维纳滤波（LMS判据）

自适应滤波

# References

七种方法：http://blog.sina.com.cn/s/blog_45eac6860102uyni.html

多径信道理论的直观感受：https://zhuanlan.zhihu.com/p/116761401

卷积消除法：http://ddjy.hnust.edu.cn/ch/reader/create_pdf.aspx?file_no=201803013&year_id=2018&quarter_id=3&falg=1

OFDM：https://zhuanlan.zhihu.com/p/57967971

系统辨识：https://ww2.mathworks.cn/help/ident/gs/identify-linear-models-using-the-gui.html