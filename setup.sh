#!/bin/bash

#tested on ubuntu16.04

mv ../vimconfig ~/.vim
cd ~/.vim

# zsh:
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -s ~/.vim/zshrc ~/.zshrc

# tmux:
sudo apt-get install tmux
ln -s ~/.vim/tmux.conf ~/.tmux.conf

# eclim:
#自带 c/c++/python/java

# Ag:
sudo apt-get install silversearcher-ag

# ctags:
sudo apt-get install ctags

# vim:
#<https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source>

sudo apt remove vim vim-runtime gvim

sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git

git clone https://github.com/vim/vim --depth 1

cd ~/.vim/vim

# 修改 src/screen.c, 替换 ~ ^ 为空格

sudo apt-get install libncurses5-dev

# 需要配置python3路径
./configure --with-features=huge --enable-python3interp --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ --enable-rubyinterp --enable-luainterp --enable-perlinterp --with-python3-config-dir=/home/sugon/anaconda3/lib/python3.6/config-3.6m-x86_64-linux-gnu --enable-multibyte --enable-cscope

# [mac] TODO
./configure --with-features=huge --enable-python3interp --enable-pythoninterp --enable-rubyinterp --enable-luainterp --enable-perlinterp --enable-multibyte --enable-cscope

make && sudo make install

ln -s ~/.vim/vimrc ~/.vimrc

cd ~/.vim/plugged/

git config --global http.postBuffer 1024288000
git clone --depth 1 --recursive https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
sudo apt-get install build-essential cmake
./install.py --all

vim -c 'PlugInstall' -c 'qall'

#rm -rf ~/.vim/vim

