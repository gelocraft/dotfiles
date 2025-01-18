" Set options
colorscheme default
set number relativenumber
set scrolloff=10 sidescrolloff=10
set tabstop=4 shiftwidth=4 softtabstop=4
set hidden noerrorbells nowrap incsearch noshowmode
set timeout timeoutlen=300 updatetime=250 history=200
set expandtab autoindent smarttab smartindent smartcase autowrite 


" Set cursor shape for different modes
let &t_SI = "\e[6 q"  " Beam shape (Insert mode)
let &t_EI = "\e[2 q"  " Block shape (Normal mode)
let &t_SR = "\e[4 q"  " Underline shape (Replace mode)


" Minimal statusline config (no plugin needed)
let modes = {
            \ "i": "INSERT",
            \ "n": "NORMAL",
            \ "v": "VISUAL",
            \ "V": "V-LINE",
            \ "\x16": "V-BLOCK",
            \ "R": "REPLACE",
            \ "c": "COMMAND",
            \ "t": "TERMINAL"
            \}
let mode = modes[mode()]
autocmd ModeChanged * let mode = modes[mode()]
set statusline=%#StatusLine#\ %{mode}\ %#ModeMsg#\ %F\ %m\%=%y\ %l:%c\ %#StatusLine#\ %P\ 
