-- local & global leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true
vim.g.file_explorer = 'oil.nvim'
vim.g.enable_native_lsp = vim.version.ge(vim.version(), '0.11.0-dev')
vim.g.lazydev_enabled = not vim.g.enable_native_lsp
vim.g.diagnostic = {
	virtual_text = { enabled = true },
	virtual_lines = { enabled = false },
}

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
