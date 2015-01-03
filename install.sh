#!/bin/bash

PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s $PROJECT_DIR/vimrc ~/.vimrc
ln -s $PROJECT_DIR/vim ~/.vim

git clone https://github.com/godlygeek/tabular.git vim/bundle/tabular
git clone https://github.com/terryma/vim-multiple-cursors.git vim/bundle/vim-multiple-cursors
git clone https://github.com/scrooloose/syntastic.git vim/bundle/syntastic

sudo apt-get install links php-pear cscope

sudo pear install PHP_CodeSniffer
