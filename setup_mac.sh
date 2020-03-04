#!/bin/bash


#on macos

mv ../vimconfig ~/.vim
cd ~/.vim

# zsh:
sh sys/install_zsh.sh
mv ~/.zshrc ~/.zshrc.bak
ln -s ~/.vim/sys/zshrc ~/.zshrc

# tmux:
brew install tmux
ln -s ~/.vim/sys/tmux.conf ~/.tmux.conf

#YouCompleteMe 只支持python3
brew install python3
cp sys/pip.conf /etc/pip.conf

# Ag:
brew intall ag

# ctags:
brew install ctags

# cmake
brew install cmake

#vim
git clone https://github.com/vim/vim --depth 1

cd vim
# 修改 src/screen.c, 替换 ^ 为空格
sed -i -e "s/return '^';/return ' ';/g" src/screen.c 
# 修改 src/drawscreen.c, 替换 ~ 为空格
sed -i -e "s/win_draw_end(wp, '~',/win_draw_end(wp, ' ',/g" src/drawscreen.c 

./configure --with-features=huge --enable-python3interp --enable-rubyinterp --enable-luainterp --enable-perlinterp --enable-multibyte --enable-cscope

sudo make && sudo make install

mv ~/.vimrc ~/.vimrc.bak
ln -s ~/.vim/vimrc ~/.vimrc

vim -c 'PlugInstall' -c 'qall'
