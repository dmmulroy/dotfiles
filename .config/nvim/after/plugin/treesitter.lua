require("nvim-treesitter.configs").setup({
  ensure_installed = { 
    "lua",
    "javascript",
    "typescript",
    "json",
    "tsx",
    "css",
    "prisma",
    "markdown",
    "ocaml",
    "yaml",
    "vim",
    "graphql",
    "help",
  },
  sync_install = false,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})

