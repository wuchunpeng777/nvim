return {
    'mbbill/undotree',
    event = 'BufEnter',
    vim.keymap.set('n', '<leader>ud', vim.cmd.UndotreeToggle)
}
