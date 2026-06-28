. "$HOME/.cargo/env"

NORMAL="\[\033[00m\]"
BLUE="\[\033[01;34m\]"
YELLOW="\[\e[1;33m\]"
COOLCOLOR="\[\e[1;36m\]"
GREEN="\[\e[1;32m\]"





source ~/dotfiles/scripts/show_git_branch.sh
#source ~/dotfiles/scripts/good_to_have_scripts/kube_prompt.sh
source ~/dotfiles/scripts/setxrate.sh

#source ~/dotfiles/scripts/startup_scripts/screens.sh
#source ~/dotfiles/scripts/startup_scripts/background.sh
#source ~/dotfiles/scripts/startup_scripts/background.sh
#compton -b

export TERMINAL=ghostty
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/pingen/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/home/$USER/.local/bin/zed


export EDITOR="nvim"
export VISUAL="nvim"
export LAUNCH_EDITOR="$HOME/.local/bin/nvim-open"
