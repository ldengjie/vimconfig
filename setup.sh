#!/bin/bash

#have been tested on ubuntu16.04

mv ../vimconfig ~/.vim
cd ~/.vim

# zsh:
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -s ~/.vim/zshrc ~/.zshrc

# tmux:
sudo apt-get -y install tmux
ln -s ~/.vim/tmux.conf ~/.tmux.conf

# eclim:
#自带 c/c++/python/java

# Ag:
sudo apt-get -y install silversearcher-ag

# ctags:
sudo apt-get -y install ctags

# vim:
#<https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source>

sudo apt remove vim vim-runtime gvim

sudo apt -y install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git

git clone https://github.com/vim/vim --depth 1

cd ~/.vim/vim

# 修改 src/screen.c, 替换 ~ ^ 为空格

sudo apt-get -y install libncurses5-dev

# 需要确保编译vim看到的或指定的python Library和编译ycm时看到的python/python-config是同一套，且python是一个可执行文件。这里使用系统自带python2.7:
#$ which python
#/usr/bin/python
#$ which python-config
#/usr/bin/python
#编译ycm时,确保正确的library, ~/.vim/plugged/YouCompleteMe/
#$ ./install.py --clang-completer --java-completer
#Searching Python 2.7 libraries...
#Found Python library: /usr/lib/python2.7/config-x86_64-linux-gnu/libpython2.7.so

./configure --with-features=huge --enable-pythoninterp --enable-rubyinterp --enable-luainterp --enable-perlinterp --enable-multibyte --enable-cscope

make && sudo make install

ln -s ~/.vim/vimrc ~/.vimrc

cd ~/.vim/plugged/

vim -c 'PlugInstall' -c 'qall'

# 上述命令下载安装ycm时, 若出错,设置参数自行下载:
#git config --global http.postBuffer 1024288000
#git clone --depth 1 --recursive https://github.com/Valloric/YouCompleteMe.git
#cd YouCompleteMe
#sudo apt-get -y install build-essential cmake
#./install.py --clang-completer --java-completer


# 编译完成后，也需要确保vim里看到的是系统自带python2.7,否则系统路径里若python=python3,导致python2插件不起作用.需要在.vimrc里添加:
#autocmd VimEnter * let $PATH='/usr/bin:'.$PATH
#启动vim后显示：
#:python import sys; print sys.executable
#/usr/bin/python

#rm -rf ~/.vim/vim

