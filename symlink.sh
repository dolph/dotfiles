#!/bin/bash

# create symlinks from the home directory to dotfiles in ~/dotfiles

dir=~/dotfiles
dotfiles="profile inputrc screenrc vim vimrc gvimrc gitconfig gitignore_global tmux.conf"
rawfiles="bin"

# symlink dotfiles to the the home dir, each prefixed by a dot (.)
cd $dir
for file in $dotfiles; do
    rm -rf ~/.$file
    ln -s $dir/$file ~/.$file
done

# symlink regular files to the the home dir
for file in $rawfiles; do
    rm -rf ~/$file
    ln -s $dir/$file ~/$file
done
