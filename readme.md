# dotfiles

Konfiguration för bash, tmux, i3, polybar, alacritty och nvim.

## Installation

```sh
git clone git@github.com:louimx/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

Skriptet symlänkar configs till rätt ställen, installerar paketen i `PACKAGES`-listan
och länkar allt i `apps/` till `~/.local/bin`. Det är idempotent, kör det hur många gånger som helst.

## Appar utanför apt

Lägg AppImages och binärer i `apps/`, döp filen till det namn den ska köras som
(t.ex. `bruno.AppImage` blir `bruno`), och kör `./install.sh` igen.
Filerna följer inte med i git.

## Manuellt

- nvim: hämta senaste från neovim.io, apt-versionen är för gammal. Lägg den i `apps/`.
- Nerd-font (CaskaydiaCove) till `~/.local/share/fonts`, sedan `fc-cache -f`.

## PATH

All PATH sätts i `.profile`, en gång per inloggning. Lägg nya kataloger i guard-blocket där.
i3 startas från `.profile` vid inloggning på tty1, så ändringar i PATH kräver utloggning för att nå dmenu.
