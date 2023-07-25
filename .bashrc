set -o vi
EDITOR="nvim"
[ -f /etc/bashrc ] && . /etc/bashrc
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -d ~/.local/bin ] && PATH=$PATH:$HOME/.local/bin && export PATH

## bind (ctrl-x) --> tmux-sessionizer
#-----------------------------------------------------
bind -x '"\C-x": tmux-sessionizer'

## change background scripts
#-----------------------------------------------------
bind -x '"\C-b": randbg'

## bind (ctrl-f) --> fast-cd
#-----------------------------------------------------
bind '"\C-f": "selected=$(fast-cd); [[ -z $selected ]] || cd $selected; clear\n"'

## source nvm
#-----------------------------------------------------
[ -d $HOME/.nvm ] && export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## source miniconda
#-----------------------------------------------------
[ -d ~/.miniconda/bin ] && PATH=$PATH:$HOME/.miniconda/bin && export PATH


RED=#f65866
YELLOW=#FF8400
PINK=#FF52A2
PURPLE=#DAB8F3
BG=#2a324a
FG=#93a4c3
MINT=#00FFAB
WHITE=#EDEDED

## source fzf
#-----------------------------------------------------
[ -f ~/.fzf.bash ] && source ~/.fzf.bash && export FZF_DEFAULT_OPTS="--ansi --color=bg+:$BG,fg+:$FG,gutter:-1,border:$PURPLE,hl:$MINT,hl+:$PINK,query:$PINK,pointer:$PINK,label:$WHITE,info:$MINT,spinner:$PURPLE,header:$PURPLE --border=rounded"

## source cargo
#-----------------------------------------------------
[ -d ~/.cargo ] && PATH=$PATH:$HOME/.cargo/bin && export PATH
