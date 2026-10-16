alias ls='ls -l --color'
alias ll='ls -la --color'
alias vi='nvim'

export BASH_SILENCE_DEPRECATION_WARNING=1
export CLICOLOR=1


source $HOME/.profile

# Icke-interaktiva skal (scp, rsync, git över ssh) behöver bara PATH ovan.
[[ $- != *i* ]] && return


export user="c"
export PS1="\[\e[32m\]┌──(\[\e[94;1m\]$user\e[0;32m\])-[\[\e[38;5;46;1m\]\w\[\e[0;32m\]]\$(parse_git_branch) [\[\e[32m\]$?\[\e[32m\]]\n\[\e[32m\]╰─\[\e[94;1m\]\$\[\e[0m\] "




export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



command -v mullvad >/dev/null && echo "VPN STATUS: $(mullvad status)"


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
