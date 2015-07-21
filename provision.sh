#!/bin/bash
# install homebrew and some python development tools
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install ack
brew install ansible
brew install git
brew install macvim
brew install python
brew install ssh-copy-id
brew install tree

# install cask so we can install GUI apps
brew install caskroom/cask/brew-cask
brew cask install google-chrome
brew cask install vagrant
brew cask install virtualbox
brew cask install vlc

pip install --upgrade setuptools
pip install --upgrade pip
pip install virtualenv
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
