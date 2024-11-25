return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
      -- Specify the compiler for Tree-sitter parsers
      require 'nvim-treesitter.install'.compilers = { "clang" }

      -- Setup nvim-treesitter
      local config = require("nvim-treesitter.configs")

      config.setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "bash",
          "c",
          "css",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "python",
          "query",
          "racket",
          "regex",
          "rust",
          "vim",
          "vimdoc",
        },
      })
    end
  }
}
