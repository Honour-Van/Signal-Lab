# Recovery of multi-path transmission signals

## 文件结构
Sketch为一些杂项和底稿
Test是一些滤波方法的测试
Basic 0，1，2分别对应Basic的三种滤波方法，分别是Butterworth低通滤波，不完善的自适应滤波，和Wiener滤波。
Advance利用Wiener滤波实现。
构成的滤波系统均通过System Identification Toolbox进行拟合，6阶nominator，11阶denominator为最佳。


## References

七种方法：http://blog.sina.com.cn/s/blog_45eac6860102uyni.html

多径信道理论的直观感受：https://zhuanlan.zhihu.com/p/116761401

卷积消除法：http://ddjy.hnust.edu.cn/ch/reader/create_pdf.aspx?file_no=201803013&year_id=2018&quarter_id=3&falg=1

OFDM：https://zhuanlan.zhihu.com/p/57967971

系统辨识：https://ww2.mathworks.cn/help/ident/gs/identify-linear-models-using-the-gui.html