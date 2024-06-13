return {
    'Shatur/neovim-session-manager',
    config = function()
        -- save session
        vim.keymap.set('n', '<leader>Ss', '<cmd>SessionManager save_current_session<cr>')
        -- load session
        vim.keymap.set('n', '<leader>Sl', '<cmd>SessionManager load_session<cr>')
        -- delete session
        vim.keymap.set('n', '<leader>Sd', '<cmd>SessionManager delete_session<cr>')

        local config = require('session_manager.config')

        require('session_manager').setup({
            autoload_mode = config.AutoloadMode.Disabled,
            autosave_last_session = true,
            autosave_ignore_not_normal = true,
        })
    end
}
