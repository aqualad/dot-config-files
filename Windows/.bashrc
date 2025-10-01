# Load aliases
source ~/.bash_aliases
source ~/.bash_completions/*

# Add global NPM bins to path
export PATH="$PATH:$HOME/AppData/Roaming/npm"

##########################################################
# Bottom of file - Put things that need to run last here #
##########################################################

# Track the CWD, so new tab/panes start in the current directory (using some weird Windows black magic)
PROMPT_COMMAND=${PROMPT_COMMAND:+"$PROMPT_COMMAND; "}'printf "\e]9;9;%s\e\\" "`cygpath -w "$PWD" -C ANSI`"'

# Eternal Bash History (Keep at the bottom of the file)
test -e "/c/git/dot-config-files/scripts/bash_profile_helpers/force_eternal_history.sh" && source "/c/git/dot-config-files/scripts/bash_profile_helpers/force_eternal_history.sh"
