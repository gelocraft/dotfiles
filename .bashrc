# SOURCE THESE
# -----------------------------------
[ -f /etc/bashrc ] && . /etc/bashrc
[ -f ~/.aliasrc ] && . "$HOME"/.aliasrc
[ -f ~/.bash_prompt ] && . "$HOME"/.bash_prompt
[ -f ~/.fzf.bash ] && . "$HOME"/.fzf.bash
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ADD THESE TO PATH
# -----------------------------------
[ -d ~/.local/bin ] && PATH=$PATH:$HOME/.local/bin
[ -d ~/.dotfiles/handy-scripts ] && PATH=$PATH:~/.dotfiles/handy-scripts
[ -d ~/.cargo ] && PATH=$PATH:$HOME/.cargo/bin
[ -d ~/.miniconda/bin ] && PATH=$PATH:$HOME/.miniconda/bin

# CUSTOM FUNCTIONS
# -----------------------------------
fast_cd() {
  selected=$(fast-cd); [ -z "$selected" ] || cd "$selected" || return
}

# CUSTOM KEYMAPS
# -----------------------------------
bind -x '"\C-p": tmux-sessionizer'
bind -x '"\C-b": randbg'
bind -x '"\C-f": fvi'
bind '"\C-o": "fast_cd; clear\n"'

## ALL ENVIRONMENT VARIABLE GOES HERE
# -----------------------------------
RED=#f65866
PINK=#FF52A2
PURPLE=#DAB8F3
BG=#2a324a
FG=#93a4c3
MINT=#00FFAB
WHITE=#EDEDED

export PATH
export EDITOR="nvim"
[ -d "$HOME"/.nvm ] && export NVM_DIR="$HOME/.nvm"
[ -f ~/.fzf.bash ] && export FZF_DEFAULT_OPTS="--ansi --color=bg+:$BG,fg+:$FG,gutter:-1,border:$PURPLE,hl:$MINT,hl+:$PINK,query:$PINK,pointer:$PINK,label:$WHITE,info:$MINT,spinner:$PURPLE,header:$PURPLE --border=rounded"
