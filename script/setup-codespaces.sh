#!/bin/bash

set -x

git config --global url."https://github.com/".insteadOf git@github.com:
apt-get install -y vim
gem install ripper-tags
mkdir -p ~/.ssh
# could use ${GITHUB_USER}, but it's-a-me, phillmv
curl --silent --fail "https://github.com/phillmv.keys" > ~/.ssh/authorized_keys

# let's install nvim
# TODO: replace with something like https://github.com/keithamus/dotfiles/blob/ea97801e78a725c18fbb90d79200d2c0501ad3bd/vim/install.sh#L5-L12
# if the default fails
sudo apt install python3-neovim -y
