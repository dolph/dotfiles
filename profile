#!/bin/sh

# Switch sh to vi mode, because the sh default is unholy.
set -o vi

# Use color by default.
export CLICOLOR=1

if [ ! -e "$HOME/.gitconfig" ]
then
    # This doesn't need to be enabled every time, but why not?
    git config --global color.ui true
    git config --global user.email "dolph.mathews@gmail.com"
    git config --global user.name "Dolph Mathews"
    git config --global core.excludesfile $HOME/.gitignore_global
fi

# Set virtualenv shortcuts.
export WORKON_HOME=$HOME/venv
. ~/dotfiles/virtualenvwrapperlite/virtualenvwrapperlite.sh

# Detect platform ($OSTYPE is not populated in FreeBSD 11).
case "$(uname -s)" in
Linux|Darwin)
    export GOPATH=$HOME/go
    export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/ruby/bin:$GOPATH/bin:$PATH

    # Development defaults for OpenStack Keystone.
    export OS_IDENTITY_API_VERSION=3
    export OS_TOKEN=ADMIN
    export OS_URL=http://localhost:35357/v3
    ;;
FreeBSD)
    ;;
esac
