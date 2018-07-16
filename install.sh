#!/bin/bash
sudo su
sudo apt-get install vim vim-gnome vim-tiny build-essential
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cd ~/vim_conf
cp .vimrc ~/.vim/.vimrc
cp colors/far.vim ~/.vim/colors/far.vim
cp colors/jellybeans.vim ~/.vim/colors/jellybeans.vim
cp fonts/Terminus.ttf /usr/local/share/fonts/truetype/Terminus.ttf
sudo chown root /usr/local/share/fonts/truetype/Terminus.ttf
sudo fc-cache
cp templates/temp.cpp ~/temp.cpp
cp templates/temp.c ~/temp.c
cp templates/temp.html ~/temp.html
cp tern-config ~/.tern-config
