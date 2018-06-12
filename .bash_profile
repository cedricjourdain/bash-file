# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi

# Prompt definitions:
#[[ -r ~/.prompt ]] && . ~/.prompt

# Alias definitions:
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# Check if you are in an interactive shell:
[[ $- == *i* ]] && echo 'Interactive' || echo 'Not interactive'
# Check if you are in a login shell:
shopt -q login_shell && echo 'Login shell' || echo 'Not login shell'

