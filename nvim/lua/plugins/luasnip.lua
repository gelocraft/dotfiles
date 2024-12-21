return {
	'L3MON4D3/LuaSnip',
	-- enabled = false,
	-- lazy = true,
	keys = function()
		-- local luasnip = require 'luasnip'
		local expand = function() require('luasnip').expand() end
		local change_choice = function()
			if require('luasnip').choice_active() then
				require('luasnip').change_choice(1)
			end
		end
		return {
			{ '<C-space>', mode = 'i', expand },
			{ '<C-e>', mode = { 'i', 's' }, change_choice },
		}
	end,
	config = function()
		-- local luasnip = require 'luasnip'
		local extras = require 'luasnip.extras'
		local format = require 'luasnip.extras.fmt'
		require('luasnip').add_snippets(
			'systemd',
			require 'snippets.systemd'(require 'luasnip')
		)
		require('luasnip').add_snippets(
			'all',
			require 'snippets.all'(require 'luasnip', format, extras)
		)
		require('luasnip').add_snippets(
			'yaml',
			require 'snippets.yaml'(require 'luasnip', format, extras)
		)
		require('luasnip').add_snippets(
			'nginx',
			require 'snippets.nginx'(require 'luasnip', format)
		)
		require('luasnip').add_snippets(
			'sql',
			require 'snippets.sql'(require 'luasnip', format, extras)
		)
		require('luasnip').add_snippets(
			'lua',
			require 'snippets.lua'(require 'luasnip', format, extras)
		)
		require('luasnip').add_snippets(
			'cs',
			require 'snippets.csharp'(require 'luasnip', format, extras)
		)
		require('luasnip').add_snippets(
			'python',
			require 'snippets.python'(require 'luasnip', format, extras)
		)
		require('luasnip').add_snippets(
			'javascript',
			require 'snippets.javascript'(require 'luasnip', format)
		)
		require('luasnip').add_snippets(
			'dockerfile',
			require 'snippets.dockerfile'(require 'luasnip', format)
		)
		require('luasnip').add_snippets(
			'editorconfig',
			require 'snippets.editorconfig'(require 'luasnip', format)
		)
		require('luasnip').add_snippets(
			'terraform',
			require 'snippets.terraform'(require 'luasnip', format, extras)
		)
	end,
}
