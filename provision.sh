#!/bin/bash
# install homebrew and some python development tools
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
brew install git python ack macvim tree
pip install --upgrade setuptools
pip install --upgrade pip
pip install virtualenv virtualenvwrapper flake8

# install dotfiles
git clone https://github.com/dolph/dotfiles.git ~/dotfiles
sh ~/dotfiles/symlink.sh

# set os x preferences
sh ~/dotfiles/osx.sh
