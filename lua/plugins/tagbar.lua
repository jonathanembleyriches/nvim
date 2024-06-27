
return {
    'preservim/tagbar',

    config = function()
        --- you still need to specify if its a wword or what not. i.e. leader saiw"
        ---
        vim.keymap.set('n', '<leader>tbt', ':TagbarToggle<CR>', { noremap = true, silent = true })
    end
}
