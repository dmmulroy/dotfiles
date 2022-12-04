local nmap = require("user.keymap_utils").nmap

require("telescope").setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
    },
  },
})

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

-- telescope keybinds
nmap('<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
nmap('<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
nmap('<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
nmap('<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
nmap('<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
nmap('<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
nmap('<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

nmap('<leader>sc', function()
  require('telescope.builtin').commands(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = '[S]earch [C]ommands' })

nmap('<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = '[/] Fuzzily search in current buffer]' })

nmap('<leader>ss', function()
  require('telescope.builtin').spell_suggest(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = '[S]earch [S]pelling suggestions' })
