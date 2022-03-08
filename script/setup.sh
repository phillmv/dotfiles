#!/bin/bash

ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/.vimrc $HOME/.vimrc
ln -s $(pwd)/.vim $HOME/.vim
ln -s $(pwd)/.bash_profile $HOME/.bash_profile
#ln -s $(pwd)/emacs $HOME/.emacs
#ln -s $(pwd)/screenrc $HOME/.screenrc
git submodule update --init;
vim +'PlugInstall' +qa;
