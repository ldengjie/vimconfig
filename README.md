
# Shortcuts  

b 向上翻页  
f 向下翻页  
K 上移一行 == k  
v 自动扩展选择连接着的区域  
s 单字符跳转  
/ 多字符跳转  
  
-- [c]omment --  
cc 加注释  
cu 解开注释  
c\<space\> 加上/解开注释, 智能判断  
cy 先复制, 再注解(p可以进行黏贴)  
  
-- [d]elete --  
dp 删除指定字符之间的字符  
dl 删除指定行之间的行  
  
-- [t]abs in buffers window --  
[count]tt 跳转到指定buffer  
tt 跳转到前一个buffer  
tn 下一个buffer  
tp 上一个buffer  
[count]tc 关闭指定buffer  
tc 关闭当前buffer  
to 关闭其他buffer  
tr 关闭右侧buffer  
tl 关闭左侧buffer
  
-- [g]oto --  
ga 根据指定符号对其，V选中行 -> ga[1|2\*][,|-| ]  
gd 选中并返回原位置  
gf 跳转到变量的定义或声明处  
gj 格式化json文件  
  
-- [w]indow --  
w \<c-w\>  
wc 关闭当前的窗口,不能关闭最后一个窗口,   
wo 关闭当前窗口以外的所有窗口  
wz 最大化当前窗口  
  
-- [y]ank --  
yp 复制指定字符之间的字符  
yl 复制指定行之间的行  
  
,a 搜索单词  
,q 关闭底部窗口，并从 nerdtree or tagbar 返回主窗口  
,f 搜索文件  
,l Move to line  
,s Move to char == s  
,m 打开minibufexplorer  
,n 打开nerdtree  
,t 打开tagbar  
,w 强制保存文件  
,y 打开粘贴板  
,c YCM-Generator为c-family项目生成配置文件  
,h 在header添加作者信息  
  
\<c-y\> 翻译当前单词  
\<c-g\> 语义补齐  
\<c-j\> 自动扩展输入  
\<c-n\> 下拉菜单里下一个  
\<c-p\> 下拉菜单里上一个  
\<c-l\> 显示当前行数/总行数  

# Installation   

## mac
sudo sh setup_mac.sh

## ubuntu16.04  
sudo sh setup_ubuntu.sh  

### Tips:  

configure for compile vim:  

**需要保证编译vim看到的或指定的python Library和编译ycm时看到的python/python-config是同一套，且python是一个可执行文件.详见 http://bc28335b.wiz03.com/share/s/2Ya3dr0qkABL2n0eR71ISkyG0fl6W-389A5l2n46HL3jUW39**

> --with-features=huge：支持最大特性  
> --enable-rubyinterp：打开对ruby编写的插件的支持  
> --enable-pythoninterp：打开对python编写的插件的支持  
> --enable-python3interp：打开对python3编写的插件的支持  
> --enable-luainterp：打开对lua编写的插件的支持  
> --enable-perlinterp：打开对perl编写的插件的支持  
> --enable-multibyte：打开多字节支持，可以在Vim中输入中文  
> --enable-cscope：打开对cscope的支持  
> --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ 指定python 路径  
> --with-python-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/ 指定python3路径  
> --prefix=/usr/local/vim：指定将要安装到的路径(自行创建)  
