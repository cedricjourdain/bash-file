# .bash_aliases

## Colorize commands output for ease of use
alias ls='ls --color'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff="diff --old-group-format=$'\e[0;31m%<\e[0m' --new-group-format=$'\e[0;31m%>\e[0m' --unchanged-group-format=$'\e[0;32m%=\e[0m' "

#function lfs_ls { if [ -z "$1" ] ; then f="." ; else f="$1"; fi ; lfs find "$f" -maxdepth 1 ; } 
#function lfs_ls {
#    if [ -z "$1" ]; then
#        f="."
#    else
#        f="$1"
#    fi
#
#    lfs find "$f" -maxdepth 1 -type f -printf "%T@ %s %p\n"
#    lfs find "$f" -maxdepth 1 -type d -printf "\e[34m%T@ %s %p/\e[0m\n" | while read -r line; do echo -e "$line"; done
#}
#alias lfsls='lfs_ls' 

## Prompt before overwrite
alias cp='cp -i'
alias mv='mv -i'

## Pass options to free
alias meminfo='free -m -l -t'

## List all directories in current directories
alias ldir='ls -l | grep ^d'
alias lr="ls -lrth"
alias la='ls -A'
alias l='ls -CF'
alias lfile="ls -p | grep -v '/$'"
alias lf='function _lf(){ lfs find "$1" -maxdepth 1 -type f -printf "%T@ %s %p\n" | sort -n -r | while read -r time size file; do echo "$(numfmt --to=iec-i --suffix=B $size)   $(basename $file)"; done; lfs find "$1" -maxdepth 1 -type d -printf "%s %p\n" | while read -r size file; do echo -e "\e[34m$(basename $file)/\e[0m"; done }; _lf'

## Show size of the folders in this directory
alias folders="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn"

## Get top process eating memory
alias psmem10='ps auxf | sort -nr -k 4 | head -10'


## Get rid of command not found
alias cd..='cd ..'
alias sl="ls"
alias moudle="module";alias mdoule="module"
alias moduel="module";alias mdouel="module"
alias ml="module load"
alias rl="ls -lrth"

## New set of commands
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'
alias tree="find . | sed 's/[^/]*\//|   /g;s/| *\([^| ]\)/+--- \1/'"

## Searches our process for an argument we'll pass (ex: psg vim)
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"


## SLURM
# qa sorts by priority
# qu shows my own jobs sorted by sequence nr
alias qa="squeue -S p"
alias qu="squeue -l -u $USER | sort -n"
#alias squeue="squeue -o '%.8i %.8u %.12j %.8u %.6T %.6M %.9l %.4D %.6C %.6b %.10N %.8Q %k %.20S %.10R %.8P'"
alias squeue="squeue -o '%.8i %.8u %.32j %.9T %.6M  %.4D (Nodes) %.6C (Cpus) %.20S %.10R %.10P  %.10l (Timelimit)'"
