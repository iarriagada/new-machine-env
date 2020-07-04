#! /usr/bin/env bash

# Setup my dev environment on a new machine
# * Configures my bash environmente
# * Sets up my vim ide


export TOP=`pwd`
cd ~
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir .vim/colors
cp $TOP/vimrc .vimrc
cp $TOP/bashrc .bashrc
cp $TOP/badwolf.vim .vim/colors/
source .bashrc
