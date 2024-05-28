return {
    'dstein64/nvim-scrollview',
    event = "BufEnter",
    config = function()
        require('scrollview').setup({
            current_only = true,
        })
    end
}
