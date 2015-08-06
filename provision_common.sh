# install vim plugins
cd ~/dotfiles
git submodule init
git submodule update
vim +PluginInstall! +qall
