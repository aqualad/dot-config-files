export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u\[\033[01;32m\]@\[\033[01;34m\]\h\[\033[01;32m\]:\[\033[01;32m\]\w\[\033[01;34m\]\$\[\033[00m\] "
# export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTTIMEFORMAT="%d/%m/%y %T "

alias diff="colordiff -y"

# Load bash completion for git
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
    # if not found in /usr/local/etc, try the brew --prefix location
    [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
        . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
}
#export PATH=$(brew --prefix homebrew/php/php54)/bin:/usr/local/sbin:/usr/local/bin:$PATH
#PHP_AUTOCONF="/usr/local/bin/autoconf"

source ~/.bash_aliases

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Add /usr/local/sbin
PATH="/usr/local/sbin:${PATH}"
export PATH

# Add ~/.local/ to PATH
export PATH=$HOME/.local/bin:$PATH

# Virtualenv
export WORKON_HOME=~/Envs
#export PROJECT_HOME=$HOME/Devel
#source /usr/local/bin/virtualenvwrapper.sh

# Brew github api token
source ~/.secrets/homebrew_github_api_token

# Start pyenv
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Set aws creds as env vars
[ -f ~/scripts/export_aws_creds.py ] && eval "$(python ~/scripts/export_aws_creds.py)"
