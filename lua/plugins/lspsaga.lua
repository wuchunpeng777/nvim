return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({
  vim.keymap.set('n','<leader>ot','<cmd>Lspsaga outline<cr>',{silent = true})
        })
    end,
    dependencies = {'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons' -- optional
    }
}
