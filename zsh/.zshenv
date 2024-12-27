ZSH_PATH="$(command -v zsh)"
NEOVIM_PATH="$(command -v nvim)"
NVIM_APPNAME="nvim"
EDITOR="$NEOVIM_PATH"
KEYTIMEOUT=1
HISTSIZE=1000
SAVEHIST=1000
HISTFILE="$HOME/.zsh_history"
SHELL="$ZSH_PATH"
GOPATH="$HOME/.go"
GOBIN="$GOPATH/bin"
XDG_CONFIG_HOME="$HOME/.config"
XDG_DATA_HOME="$HOME/.local/share"
STARSHIP_CONFIG="$HOME/.dotfiles/starship/starship.toml"

[ -z "$NEOVIM_PATH" ] && EDITOR="usr/bin/vim"

# FZF DEFAULT OPTIONS
FZF_CTRL_R_OPTS="--border-label ' command history '"
FZF_CTRL_T_OPTS="--border-label ' relative files '"
FZF_ALT_C_OPTS="--border-label ' relative directories '"
FZF_DEFAULT_OPTS_FILE="$HOME/.dotfiles/fzf/.fzfrc"

[ -n "$GOBIN" ] && PATH=$PATH:$GOBIN
[ -d ~/.cargo ] && PATH=$PATH:$HOME/.cargo/bin
[ -d /usr/local/go/bin ] && PATH=$PATH:/usr/local/go/bin
[ -d ~/.local/bin ] && PATH=$PATH:$HOME/.local/bin
[ -d ~/.dotfiles/handy-scripts/bin ] && PATH=$PATH:$HOME/.dotfiles/handy-scripts/bin

export PATH SHELL EDITOR GOPATH GOBIN KEYTIMEOUT FZF_DEFAULT_OPTS_FILE STARSHIP_CONFIG XDG_CONFIG_HOME XDG_DATA_HOME NVIM_APPNAME
