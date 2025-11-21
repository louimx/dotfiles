alias ll='ls -la'
alias vi='nvim'

export BASH_SILENCE_DEPRECATION_WARNING=1
export EDITOR='nvim.appimage'
export CLICOLOR=1
export PATH=$PATH:/usr/local/bin

alias ls="ls -la --color"


# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export user="c"
#export PS1='\[\e[32m\]┌──(\[\e[94;1m\]$user\e[0;32m\])-[\[\e[38;5;46;1m\]\w\[\e[0;32m\]] [\[\e[32m\]$?\[\e[32m\]]\n\[\e[32m\]╰─\[\e[94;1m\]\$\[\e[0m\]'
export PS1="\[\e[32m\]┌──(\[\e[94;1m\]$user\e[0;32m\])-[\[\e[38;5;46;1m\]\w\[\e[0;32m\]]\$(parse_git_branch) [\[\e[32m\]$?\[\e[32m\]]\n\[\e[32m\]╰─\[\e[94;1m\]\$\[\e[0m\] "

source /home/pingen/.profile

echo "VPN STATUS:" $(mullvad status)

. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
