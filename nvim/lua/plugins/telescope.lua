-- plugins/telescope.lua:

-- function to return telescope.builtin
local builtin = function()
    return require("telescope.builtin")
end

return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            -- this is fzf-native in c, faster that fzf-lua
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make"
        },
        -- nice icons in fuzzy finder window
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>ff", builtin().find_files, desc = "find files in cwd"},
        { "<leader>fr", builtin().command_history, desc = "find recent files"},
        { "<leader>fs", builtin().live_grep, desc = "find string in cwd"},
        { "<leader>fb", builtin().current_buffer_fuzzy_find, desc = "find string in current file"},
        { "<leader>fc", builtin().grep_string, desc = "find string under cursor in cwd"},
        -- { "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" }},
    },
    opts = {
        defaults = {
            path_display = { "smart" },
            mappings = {
                i = {
                    ["<esc>"] = require("telescope.actions").close,
                }
            },
        },
    },
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        telescope.load_extension("fzf")
    end,
}
