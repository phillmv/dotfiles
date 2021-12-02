#!/usr/bin/env bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

#ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/.vimrc $HOME/.vimrc
ln -s $(pwd)/.vim $HOME/.vim
#ln -s $(pwd)/emacs $HOME/.emacs
#ln -s $(pwd)/screenrc $HOME/.screenrc
git submodule update --init;
vim +'PlugInstall' +qa;
