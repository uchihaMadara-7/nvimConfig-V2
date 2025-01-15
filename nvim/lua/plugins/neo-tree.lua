-- plugins/neo-tree.lua:
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- Optional image support in preview window: See `# Preview Mode` for more information
        -- "3rd/image.nvim",
    },
    keys = {
        -- toggle the file-explorer
        {
            "<leader>ee", "<cmd>Neotree filesystem reveal left toggle<cr>",
            desc = "toggle file-explorer left"
        },
        {
            "<leader>ef", "<cmd>Neotree filesystem reveal float toggle<cr>",
            desc = "toggle file-explorer center"
        },
    },
    init = function()
        vim.api.nvim_create_autocmd('BufEnter', {
            -- make a group to be able to delete it later
            group = vim.api.nvim_create_augroup('NeoTreeInit', {clear = true}),
            callback = function()
                local f = vim.fn.expand('%:p')
                local escaped_f = vim.fn.fnameescape(f)
                if vim.fn.isdirectory(f) ~= 0 then
                    vim.cmd('Neotree current dir=' .. escaped_f)
                    -- neo-tree is loaded now, delete the init autocmd
                    vim.api.nvim_clear_autocmds{group = 'NeoTreeInit'}
                end
            end
        })
        -- FIX: use `autocmd` for lazy-loading neo-tree instead of directly requiring it,
        -- because `cwd` is not set up properly.
        -- vim.api.nvim_create_autocmd("BufEnter", {
        --     group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
        --     desc = "Start Neo-tree with directory",
        --     once = true,
        --     callback = function()
        --         if package.loaded["neo-tree"] then
        --             return
        --         else
        --             local stats = vim.uv.fs_stat(vim.fn.argv(0))
        --             if stats and stats.type == "directory" then
        --                 require("neo-tree")
        --             end
        --         end
        --     end,
        -- })
    end,
    opts = {
        window = {
            width = 40,
        },
        default_component_configs = {
            indent = {
                indent_size = 2,
                indent_marker = "┊",
                highlight = "NeoTreeDimText",
            },
            modified = {
                symbol = "[+]",
                highlight = "NeoTreeModified",
            },
            name = {
                trailing_slash = false,
                use_git_status_colors = true,
                highlight = "NeoTreeFileName",
            },
            file_size = {
                enabled = true,
                width = 12, -- width of the column
                required_width = 40, -- min width of window required to show this column
            },
            type = {
                enable = true,
                width = 12,
                required_width = 52,
            },
            last_modified = {
                enabled = true,
                width = 20, -- width of the column
                required_width = 72, -- min width of window required to show this column
            },
            created = {
                enabled = true,
                width = 20, -- width of the column
                required_width = 92, -- min width of window required to show this column
            },
        },
        filesystem = {
            hijack_netrw_behavior = "open_current",
        },
    },
}
