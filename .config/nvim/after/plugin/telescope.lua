pcall(require('telescope').load_extension, 'fzf') -- Enable telescope fzf native, if installed
local ignore_files = { "target", "node_modules", "wwwroot/lib", "**/Debug", "**.cache", "**/assets", "**.png", "**.svg",
  "**.favicon.*", "**.gif", "**.jpg", "**.jpeg", "**.mp4", "**.mp3", "**.pdf", "go", "**.zip", "**.tar.gz", "**/tags",
  "**.ttf" }

require('telescope').setup {
  pickers = {
    colorscheme = {
      enable_preview = true,
      layout_config = {
        width = 0.50,
        preview_width = 0.05
      },
    },
    grep_string = {
      word_match = "-w",
    }
  },
  defaults = {
    layout_config = {
      height = 0.95,
      width = 0.95,
      preview_width = 0.55
    },
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    initial_mode = "normal",
    file_ignore_patterns = ignore_files,
  },
}

vim.keymap.set('n', '<leader>gs', require('telescope.builtin').grep_string, { desc = '[G]rep [S]tring' })
vim.keymap.set('n', '<leader>sc', require('telescope.builtin').colorscheme, { desc = '[C]hange [C]olorscheme' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })