local nmap = require("user.keymap").nmap


local on_attach = function(_, buffer_num)
  nmap('<leader>rn', vim.lsp.buf.rename, { desc = 'LSP: [R]e[n]ame', buffer = buffer_num })
  nmap('<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP: [C]ode [A]ction', buffer = buffer_num })

  nmap('gd', vim.lsp.buf.definition, { desc = 'LSP: [G]oto [D]efinition', buffer = buffer_num })
  nmap('gi', vim.lsp.buf.implementation, { desc = 'LSP: [G]oto [I]mplementation', buffer = buffer_num })
--  nmap('gr', require('telescope.builtin').lsp_references, { desc = 'LSP: [G]oto [R]eferences', buffer = buffer_num })
--  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, { desc = 'LSP: [D]ocument [S]ymbols', buffer = buffer_num })
--  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = 'LSP: [W]orkspace [S]ymbols', buffer = buffer_num })

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, { desc = 'LSP: Hover Documentation', buffer = buffer_num })
  nmap('<C-k>', vim.lsp.buf.signature_help, { desc = 'LSP: Signature Documentation', buffer = buffer_num })

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, { desc = 'LSP: [G]oto [D]eclaration', buffer = buffer_num })
  nmap('<leader>D', vim.lsp.buf.type_definition, { desc = 'LSP: Type [D]efinition', buffer = buffer_num })
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = 'LSP: [W]orkspace [A]dd Folder', buffer = buffer_num })
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = 'LSP: [W]orkspace [R]emove Folder', buffer = buffer_num })

end











