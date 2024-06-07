return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({
  vim.keymap.set('n','<leader>ot','<cmd>Lspsaga outline<cr>',{silent = true}),
--   vim.keymap.set('n','gr','<cmd>Lspsaga finder<cr>',{silent = true}),

            outline = {
    auto_preview = false
  }

        })
    end,
    dependencies = {'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons' -- optional
    }
}
