return { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
        require("tokyonight").setup({
            transparent = true,
            tokyonight_dark_float = false,
        })

        vim.cmd.colorscheme 'tokyonight-moon'

        -- You can configure highlights by doing something like:
        vim.cmd.hi 'Normal guibg=none'
        vim.cmd.hi 'NonText guibg=none'
        vim.cmd.hi 'Normal ctermbg=none'
        vim.cmd.hi 'NonText ctermbg=none'
        vim.cmd.hi 'Visual guibg=#006400'
        vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#51B3EC', bold = true })
        vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#FB508F', bold = true })
        vim.api.nvim_set_hl(0, 'Comment', { fg = '#7FFFAA', bold = true })

    end
}
