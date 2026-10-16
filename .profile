[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

NORMAL="\[\033[00m\]"
BLUE="\[\033[01;34m\]"
YELLOW="\[\e[1;33m\]"
COOLCOLOR="\[\e[1;36m\]"
GREEN="\[\e[1;32m\]"





#. ~/dotfiles/scripts/kube_prompt.sh
. ~/dotfiles/scripts/setxrate.sh

#source ~/dotfiles/scripts/startup_scripts/screens.sh
#source ~/dotfiles/scripts/startup_scripts/background.sh
#source ~/dotfiles/scripts/startup_scripts/background.sh
#compton -b

export TERMINAL=alacritty
# PATH sätts bara en gång, .bashrc sourcar den här filen i varje nytt skal.
if [ -z "$DOTFILES_PROFILE_LOADED" ]; then
    export DOTFILES_PROFILE_LOADED=1
    export PATH="$HOME/dotfiles/scripts:$HOME/.local/bin:$HOME/.npm-global/bin:$PATH"
    export PATH=$PATH:/usr/local/go/bin
    export PATH=$PATH:/home/$USER/.local/bin/zed
fi


export EDITOR="nvim"
export VISUAL="nvim"
export LAUNCH_EDITOR="$HOME/.local/bin/nvim-open"

if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
	exec startx /usr/bin/i3
fi
