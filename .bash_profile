# .bash_profile

#setxkbmap fr

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# Git config:
# Prompt definitions:
#[[ -r ~/.prompt ]] && . ~/.prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export GIT_CEILING_DIRECTORIES=/panfs/panasas/cnusc/dci

source /etc/bash_completion.d/git

if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi


# Check if you are in an interactive shell:
[[ $- == *i* ]] && echo 'Interactive' || echo 'Not interactive'
# Check if you are in a login shell:
shopt -q login_shell && echo 'Login shell' || echo 'Not login shell'

# Pip install --user ?
export PATH=$PATH:/home/$USER/.local/bin
#export CUDA_VISIBLE_DEVICES=0

# Perform any expansions of variables, tildes
shopt -s direxpand
echo "$ who -m"
who -m
echo "$ vmstat"
vmstat
#echo "$ vmstat -d"
#vmstat -d
#for f in `find /proc/sys/kernel -type f` `find /proc/sys/vm -type f`; do if [ -r $f ]; then echo -e "$f:\t`cat $f`"; fi; done | sort
