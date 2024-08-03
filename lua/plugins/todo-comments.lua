return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    require("todo-comments").setup {}
    vim.keymap.set("n", "<leader>#n", function()
      require("todo-comments").jump_next()
    end, { desc = "Next todo comment" })

    vim.keymap.set("n", "<leader>#p", function()
      require("todo-comments").jump_prev()
    end, { desc = "Previous todo comment" })

    -- You can also specify a list of valid jump keywords
    vim.keymap.set("n", "]e", function()
      require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
    end, { desc = "Next error/warning todo comment" })
  end
}
