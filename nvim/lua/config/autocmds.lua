-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
	pattern = '*',
	group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
	callback = function() vim.highlight.on_yank() end,
})

-- Hide trailing whitespace on InsertEnter
vim.api.nvim_create_autocmd('InsertEnter', {
	pattern = '*',
	group = vim.api.nvim_create_augroup(
		'HideTrailingWhiteSpace',
		{ clear = true }
	),
	callback = function() vim.opt.list = false end,
})

-- Show trailing whitespace on InsertLeave
vim.api.nvim_create_autocmd('InsertLeave', {
	pattern = '*.*',
	group = vim.api.nvim_create_augroup(
		'ShowTrailingWhiteSpace',
		{ clear = true }
	),
	callback = function() vim.opt.list = true end,
})

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup(
		'gelocraft/LspAttach',
		{ clear = true }
	),
	callback = function(event)
		local keymap = function(keys, func, desc)
			if desc then desc = 'LSP: ' .. desc end
			vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
		end
		keymap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
		keymap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
		keymap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
		keymap('<leader>lr', vim.lsp.buf.references, '[L]sp [R]eferences')
		keymap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
		keymap('gt', vim.lsp.buf.type_definition, '[G]oto [T]ype Definition')
		keymap('K', vim.lsp.buf.hover, 'Hover Documentation')
		keymap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

		-- rounded border for textDocument/hover
		vim.lsp.handlers['textDocument/hover'] =
			vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
		vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
			vim.lsp.handlers.signature_help,
			{ border = 'rounded' }
		)

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
			vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
				buffer = event.buf,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
				buffer = event.buf,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end,
})
