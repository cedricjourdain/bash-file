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

parse_git_branch() {
         git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export GIT_CEILING_DIRECTORIES=/panfs/panasas/cnusc/dci
