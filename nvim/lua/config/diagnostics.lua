-- local variable to handle show error only diagnostics
local show_errors = false

-- Filter function to show only errors
local filter_diagnostics = function(diagnostic)
    return diagnostic.severity == vim.diagnostic.severity.ERROR
end

-- show only error diagnostic
local show_only_error = function()
    show_errors = not show_errors
    -- Custom handler to filter out non-error diagnostics
    local original_handler = vim.diagnostic.handlers.virtual_text
    vim.diagnostic.handlers.virtual_text = {
        show = function(namespace, bufnr, diagnostics, opts)
            if show_errors then
                diagnostics = vim.tbl_filter(filter_diagnostics, diagnostics)
            end
            original_handler.show(namespace, bufnr, diagnostics, opts)
        end,
        hide = original_handler.hide,
    }
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        vim.diagnostic.hide(nil, bufnr)
        vim.diagnostic.show(nil, bufnr)
    end
    if show_errors then
        vim.notify("error only on!", vim.log.levels.INFO)
    else
        vim.notify("error only off!", vim.log.levels.INFO)
    end
end

-- toggle diagnostic levels
local toggle_diag = function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
    if vim.diagnostic.is_enabled() then
        vim.notify("diagnostic turned on!", vim.log.levels.INFO)
    else
        vim.notify("diagnostic turned off!", vim.log.levels.INFO)
    end
end

vim.keymap.set("n", "<leader>xd", toggle_diag, {
    noremap = true,
    silent = true,
    desc = "toggle vim diagnostics"
})
vim.keymap.set("n", "<leader>xe", show_only_error, {
    noremap = true,
    silent = true,
    desc = "toggle show only errors"
})
