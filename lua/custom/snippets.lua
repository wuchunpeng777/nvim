local ls = require('luasnip')
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local date = function()
    return {os.date('%Y-%m-%d')}
end

return {
    all = {
        snip(
            {
                trig = "date",
                namr = "Date",
                dscr = "Date in the form of YYYY-MM-DD"
            },
            {
                func(date, {})
            }
        )
    },
    lua = {
        snip(
            {
                trig = "listen",
                name = "listen event",
                dscr = "listen event"
            },
            {
                text("self:RegisterEventListener(LuaEventKey"),
            }
        ),
        snip(
            {
                trig = "send",
                name = "send event",
                dscr = "send event"
            },
            {
                text("UE.UEventBPLib.SendEvent(BP_GameInstance_Inst, LuaEventKey"),
            }
        ),
    }
}
