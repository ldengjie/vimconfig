#!/bin/bash


##on macos
#
#mv ../vimconfig ~/.vim
#cd ~/.vim
#
## zsh:
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#ln -s ~/.vim/zshrc ~/.zshrc
#
## tmux:
#brew install tmux
#ln -s ~/.vim/tmux.conf ~/.tmux.conf
#
## Ag:
#brew intall ag
#
## ctags:
#brew install ctags
#
##vim
#git clone https://github.com/vim/vim --depth 1
#
#cd ~/.vim/vim
#
## 修改 src/screen.c, 替换 ~ ^ 为空格
#
## 需要确保编译vim看到的或指定的python Library和编译ycm时看到的python/python-config是同一套，且python是一个可执行文件。这里使用系统自带python2.7:
##$ which python
##/usr/bin/python
##$ which python-config
##/usr/bin/python
#
#./configure --with-features=huge --enable-pythoninterp --enable-rubyinterp --enable-luainterp --enable-perlinterp --enable-multibyte --enable-cscope
#
#make && sudo make install
#
#ln -s ~/.vim/vimrc ~/.vimrc
#
#cd ~/.vim/plugged/
#
#vim -c 'PlugInstall' -c 'qall'
#
##ycm, 确保正确的python library
##Searching Python 2.7 libraries...
##Found Python library: /usr/lib/python2.7/config-x86_64-linux-gnu/libpython2.7.so
#cd ~/.vim/plugged/YouCompleteMe/
#./install.py --clang-completer --java-completer
#
## 编译完成后，也需要确保vim里看到的是系统自带python2.7,否则系统路径里若python=python3,导致python2插件不起作用.需要在.vimrc里添加:
##autocmd VimEnter * let $PATH='/usr/bin:'.$PATH

#on ubuntu16.04

#更新源
sudo cp -rf sys/sources.list /etc/apt/sources.list
sudo cp -rf sys/pip.conf /etc/pip.conf
apt-get update
#安装3.6
apt-get install -y software-properties-common
add-apt-repository ppa:deadsnakes/ppa
apt-get update
apt-get install -y python3.6 python3.6-dev
python3.6 sys/get-pip.py
ln -s /usr/bin/python3.6 /usr/local/bin/python3
ln -s /usr/bin/python3.6-config /usr/local/bin/python3-config
which python3
which python3-config
#安装python-config
apt install python-dev
which python
which python-config

apt-get install -y git curl

get clone --depth=1 https://github.com/ldengjie/vimconfig.git

cd vimconfig
#mkdir ~/.vim

# zsh:
apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp -rf sys/zshrc ~/.zshrc

# tmux:
sudo apt-get -y install tmux
cp -rf sys/tmux.conf ~/.tmux.conf

# eclim:
#自带 c/c++/python/java

# Ag:
sudo apt-get -y install silversearcher-ag

# ctags:
sudo apt-get -y install ctags

# vim:
#<https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source>

sudo apt remove -y vim vim-runtime gvim

sudo apt -y install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev

git clone https://github.com/vim/vim --depth 1

cd vim

# 修改 src/screen.c, 替换 ~ ^ 为空格
sed -i -e "s/return '^';/return ' ';/g" -e "s/win_draw_end(wp, '~', ' ', row, wp->w_height, HLF_EOB);/win_draw_end(wp, ' ', ' ', row, wp->w_height, HLF_EOB);/g" src/screen.c 

# 需要确保编译vim看到的或指定的python Library和编译ycm时看到的python/python-config是同一套，且python是一个可执行文件。这里使用系统自带python2.7:
which python
#/usr/bin/python
which python-config
#/usr/bin/python
#编译ycm时,确保正确的library, ~/.vim/plugged/YouCompleteMe/
#$ ./install.py --clang-completer --java-completer
#Searching Python 2.7 libraries...
#Found Python library: /usr/lib/python2.7/config-x86_64-linux-gnu/libpython2.7.so

# ubuntu下安装vim出现no terminal library found的问题
sudo apt-get -y install libncurses5-dev

# ycm 需要 cmake
sudo apt-get -y install build-essential cmake
# 安装 clang 以支持 c-family 语义补全
sudo apt-get -y install clang

./configure --with-features=huge --enable-pythoninterp --enable-rubyinterp --enable-luainterp --enable-perlinterp --enable-multibyte --enable-cscope

sudo make -j $(nproc) && sudo make install

cd ..

cp -rf vimrc ~/.vimrc

#ubuntu16.04 git clone ycm时: RPC failed; curl 18 transfer closed with outstanding read data remaining
git config --global http.postBuffer 524288000

vim -c 'PlugInstall' -c 'qall'

# 上述命令下载安装ycm时, 若出错,设置参数自行下载:
#git clone --depth 1 --recursive https://github.com/Valloric/YouCompleteMe.git
#git submodule update --init --recursive
#cd YouCompleteMe
#sudo apt-get -y install build-essential cmake
#./install.py --clang-completer --java-completer


# (已添加)编译完成后，也需要确保vim里看到的是系统自带python2.7,否则系统路径里若python=python3,导致python2插件不起作用.需要在.vimrc里添加:
#autocmd VimEnter * let $PATH='/usr/bin:'.$PATH
#启动vim后显示：
#:python import sys; print sys.executable
#/usr/bin/python


#rm -rf ~/.vim/vim

ln -s /usr/bin/python3.6 /usr/local/bin/python
ln -s /usr/bin/python3.6-config /usr/local/bin/python-config
