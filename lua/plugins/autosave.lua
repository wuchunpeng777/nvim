return {
    "okuuva/auto-save.nvim",
    config = function()
        require("auto-save").setup {
            -- your config goes here
            -- or just leave it empty :)
            execution_message = {
                enabled = false,
                message = function() -- message to print on save
                    return ''
                end,
                dim = 0.18,   -- dim the color of `message`
                cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
            },
            debounce_delay = 50
        }
    end
}
