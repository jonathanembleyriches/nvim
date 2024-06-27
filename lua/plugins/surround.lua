
return {
    'tpope/vim-surround',

    dependencies = { 'tpope/vim-repeat' },

    config = function()
        --- you still need to specify if its a wword or what not. i.e. leader saiw"
vim.keymap.set('n', '<leader>sc', ':<C-u>call feedkeys("cs")<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sd', ':<C-u>call feedkeys("ds")<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sa', ':<C-u>call feedkeys("ys")<CR>', { noremap = true, silent = true })
vim.keymap.set('x', '<leader>sa', ':<C-u>call feedkeys("S")<CR>', { noremap = true, silent = true })
    end
}
