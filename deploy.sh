#!/bin/sh

PWD=`pwd`

rm ~/.vim ~/.vimrc
ln -s $PWD ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
# rm ~/.gvimrc
# ln -s ~/.vim/gvimrc ~/.gvimrc

git submodule add https://github.com/gmarik/vundle bundle/vundle
git submodule update --init

vim +PluginInstall! +PluginClean! +qa

