alias ls='exa --group-directories-first'
alias v='nvim'
alias ll='exa -lhars name'
alias lt='exa -L 3 -s extension --tree'
alias on='brew services start yabai skhd'
alias off='brew services stop yabai'
alias t='tmux'
alias ta='tmux attach -t'
alias tq='tmux kill-session -t'
alias e='exit'
alias python='python3.10'
alias connect='ssh weav@venifadi.selfip.org'

autoload -Uz compinit
compinit
_comp_options+=(globdots)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export HISTSIZE=100000
export SAVEHIST=100000
setopt EXTENDED_HISTORY

export EDITOR=nvim

export GOPATH=$HOME/.config/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/opt/qt/bin:$PATH"
export PYTHONPATH="$PYTHONPATH:/opt/homebrew/lib/python3.10/site-packages"


#spegni il computer, attacchi i dischi
#<C-e> -> impostazioni raid
#i dischi vanno formattati
#seleziono i dischi e la modalità del raid

# hackathon
