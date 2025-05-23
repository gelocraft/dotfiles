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
	callback = function(args)
		local toggle_inlay_hint = function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end
		local hover_definition = function(opts)
			opts = opts or {}
			return function() vim.lsp.buf.hover(opts) end
		end
		local keymap = function(keys, func, desc)
			if desc then desc = 'LSP: ' .. desc end
			vim.keymap.set('n', keys, func, { buffer = args.buf, desc = desc })
		end
		keymap('gt', vim.lsp.buf.type_definition, '[G]oto [T]ype Definition')

		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method 'textDocument/implementation' then
			keymap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
		end

		if client:supports_method 'textDocument/completion' then
			-- stylua: ignore
			-- vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end

		if client:supports_method 'textDocument/inlayHint' then
			keymap('<leader>il', toggle_inlay_hint, 'Toggle Inlay Hint')
		end

		if client:supports_method 'textDocument/definition' then
			keymap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
		end

		if client:supports_method 'textDocument/codeAction' then
			keymap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
		end

		if client:supports_method 'textDocument/hover' then
			keymap(
				'K',
				hover_definition {
					border = 'sharp',
					title = 'hover definition',
					title_pos = 'center',
				},
				'Hover Documentation'
			)
		end

		if client:supports_method 'textDocument/references' then
			keymap('<leader>lr', vim.lsp.buf.references, '[L]sp [R]eferences')
		end

		if client:supports_method 'textDocument/rename' then
			keymap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
		end

		if client:supports_method 'textDocument/signatureHelp' then
			keymap('<C-k>', vim.lsp.buf.signature_help, 'Signature Help')
		end

		if client.server_capabilities.documentHighlightProvider then
			vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
				buffer = args.buf,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
				buffer = args.buf,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end,
})
