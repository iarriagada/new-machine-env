#! /usr/bin/env bash

# Setup my dev environment on a new machine
# * Configures my bash environmente
# * Sets up my vim ide

git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
cp -r .vim/ $HOME/.
cp vimrc $HOME/.vimrc
cp gitconfig $HOME/.gitconfig
cp bashrc $HOME/.bashrc
source $HOME/.bashrc
