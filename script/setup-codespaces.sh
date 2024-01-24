#!/bin/bash

set -x

git config --global url."https://github.com/".insteadOf git@github.com:
apt-get install -y vim
gem install ripper-tags
mkdir -p ~/.ssh
# could use ${GITHUB_USER}, but it's-a-me, phillmv
curl --silent --fail "https://github.com/phillmv.keys" > ~/.ssh/authorized_keys

# let's install nvim
# thanks https://github.com/keithamus/dotfiles/blob/ea97801e78a725c18fbb90d79200d2c0501ad3bd/vim/install.sh#L5-L12

sudo apt install -y fuse libfuse2
sudo groupadd fuse
sudo usermod -aG fuse "$(whoami)"
wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

sudo apt install python3-neovim -y

# i'd like to have ag
sudo apt-get -y install silversearcher-ag
