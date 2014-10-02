export PATH=$HOME/bin:/usr/local/bin:/usr/local/opt/ruby/bin:$PATH
export GREP_OPTIONS='--color=auto'
export EDITOR=vim
export CLICOLOR=1
alias e=vim

# switch bash to vi mode
set -o vi

# this doesn't need to be enabled every time, but why not
git config --global color.ui true
git config --global user.email "dolph.mathews@gmail.com"
git config --global user.name "Dolph Mathews"
git config --global core.excludesfile ~/.gitignore_global

# default: PS1='\h:\W \u\$'
# hostname cwd $
PS1="\[$(tput setaf 2)\]\h \[$(tput setaf 4)\]\W \[$(tput setaf 10)\]\\$ \[$(tput sgr0)\]"

# export PYTHONSTARTUP=$HOME/.pystart

# keystone dev defaults
export OS_IDENTITY_API_VERSION=3
export OS_TOKEN=ADMIN
export OS_URL=http://localhost:35357/v3

# setup virtualenvwrapper
export WORKON_HOME=$HOME/Environments
which virtualenv > /dev/null && source virtualenvwrapper.sh

# speed up pip installs
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
