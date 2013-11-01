export PATH=/Users/dolph/bin:/usr/local/bin:/usr/local/opt/ruby/bin:$PATH
export GREP_OPTIONS='--color=auto'
export EDITOR=vim
export CLICOLOR=1
alias e=vim

# switch bash to vi mode
set -o vi

# increase maximum number of open files
# ulimit -n 1024

# this doesn't need to be enabled every time, but why not
git config --global color.ui true
git config --global user.email "dolph.mathews@gmail.com"
git config --global user.name "Dolph Mathews"
git config --global core.excludesfile ~/.gitignore_global

# default: PS1='\h:\W \u\$'
PS1='\W \$ '

# export PYTHONSTARTUP='/Users/dolph/.pystart'

# keystone dev defaults
export OS_SERVICE_TOKEN=ADMIN
export OS_SERVICE_ENDPOINT=http://localhost:35357/v2.0/

export WORKON_HOME=~/Environments
# source /usr/local/bin/virtualenvwrapper.sh

# speed up pip installs
export PIP_DOWNLOAD_CACHE=~/.pip/cache
