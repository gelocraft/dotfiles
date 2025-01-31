-- I set this to `true` when I have `nerd font` installed
vim.g.have_nerd_font = true

-- no showmode
vim.o.showmode = false

-- set nowildmenu
vim.o.wildmenu = false

-- tab space
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true

-- set scrolloff
vim.o.scrolloff = 10
vim.o.sidescrolloff = 20

-- file explorer
vim.g.netrw_banner = 0 -- disable explorer banner

-- enable highlight on search
vim.o.hlsearch = true

-- sync clipboard between os and neovim.
vim.schedule(function() vim.opt.clipboard = 'unnamedplus' end)

-- enable break indent
vim.o.breakindent = true

-- save undo history
vim.o.undofile = true

-- case insensitive searching
vim.o.ignorecase = false
vim.o.smartcase = true

-- keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.o.termguicolors = true

-- line number
vim.wo.wrap = false
vim.wo.number = true
vim.wo.relativenumber = true

-- show trailing whitespace
vim.opt.list = true
vim.opt.listchars:append 'trail:␣'

-- default character for tabs
vim.opt.listchars:append 'tab:│ '

-- custom filetypes
vim.filetype.add {
	extension = {
		tf = 'terraform',
		tfvars = 'terraform-vars',
	},
}
