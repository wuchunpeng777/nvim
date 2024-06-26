return { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {'nvim-lua/plenary.nvim',
                    { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        -- build = 'make',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
            return vim.fn.executable 'make' == 1
        end
    }, {'nvim-telescope/telescope-ui-select.nvim'}, -- Useful for getting pretty icons, but requires a Nerd Font.
    {
        'nvim-tree/nvim-web-devicons',
        enabled = vim.g.have_nerd_font
    }},
    keys = {
        {'<leader>fg','<cmd>lua require("telescopePickers").prettyWorkspaceSymbols({})<cr>'},
        {"<leader>fc",   "<cmd>lua require('telescope.builtin').lsp_document_symbols({show_line=true,symbols='method'})<cr>"},
        {'<leader>ff','<cmd>lua require("telescopePickers").prettyFilesPicker({picker="find_files"})<cr>'},
        {'<leader>fr','<cmd>lua require("telescopePickers").prettyFilesPicker({picker="oldfiles"})<cr>'},
        {'<leader><leader>','<cmd>lua require("telescopePickers").prettyBuffersPicker()<cr>'},
        {'<leader>fs','<cmd>lua require("telescopePickers").prettyGrepPicker({picker="live_grep"})<cr>'},
        {'<leader>fd','<cmd>Telescope current_buffer_fuzzy_find<cr>'},
        {'gr','<cmd>Telescope lsp_references<cr>'},
        },
    config = function()
        -- Telescope is a fuzzy finder that comes with a lot of different things that
        -- it can fuzzy find! It's more than just a "file finder", it can search
        -- many different aspects of Neovim, your workspace, LSP, and more!
        --
        -- The easiest way to use Telescope, is to start by doing something like:
        --  :Telescope help_tags
        --
        -- After running this command, a window will open up and you're able to
        -- type in the prompt window. You'll see a list of `help_tags` options and
        -- a corresponding preview of the help.
        --
        -- Two important keymaps to use while in Telescope are:
        --  - Insert mode: <c-/>
        --  - Normal mode: ?
        --
        -- This opens a window that shows you all of the keymaps for the current
        -- Telescope picker. This is really useful to discover what Telescope can
        -- do as well as how to actually do it!
        -- [[ Configure Telescope ]]

        -- See `:help telescope` and `:help telescope.setup()`
        require('telescope').setup {
            -- You can put your default mappings / updates / etc. in here
            --  All the info you're looking for is in `:help telescope.setup()`
            --
            -- pickers = {}
            defaults = {
                layout_strategy = 'vertical',
              mappings = {
i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      }
              },
            },
            extensions = {
                ['ui-select'] = {require('telescope.themes').get_dropdown()}
            }
        }

        -- Enable Telescope extensions if they are installed
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')
        pcall(require('telescope').load_extension,'bookmarks')
        pcall(require('telescope').load_extension,'yank_history')

        -- See `:help telescope.builtin`
        local builtin = require 'telescope.builtin'
        -- vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
        -- vim.keymap.set('n', '<leader>fk', builtin.keymaps, {
        --     desc = '[S]earch [K]eymaps'
        -- })
        -- vim.keymap.set('n', '<leader>ff', builtin.find_files, {
        --     desc = '[S]earch [F]iles'
        -- })

        -- vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
        -- vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
        -- vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
        -- vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })

        -- Slightly advanced example of overriding default behavior and theme

        -- It's also possible to pass additional configuration options.
        --  See `:help telescope.builtin.live_grep()` for information about particular keys
        -- vim.keymap.set('n', '<leader>s/', function()
        --   builtin.live_grep {
        --     grep_open_files = true,
        --     prompt_title = 'Live Grep in Open Files',
        --   }
        -- end, { desc = '[S]earch [/] in Open Files' })

        -- Shortcut for searching your Neovim configuration files
        -- vim.keymap.set('n', '<leader>sn', function()
        --   builtin.find_files { cwd = vim.fn.stdpath 'config' }
        -- end, { desc = '[S]earch [N]eovim files' })
    end
}
