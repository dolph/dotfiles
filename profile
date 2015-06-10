export GOPATH=$HOME/go
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/ruby/bin:$GOPATH/bin:$PATH
export GREP_OPTIONS='--color=auto'
export EDITOR=vim
alias e=vim

# use color by default
export CLICOLOR=1

# switch bash to vi mode
set -o vi

# this doesn't need to be enabled every time, but why not
git config --global color.ui true
git config --global user.email "dolph.mathews@gmail.com"
git config --global user.name "Dolph Mathews"
git config --global core.excludesfile $HOME/.gitignore_global

# default: PS1='\h:\W \u\$'
# hostname cwd $
PS1="\[$(tput setaf 2)\]\h \[$(tput setaf 4)\]\W \[$(tput setaf 10)\]>\[$(tput setaf 11)\]>\[$(tput setaf 12)\]> \[$(tput sgr0)\]"

# export PYTHONSTARTUP=$HOME/.pystart

# keystone dev defaults
export OS_IDENTITY_API_VERSION=3
export OS_TOKEN=ADMIN
export OS_URL=http://localhost:35357/v3

# make it trivial to jump into a development server
alias dev="ssh -p 443 23.253.149.141"

# virtualenv shortcuts
export VIRTUALENV_DIR=${VIRTUALENV_DIR:-$HOME/venv}
mkdir -p "$VIRTUALENV_DIR"

function deactivate_venv() {
    if type -t deactivate > /dev/null; then
        deactivate;
    fi;
}

function workon() {
    deactivate_venv
    source "$VIRTUALENV_DIR/$1/bin/activate";
}

function mkvirtualenv() {
    if [ ! -d "$VIRTUALENV_DIR/$1" ]; then
        virtualenv "$VIRTUALENV_DIR/$1";
    fi;
    workon "$1";
}

function rmvirtualenv() {
    deactivate_venv
    rm -rf "$VIRTUALENV_DIR/$1";
}

function lsvirtualenv() {
    ls -1 "$VIRTUALENV_DIR";
}
