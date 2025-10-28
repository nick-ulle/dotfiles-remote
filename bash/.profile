#
# .profile
#
# This file is executed on TTY login to any shell. By default, bash skips this
# file if .bash_profile is found.


# Environment Variables
# =====================
# Make Vim the default editor.
export EDITOR="nvim"
export DIFFPROG="nvim -d"


# Set up R user library (for development).
export R_LIBS_USER=${HOME}/.config/R/library
export R_MAKEVARS_USER=${HOME}/.config/R/makevars
export R_PROFILE_USER=${HOME}/.config/R/rprofile

export TESSDATA_PREFIX="${HOME}/.local/share/tessdata"


# Path
# ====

# User specific aliases and functions
#export PATH=/data2/local/bin:$HOME/local/bin:$PATH
#export PKG_CONFIG_PATH=/data2/local/lib/pkgconfig:$PKG_CONFIG_PATH
#export LD_LIBRARY_PATH=/data2/local/lib64:/data2/local/lib:$LD_LIBRARY_PATH

# User specific environment and startup programs

# Add local bin to the path.
PATH="${HOME}/.local/bin:${PATH}"

# Add cargo bin to the path.
PATH="${HOME}/.cargo/bin:${PATH}"

# Add pixi bin to the path.
PATH="${HOME}/.pixi/bin:${PATH}"

# Add user environment bin to the path.
PATH="${HOME}/env/bin:${PATH}"

export PATH

#. "$HOME/.cargo/env"
