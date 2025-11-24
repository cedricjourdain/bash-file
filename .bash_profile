# .bash_profile
#
# Best practice: Global environment varable, inial modules

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH=$PATH:/lus/home/BCINES/dci/jourdain/tools/VSCode-linux-x64/bin
