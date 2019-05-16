#!/bin/sh
set -ex

# install vim plugins
cd $SCRIPTPATH
git submodule init
git submodule update
vim +PluginInstall! +PluginClean! +qall

# Enable passwordless sudo
sudo echo "$(whoami) ALL = (ALL) NOPASSWD: ALL" > /etc/sudoers.d/$(whoami)
sudo chmod 0400 /etc/sudoers.d/$(whoami)
