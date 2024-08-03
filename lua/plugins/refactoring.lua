-- Configure Lazy.nvim to load the refactoring.nvim plugin
  -- Specify the refactoring.nvim plugin and its dependencies
return  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      -- Call the setup function for refactoring.nvim with desired configurations
      require('refactoring').setup({
        -- Customize your configuration options here
        prompt_func_return_type = {
          go = true,
          cpp = true,
          c = true,
          java = true,
        },
        prompt_func_param_type = {
          go = true,
          cpp = true,
          c = true,
          java = true,
        },
        printf_statements = {},
        print_var_statements = {},
        show_success_message = false,
      })

      -- Keybindings for refactoring operations
      local opts = { noremap = true, silent = true, expr = false }
      vim.keymap.set("x", "<leader>re", function() require('refactoring').refactor('Extract Function') end, opts)
      vim.keymap.set("x", "<leader>rf", function() require('refactoring').refactor('Extract Function To File') end, opts)
      vim.keymap.set("x", "<leader>rv", function() require('refactoring').refactor('Extract Variable') end, opts)
      vim.keymap.set({ "n", "x" }, "<leader>ri", function() require('refactoring').refactor('Inline Variable') end, opts)
      vim.keymap.set("n", "<leader>rI", function() require('refactoring').refactor('Inline Function') end, opts)
      vim.keymap.set("n", "<leader>rb", function() require('refactoring').refactor('Extract Block') end, opts)
      vim.keymap.set("n", "<leader>rbf", function() require('refactoring').refactor('Extract Block To File') end, opts)

      -- Keybindings for debug operations
      vim.keymap.set("n", "<leader>rp", function() require('refactoring').debug.printf({ below = false }) end, opts)
      vim.keymap.set({ "x", "n" }, "<leader>rpv", function() require('refactoring').debug.print_var() end, opts)
      vim.keymap.set("n", "<leader>rc", function() require('refactoring').debug.cleanup({}) end, opts)

      -- Additional keybinding to prompt for a refactor operation
      vim.keymap.set({ "n", "x" }, "<leader>rr", function() require('refactoring').select_refactor() end, opts)
    end,
  }
