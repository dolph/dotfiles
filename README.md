dotfiles
========

Provision a clean OS X install for local Python development and install these dot files:

    curl https://raw.github.com/dolph/dotfiles/master/provision.sh | bash

Or if you already have `git`, etc, installed, you can just clone this repo to
`~/dotfiles` and do the symlinking:

    git clone https://github.com/dolph/dotfiles.git ~/dotfiles
    sh ~/dotfiles/symlink.sh
