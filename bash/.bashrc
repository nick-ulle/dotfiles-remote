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


# Aesthetics
# ==========

# Set the shell prompt.
PS1='\u\[\e[1;33m\]@\h \[\e[0;34m\]\W\[\e[m\] \$ '


# Farm Aliases
# ============

function scpu {
  # Using `set -x` and a subshell makes bash print the command.
  (set -x; srun --partition=med --time=0-12 --mem=16G $* --pty /bin/bash -il)
}


function sgpu {
  (set -x; srun --account=datalabgrp --partition=gpu-a100-h --gres=gpu:1 \
    --time=0-6 --mem=16G $* --pty /bin/bash -il)
}

function sjoin {
  (set -x; srun --jobid=${1} --pty /bin/bash -il)
}


alias sq='squeue --me'


function jl {
  local port="${1:-8888}"
  (set -x; jupyter lab --no-browser --ip="$(hostname)" --port=$port)
}


# Aliases
# =======

alias du='du --human-readable --max-depth 1'
alias df='df --human-readable --exclude-type tmpfs'

#alias nvim='vim'
alias mm='micromamba'

function mma {
  local env="${1:-main}"
  micromamba activate $env
}

alias mmd='micromamba deactivate'

alias px='pixi run'

alias pdb="PYTHONBREAKPOINT='IPython.core.debugger.set_trace' python"

alias r='R --quiet --no-save'

#alias ls='ls -h --group-directories-first --color=auto'
#alias ls='exa --icons --group-directories-first --sort=extension'

function ls {
  if command -v eza &> /dev/null
  then
    eza --icons --group-directories-first --git --sort=extension $@
  else
    command ls -h --group-directories-first --color=auto $@
  fi
}
alias ll='ls --long --classify'

alias grep='grep -n --color=auto'

alias trim='sd '\'' +$'\'' '\'\'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/nulle/env/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/nulle/env/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/nulle/env/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/nulle/env/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
#
# if [ -f "/home/nulle/env/miniconda3/etc/profile.d/mamba.sh" ]; then
#     . "/home/nulle/env/miniconda3/etc/profile.d/mamba.sh"
# fi
# <<< conda initialize <<<

#mamba activate main

# zoxide init
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init bash)"
fi

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
# export MAMBA_EXE='/home/nulle/.local/bin/micromamba';
# export MAMBA_ROOT_PREFIX='/home/nulle/env/micromamba';
# __mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__mamba_setup"
# else
#     alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
# fi
# unset __mamba_setup
# <<< mamba initialize <<<

. "$HOME/.cargo/env"
