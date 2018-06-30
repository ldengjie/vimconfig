
# Shortcuts  

**b** 向上翻页  
**f** 向下翻页  
**K** 上移一行 == k  
**s** 单字符跳转  
**v** 自动扩展选择连接着的区域  

-- [c]omment --  
**cc** 加注释  
**cu** 解开注释  
**c\<space\>** 加上/解开注释, 智能判断  
**cy** 先复制, 再注解(p可以进行黏贴)  

-- [c]lose --  
**cq** 关闭底部窗口，并从 nerdtree or tagbar 返回主窗口  
**cw** 关闭当前window  
**ct** 关闭当前tabpage  
**co** 关闭[airline上部buffer栏里]其他buffer  
**cr** 关闭[airline上部buffer栏里]右侧buffer  
**cb** 关闭[airline上部buffer栏里]当前buffer  
c[1-9] 关闭[airline上部buffer栏里]第1-9个buffer  

-- [d]elete --  
**dp** 删除指定字符之间的字符  
**dl** 删除指定行之间的行  

-- [t]abs in buffers window --  
**tn** [airline上部buffer栏里]下一个buffer  
**tp** [airline上部buffer栏里]下一个buffer  
t[1-9] [airline上部buffer栏里]跳转到第1-9个buffer  

-- [g]oto --  
**ga** 根据指定符号对其，V选中行 -> ga[1|2\*][,|-| ]  
**gd** 选中并返回原位置  
**gf** 跳转到变量的定义或声明处  
**gy** 进入/离开 goyo 模式  
**gt** 下一个tabpage  
**gT** 上一个tabpage  
**gj** 格式化json文件  

-- [w]indow --  
**w** \<c-w\>  
**wc** 关闭当前的窗口,不能关闭最后一个窗口,   
**wo** 关闭当前窗口以外的所有窗口, [c*]依赖这个快捷键  
**wz** 最大化当前窗口  

-- [y]ank --  
**yp** 复制指定字符之间的字符  
**yl** 复制指定行之间的行  

**,a** 搜索单词  
**,f** 搜索文件  
**,l** Move to line  
**,s** Move to char == s  
**,n** 打开nerdtree  
**,t** 打开tagbar  
**,w** 强制保存文件  
**,y** 打开粘贴板  

**\<c-y\>** 翻译当前单词  
**\<c-g\>** 语义补齐  
**\<c-j\>** 自动扩展输入  
**\<c-n\>** 下拉菜单里下一个  
**\<c-p\>** 下拉菜单里上一个  

# Installation   

## ubuntu16.04  
sudo sh setup.sh  

#Tips:  

configure for compile vim:  

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

Q: Tagbar: Exuberant ctags not found  
A: sudo apt-get install ctags  

ubuntu16.04 编译vim时:  
Q: You need to install a terminal library  
A: sudo apt-get install libncurses5-dev  

ubuntu16.04 git clone ycm时:  
Q: RPC failed; curl 18 transfer closed with outstanding read data remaining  
A: git config --global http.postBuffer 524288000  

