#!/bin/sh
set -ex

# install vim plugins
cd $SCRIPTPATH
git submodule init
git submodule update
vim +PluginInstall! +PluginClean! +qall
