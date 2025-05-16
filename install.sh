#!/bin/bash
exec > >(tee -a -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

git submodule update --init;

if [ ! -z "$CODESPACES" ]; then
  . ./script/setup-codespaces.sh
fi

. ./script/setup.sh
