autoload -Uz compinit
compinit
_comp_options+=(globdots)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"


export HISTSIZE=100000
export SAVEHIST=100000
setopt EXTENDED_HISTORY

export EDITOR=nvim

source ~/.config/zsh/alias.zsh
source ~/.config/zsh/export.zsh
source ~/.config/zsh/estetic.zsh
source ~/.config/zsh/local.zsh

#spegni il computer, attacchi i dischi
#<C-e> -> impostazioni raid
#i dischi vanno formattati
#seleziono i dischi e la modalità del raid

# hackathon

[ -f "/Users/carlorosso/.ghcup/env" ] && . "/Users/carlorosso/.ghcup/env" # ghcup-env
# Created by `pipx` on 2024-07-29 10:40:37
export PATH="$PATH:/Users/carlorosso/.local/bin"
