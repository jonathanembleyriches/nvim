return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },{
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {},
  config = function(_, opts) require'lsp_signature'.setup(opts) end
},
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      local root_pattern = lspconfig.util.root_pattern
      local util = require("lspconfig.util")
      lspconfig.tsserver.setup({
        capabilities = capabilities
      })
      lspconfig.solargraph.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.pyright.setup({
        capabilities = capabilities
      })
      lspconfig.ruff_lsp.setup({

        capabilities = capabilities
      })
       lspconfig.clangd.setup({

        capabilities = capabilities,
         on_attach = function(client, bufnr)
          -- Enable lsp_signature
          require "lsp_signature".on_attach({
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            handler_opts = {
              border = "rounded"
            }
          }, bufnr)
        end,
        cmd = { "clangd", "--background-index" },
        init_options = {
          fallbackFlags = { "-std=c++17" }
        },
        root_dir = function(fname)
    local root = util.root_pattern(".git", "compile_commands.json", "compile_flags.txt", "CMakeLists.txt", ".clang-format")(fname)
    print("Root directory for clangd: ", root)  -- Debugging line
    return root
  end,
  
  
   settings = {
    clangd = {
      completion = {
        detailedLabel = true,
        enableSnippets = true,
      },
      semanticHighlighting = true,
    },
    
  }
        --root_dir = root_pattern(".git", "compile_commands.json", "compile_flags.txt", "CMakeLists.txt", ".clang-format")

         
      })


      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>gh", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>gj", function()
        require("telescope.builtin").lsp_references()
      end, { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", {})
    end,
  },
}
