return {
  {

    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvimtools/none-ls-extras.nvim", },
    config = function()
    -- Function to find the root directory
     local lspconfig_util = require("lspconfig.util")
      local function get_root_dir()
  local root_files = {".clang-format", ".git", "compile_commands.json", "compile_flags.txt", "CMakeLists.txt"}
  local root_dir = lspconfig_util.root_pattern(unpack(root_files))(vim.fn.expand("%:p")) or vim.fn.getcwd()
  print("Using root directory: " .. root_dir)
  return root_dir
end
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
        null_ls.builtins.formatting.clang_format.with({
            extra_args = function(params)
              local root = get_root_dir()
              return { "--style=file", "--assume-filename=" .. root .. "/.clang-format" }
            end,
          }),
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.mypy,
          require("none-ls.formatting.ruff"),
          
        },
      })

      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
  }
}
