local function highlight_all()
	local function highlight(name, value) vim.api.nvim_set_hl(0, name, value) end

	-- CUSTOM HIGHLIGHTS
	highlight('Visual', { reverse = true })
	highlight('Search', { bg = '#2a324a' })
	highlight('CurSearch', { reverse = true })
	highlight('IncSearch', { reverse = true })
	highlight('CursorLine', { bg = '#2a324a' })
	highlight('CursorColumn', { bg = '#2a324a' })

	-- TELESCOPE HIGHLIGHTS
	highlight('TelescopeTitle', { reverse = true })
	highlight('TelescopePromptCounter', { fg = '#34bfd0' })

	-- LAZY HIGHLIGHTS
	highlight('LazyNormal', { blend = 0, link = 'none' })
	highlight('LazyProp', { blend = 0, link = 'none' })
	highlight('LazyDimmed', { blend = 0, link = 'none' })

	-- TREESITTER-CONTEXT HIGHLIGHTS
	highlight('TreesitterContext', { blend = 0, link = 'none' })
	highlight('TreesitterContextBottom', { underdotted = true })
	highlight(
		'TreesitterContextLineNumberBottom',
		{ fg = '#93a4c3', underdotted = true }
	)

	-- GIT HIGHLIGHTS
	highlight('GitSignsUntracked', { fg = '#34bfd0' })
	highlight('GitSignsUntrackedLn', { fg = '#34bfd0' })
	highlight('GitSignsUntrackedNr', { fg = '#34bfd0' })
	highlight('DiffAdd', { fg = '#03C988', bg = '#d6ffd6' })
	highlight('DiffDelete', { fg = '#FC2947', bg = '#ffeeee' })

	-- FLOATING WINDOW HIGHLIGHT
	highlight('FloatBorder', { blend = 0 })
	highlight('NormalFloat', { blend = 0 })

	-- VIM-DADBOD-UI HIGHLIGHTS
	highlight('NotificationError', { blend = 0, fg = '#f65866' })

	-- TROUBLE HIGHLIGHTS
	highlight('TroublePreview', { reverse = true })

	-- FUGITIVE HIGHLIGHTS
	highlight('fugitiveHeader', { link = 'diffLine' })
	highlight('fugitiveSymbolicRef', { link = 'diffCommon' })
	highlight('fugitiveStagedHeading', { link = 'diffAdded' })
	highlight('fugitiveStagedModifier', { link = 'diffAdded' })
	highlight('fugitiveUntrackedHeading', { link = 'diffFile' })
	highlight('fugitiveUntrackedModifier', { link = 'diffFile' })
	highlight('fugitiveUnstagedHeading', { link = 'diffChanged' })
	highlight('fugitiveUnstagedModifier', { link = 'diffChanged' })
end

highlight_all()

vim.api.nvim_create_autocmd('ColorScheme', {
	group = vim.api.nvim_create_augroup('CustomHighlights', { clear = true }),
	callback = highlight_all,
})
