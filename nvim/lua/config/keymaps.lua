--- keymaps
local function keymap(mode, lhs, rhs, opts)
	opts = opts or {}
	vim.keymap.set(mode, lhs, rhs, opts)
end

local toggle_numberln = function()
	vim.cmd 'set number!'
	vim.cmd 'set relativenumber!'
end

-- diagnostics keymaps
keymap(
	'n',
	'<C-w>d',
	vim.diagnostic.open_float,
	{ desc = 'Open Floating Diagnostic' }
)
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Next Diagnostic' })
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous Diagnostic' })

-- toggle lazy profiler
keymap('n', '<leader>lp', '<cmd>Lazy profile<cr>', { desc = 'Lazy Profile' })

-- quickfixlist keymaps
keymap('n', '<c-n>', '<cmd>cnext<cr>', { desc = 'cnext' })
keymap('n', '<c-p>', '<cmd>cprev<cr>', { desc = 'cprevious' })
keymap('n', '<c-q>', '<cmd>copen<cr>', { desc = 'copen' })
keymap(
	'n',
	'<leader>q',
	vim.diagnostic.setqflist,
	{ desc = 'Open Diagnostics with QuickFixList' }
)

-- toggle statusline
keymap(
	'n',
	'<leader>l1',
	'<cmd>set laststatus=1<cr>',
	{ noremap = true, silent = true, desc = 'hide statusline' }
)
keymap(
	'n',
	'<leader>l2',
	'<cmd>set laststatus=2<cr>',
	{ noremap = true, silent = true, desc = 'show statusline' }
)

-- toggle number line
keymap(
	'n',
	'<leader>ln',
	toggle_numberln,
	{ noremap = true, silent = true, desc = 'toggle number line' }
)

-- toggle highlight search
keymap(
	'n',
	'<leader>hl',
	':set hlsearch!<cr>',
	{ noremap = true, silent = true, desc = 'toggle [H]ighlight [S]earch' }
)

-- move cursor to bottom and center the screen
keymap('n', 'L', 'Lzz')
keymap('n', 'G', 'Gzz')

-- navigate across wrapped lines
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
keymap(
	'n',
	'k',
	'v:count == 0 ? \'gk\' : \'k\'',
	{ expr = true, silent = true }
)
keymap(
	'n',
	'j',
	'v:count == 0 ? \'gj\' : \'j\'',
	{ expr = true, silent = true }
)
