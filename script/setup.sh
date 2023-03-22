#!/bin/bash

ln -s $(pwd)/tmux.conf     $HOME/.tmux.conf
ln -s $(pwd)/.vimrc        $HOME/.vimrc
ln -s $(pwd)/.vim          $HOME/.vim
ln -s $(pwd)/.bash_profile $HOME/.bash_profile
ln -s $(pwd)/.config       $HOME/.config
#ln -s $(pwd)/emacs $HOME/.emacs
#ln -s $(pwd)/screenrc $HOME/.screenrc
git submodule update --init;

if command -v vim > /dev/null; then
  vim +'PlugInstall' +qa;
fi

if command -v nvim > /dev/null; then
  nvim --headless +PlugInstall +qa
fi

