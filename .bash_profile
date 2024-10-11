export CLICOLOR=1
export DOCKER_ACCESS_TOKEN=9a6f3939-7a45-4e10-855b-32aae1b01c43
export DOCKER_ENABLE_DEPRECATED_PULL_SCHEMA_1_IMAGE=1
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTTIMEFORMAT="%d/%m/%y %T "
export LSCOLORS=ExFxCxDxBxegedabagacad
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
export PATH="/opt/homebrew/opt/mysql-client@8.0/bin:$PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql-client@8.0/lib/pkgconfig"

# Load ASDF
[ -s "/opt/homebrew/opt/asdf/libexec/asdf.sh" ] && \. "/opt/homebrew/opt/asdf/libexec/asdf.sh"

# iTerm2 Bash Integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

### Bash Completion ###
# Init Apple Silicon based programs
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# Load aliases
source ~/.bash_aliases
