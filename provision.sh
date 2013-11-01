#!/bin/bash
# install homebrew and some python development tools
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
brew install git python ack flake8 macvim
pip install --upgrade setuptools
pip install --upgrade pip

# install dotfiles
git clone https://github.com/dolph/dotfiles.git ~/dotfiles
sh ~/dotfiles/symlink.sh
