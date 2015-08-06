# create symlinks from the home directory to dotfiles in ~/dotfiles
dir=~/dotfiles
dotfiles="ackrc profile inputrc screenrc vim vimrc gvimrc gitignore_global tmux.conf"
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

# install vim plugins
cd ~/dotfiles
git submodule init
git submodule update
vim +PluginInstall! +qall

# install python basics
curl https://bootstrap.pypa.io/get-pip.py | sudo python

# you didn't see a sudo pip here
sudo pip install virtualenv
sudo pip install hacking
