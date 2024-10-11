export CLICOLOR=1
export DOCKER_ACCESS_TOKEN=9a6f3939-7a45-4e10-855b-32aae1b01c43
export DOCKER_ENABLE_DEPRECATED_PULL_SCHEMA_1_IMAGE=1
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTTIMEFORMAT="%d/%m/%y %T "
export LSCOLORS=ExFxCxDxBxegedabagacad
#export NVM_DIR="$HOME/.nvm"
# export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u\[\033[01;32m\]@\[\033[01;34m\]\h\[\033[01;32m\]:\[\033[01;32m\]\w\[\033[01;34m\]\$\[\033[00m\] "
export WORKON_HOME=~/Envs # Virtualenv
export DEBUG_PRINT_LIMIT=999999 # react-testing-library full DOM output

# Default build flag overrides
# export CPPFLAGS="-I/opt/homebrew/opt/zlib/include -I/opt/homebrew/opt/bzip2/include"
# export LDFLAGS="-L/opt/homebrew/opt/zlib/lib -L/opt/homebrew/opt/bzip2/lib"

# Add Homebrew to the PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Configure build flags to use Brew's version of zlib & bzip2
if which brew > /dev/null; then
  export LDFLAGS="-L$(brew --prefix zlib)/lib -L$(brew --prefix bzip2)/lib -L$(brew --prefix mysql-client@8.0)/lib"
  export CPPFLAGS="-I$(brew --prefix zlib)/include -I$(brew --prefix bzip2)/include -I$(brew --prefix mysql-client@8.0)/include"
fi

# Add MySQL to the path
#export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client@8.0/bin:$PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql-client@8.0/lib/pkgconfig"

# Check if the current shell is a login shell
# shopt -q login_shell && echo 'Login shell' || echo 'Not login shell'

### PyENV ###
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# Init pyenv
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"
# Init pyenv-virtualenv
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Load NVM
#[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

# Load ASDF
[ -s "/opt/homebrew/opt/asdf/libexec/asdf.sh" ] && \. "/opt/homebrew/opt/asdf/libexec/asdf.sh"

# Set aws creds as env vars
#[ -f ~/scripts/export_aws_creds.py ] && eval "$(python ~/scripts/export_aws_creds.py)"

### Disabled because it's taking 7+ seconds and only works on node v12 (using v12.16.2)
# Automatic Version Switching for Node.js
# echo "Sourcing AVN"
# [[ -s "$HOME/.avn/bin/avn.sh" ]] && time source "$HOME/.avn/bin/avn.sh"
# echo "Finished sourcing AVN"

# iTerm2 Bash Integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

### Bash Completion ###
# Init Apple Silicon based programs
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
# Init Intel-based programs
# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
#     # Git if not found in /usr/local/etc, try the brew --prefix location
#     [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
#         . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
# }
# NVM
#[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
# ASDF
# [ -s "/opt/homebrew/opt/asdf/etc/bash_completion.d/asdf.bash" ] && \. "/opt/homebrew/opt/asdf/etc/bash_completion.d/asdf.bash"
# Docker
# source /Users/bryandodd/.docker/init-bash.sh || true # Added by Docker Desktop


# Load aliases
source ~/.bash_aliases
