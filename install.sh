#!/usr/bin/env bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

./script/setup &
