#!/bin/bash
# install homebrew and some python development tools
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
brew install python
brew install ack
brew install macvim
brew install tree
brew install ssh-copy-id
brew install ansible

# install cask so we can install GUI apps
brew install caskroom/cask/brew-cask
brew install google-chrome
brew install virtualbox
brew install vagrant

pip install --upgrade setuptools
pip install --upgrade pip
pip install virtualenv
pip install virtualenvwrapper
pip install hacking

# install dotfiles
git clone https://github.com/dolph/dotfiles.git ~/dotfiles
sh ~/dotfiles/symlink.sh

# set os x preferences
sh ~/dotfiles/osx.sh

# install fonts
cp -f ~/dotfiles/fonts/* ~/Library/Fonts/

# run updates
./update.sh
