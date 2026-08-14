#!/bin/bash

set -x

ln -s  $(pwd)/tmux.conf     $HOME/.tmux.conf
ln -s  $(pwd)/.vimrc        $HOME/.vimrc
ln -sn $(pwd)/.vim/         $HOME/.vim
ln -s  $(pwd)/.bash_profile $HOME/.bash_profile
ln -sn $(pwd)/prompts       $HOME/.prompts

mkdir -p $HOME/.config
ln -s $(pwd)/.config/nvim  $HOME/.config

mkdir -p $HOME/.copilot
ln -sf $(pwd)/copilot/copilot-instructions.md $HOME/.copilot/copilot-instructions.md
#ln -s $(pwd)/emacs $HOME/.emacs
#ln -s $(pwd)/screenrc $HOME/.screenrc

mkdir -p $HOME/bin
ln -s $(pwd)/bin/* $HOME/bin

if command -v gh > /dev/null; then
  gh extension install https://github.com/github/gh-stack
fi

if command -v vim > /dev/null; then
  vim +'PlugInstall' +qa;
fi

if command -v nvim > /dev/null; then
  nvim --headless +PlugInstall +qa
fi
