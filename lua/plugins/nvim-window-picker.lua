return {
  's1n7ax/nvim-window-picker',
  name = 'window-picker',
  event = 'VeryLazy',
  version = '2.*',
  config = function()
    require 'window-picker'.setup({
      hint = 'floating-big-letter',
      filter_rules = {
        include_current_win = true,
        autoselect_one = false,
      }
    })

    --vim.keymap.set("n", "<Leader>pw", require("window-picker").pick_window, {})
    local function selectAndSwapWindow()
      local choice = require("window-picker").pick_window({ hint = 'floating-big-letter' })


      vim.api.nvim_set_current_win(choice)
    end
    vim.keymap.set("n", "<Leader>pw", selectAndSwapWindow, {})
  end,
}
