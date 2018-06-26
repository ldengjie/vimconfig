
# ubuntu16.04
sudo sh setup.sh

---

configure for vim:

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

---

#  create a link for .vimrc
`source setup.sh` 

# install plugin powerline

vim-powerline乱码解决方法
###Linux下

`cd ~/.fonts`
解压consolas-powerline-vim字体到linux账户主目录下~/.fonts里
    mkfontscale
    mkfontdir
    fc-cache -vf
    rm ~/.vim/bundle/vim-powerline/*.cache

 `.vimrc` :

 " powerline
    set encoding=utf-8
    set laststatus=2
    set t_Co=256   
    let g:Powerline_symbols= "fancy"
    setfillchars+=stl:\ ,stlnc:\

.cshrc/.bashrc：

    setenv LANG en_US.utf8   # tcsh/csh  ，setenv LANG UTF-8 也可以
    export LANG=en_US.utf8   # bash


确保终端中的字体和解码设置正确：

Konsole：
Font --> Consolas for Powerline 
Set Character Encoding -- > Unicode(UTF-8)

GNOME Terminal:
我在CentOS 6.3 GNOME Terminal中的字体没改，是Ubuntu Mono,把Character Encoding设置成Unicode(UTF-8),vim-powerline显示也正常

Window7 下 Putty:

Window --> Appearance --> Font settings --> Consolas
Window --> Translation --> Character set translation --> Remote character set --> utf8
设置后发现还是不能正常显示

把consolas-powerline-vim里面的字体拷贝到C:\Windows\Fonts，然后在Putty里面把字体改成Consolas for Powerline 保存，再开VIM,问题解决了

 [来源](http://zuantianyang.blog.sohu.com/255966218.html)
