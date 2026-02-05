alias ls='ls -l --color'
alias lsa='ls -la --color'
alias vi='nvim'

export BASH_SILENCE_DEPRECATION_WARNING=1
export CLICOLOR=1
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:mullvad-browser
export PATH=$PATH:/usr/pgadmin4/bin
export PATH=$PATH:/usr/pgadmin4/bin
export PATH=$PATH:/home/pingen/base/floorp
export PATH="$PATH:/home/$USER/programs"
export PATH="$PATH:/home/$USER/programs/gitkraken"
export PATH="$HOME/.npm-global/bin:$PATH"


source /home/pingen/.profile


export user="c"
export PS1="\[\e[32m\]┌──(\[\e[94;1m\]$user\e[0;32m\])-[\[\e[38;5;46;1m\]\w\[\e[0;32m\]]\$(parse_git_branch) [\[\e[32m\]$?\[\e[32m\]]\n\[\e[32m\]╰─\[\e[94;1m\]\$\[\e[0m\] "




. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=$HOME/.local/bin:$PATH
. "/home/pingen/.deno/env"



echo "VPN STATUS:" $(mullvad status)


# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

show_last_patch_run() {
    local f="$HOME/.last_patchbox_run"
    if [[ -f "$f" ]]; then
        local ts last
        ts=$(cat "$f")
        last=$(date -d "@$ts" '+%Y-%m-%d %H:%M:%S')
        echo "Last patch run: $last | Run patchbox to patch it now"
    else
        echo "patchbox has not been run yet."
    fi
}
show_last_patch_run
