-- plugins/nvim-treesitter.lua:
return {
    "nvim-treesitter/nvim-treesitter",
    -- before the file's content is loaded into a buffer
    -- or a new file buffer is created
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    opts = {
        -- enable syntax highlighting
        highlight = {
            enable = true,
        },
        -- enable indentation
        indent = {
            enable = true
        },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        --[[autotag = {
            enable = true,
        },]]
        -- ensure these language parsers are installed
        ensure_installed = {
            "json",
            "markdown",
            "bash",
            "lua",
            "gitignore",
            "c",
            "cpp",
            "python"
        },
        -- automatically install syntax support when entering new file type buffer
        auto_install = true,
    },
    config = function(_, opts)
        -- import nvim-treesitter plugin
        local treesitter = require("nvim-treesitter.configs")
        -- configure treesitter
        treesitter.setup(opts)
    end,
}
