#!/bin/bash

PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s $PROJECT_DIR/vimrc ~/.vimrc
ln -s $PROJECT_DIR/vim ~/.vim
