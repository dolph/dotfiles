#!/bin/sh
set -e

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")

# create symlinks from the home directory to dotfiles in ~/dotfiles
dotfiles="ackrc bash_profile bashrc profile flake8 inputrc vim vimrc gvimrc gitconfig gitignore_global tmux.conf"
rawfiles="bin"

# symlink dotfiles to the home dir, each prefixed by a dot (.)
for file in $dotfiles; do
    rm -rf ~/.$file
    ln -s $SCRIPTPATH/$file ~/.$file
done

# symlink regular files to the home dir
for file in $rawfiles; do
    rm -rf ~/$file
    ln -s $SCRIPTPATH/$file ~/$file
done

mkdir -p ~/.weechat/
rm -rf ~/.weechat/weechat.conf
ln -s $SCRIPTPATH/weechat.conf ~/.weechat/weechat.conf

# install vim plugins
cd $SCRIPTPATH
git submodule init
git submodule update
vim +PluginInstall! +PluginClean! +qall

# install python basics
curl https://bootstrap.pypa.io/get-pip.py | python

pip install virtualenv
pip install hacking
