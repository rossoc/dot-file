autoload -Uz compinit
compinit
_comp_options+=(globdots)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"


export HISTSIZE=100000
export SAVEHIST=100000
setopt EXTENDED_HISTORY

export EDITOR=nvim

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/opt/qt/bin:$PATH"

source ~/.config/zsh/alias.zsh
source ~/.config/zsh/export.zsh
source ~/.config/zsh/estetic.zsh

#spegni il computer, attacchi i dischi
#<C-e> -> impostazioni raid
#i dischi vanno formattati
#seleziono i dischi e la modalità del raid

# hackathon
