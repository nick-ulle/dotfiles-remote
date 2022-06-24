#
# .bashrc
#
# This file is executed by every new interactive shell.

# Return if not running interactively.
[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
#export PATH=/data2/local/bin:$HOME/local/bin:$PATH
export PKG_CONFIG_PATH=/data2/local/lib/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=/data2/local/lib64:/data2/local/lib:$LD_LIBRARY_PATH


# Aesthetics
# ==========

# Set the shell prompt.
PS1='\u\[\e[1;33m\]@\h \[\e[0;34m\]\W\[\e[m\] \$ '


# Aliases
# =======

#alias nvim='vim'
alias cda='conda activate'
alias cdd='conda deactivate'

alias r='R --quiet --no-save'

alias ls='ls -h --group-directories-first --color=auto'
#alias ls='exa --icons --group-directories-first --sort=extension'

alias grep='grep -n --color=auto'

alias trim='sd '\'' +$'\'' '\'\'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/nulle/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/nulle/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/nulle/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/nulle/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#conda activate main
