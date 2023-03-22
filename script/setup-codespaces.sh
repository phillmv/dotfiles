#!/bin/bash

git config --global url."https://github.com/".insteadOf git@github.com:
apt-get install -y vim
gem install ripper-tags
mkdir -p ~/.ssh
# could use ${GITHUB_USER}, but it's-a-me, phillmv
curl --silent --fail "https://github.com/phillmv.keys" > ~/.ssh/authorized_keys

# let's install nvim
cd $(mktemp -d) && \
  curl -fLo nvim-linux64.deb https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb && \
  sudo apt install ./nvim-linux64.deb -y
cd -
sudo apt install python3-neovim -y
