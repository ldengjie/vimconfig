0】source setup.sh : create a link for .vimrc

1】install plugin powerline

vim-powerline乱码解决方法
Linux下

cd ~/.fonts
解压consolas-powerline-vim字体到linux账户主目录下~/.fonts里
mkfontscale
mkfontdir
fc-cache -vf
rm ~/.vim/bundle/vim-powerline/*.cache

 .vimrc:

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

 来源： <http://zuantianyang.blog.sohu.com/255966218.html>
