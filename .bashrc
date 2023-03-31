# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH=$PATH:/lus/home/BCINES/dci/jourdain/tools/VSCode-linux-x64/bin

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ ! -d ~/.fzf ]; then
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Random
alias enter_matrix='echo -e "\e[32m"; while :; do for i in {1..64}; do r="$(($RANDOM % 2))"; if [[ $(($RANDOM % 5)) == 1 ]]; then if [[ $(($RANDOM % 4)) == 1 ]]; then v+="\e[1m $r   "; else v+="\e[2m  $r   "; fi; else v+="     "; fi; done; echo -e "$v"; v=""; done'

# IP address lookup
function whatismyip() {
    # Dumps a list of all IP addresses for every device
    # /sbin/ifconfig |grep -B1 "inet addr" |awk '{ if ( $1 == "inet" ) { print $2 } else if ( $2 == "Link" ) { printf "%s:" ,$1 } }' |awk -F: '{ print $1 ": " $3 }';

    # Internal IP Lookup
    echo -n "Internal IP: "
    ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'

    # External IP Lookup
    #echo `dig +short myip.opendns.com @resolver1.opendns.com`
    curl -s https://4.ifcfg.me/all
}

# TOP 11 COMMANDS
function top10() {
    history | awk '{a[$2]++ } END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

function extract() {
    if [ -f $1 ]; then
        case $1 in
        *.tar.bz2) tar xvjf $1 ;;
        *.tar.gz) tar xvzf $1 ;;
        *.bz2) bunzip2 $1 ;;
        *.rar) unrar x $1 ;;
        *.gz) gunzip $1 ;;
        *.tar) tar xvf $1 ;;
        *.tbz2) tar xvjf $1 ;;
        *.tgz) tar xvzf $1 ;;
        *.zip) unzip $1 ;;
        *.Z) uncompress $1 ;;
        *.7z) 7z x $1 ;;
        *) echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

                                   
