export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u\[\033[01;32m\]@\[\033[01;34m\]\h\[\033[01;32m\]:\[\033[01;32m\]\w\[\033[01;34m\]\$\[\033[00m\] "
# export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export HISTFILESIZE=1000000
export HISTSIZE=1000000

alias diff="colordiff -y"

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
#export PATH=$(brew --prefix homebrew/php/php54)/bin:/usr/local/sbin:/usr/local/bin:$PATH
#PHP_AUTOCONF="/usr/local/bin/autoconf"

source ~/.bash_aliases

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Virtualenv
export WORKON_HOME=~/Envs
#export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

# Brew github api token
source ~/.secrets/homebrew_github_api_token
