-- plugins/mason.lua:
return {
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            -- list of lsp servers for mason to install
            ensure_installed = {
                "lua_ls",
                "clangd",
                "pyright",
                "jsonls",
            }
        }
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "pylint",
                "cpplint",
                "shellcheck",
            },
        },
    },
}
