-- plugins/lualine.lua:

-- function to generate custom theme
local get_lualine_theme = function()
    -- defining color palattes
    local colors = {
        blue        = "#65D1FF",
        green       = "#3EFFDC",
        violet      = "#FF61EF",
        yellow      = "#FFDA7B",
        red         = "#FF4A4A",
        fg          = "#c3ccdc",
        bg          = "#112638",
        inactive_bg = "#2c3043",
    }
    -- creating theme out of colors
    local my_lualine_theme = {
        normal = {
            a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
            b = { bg = colors.bg, fg = colors.fg },
            c = { bg = colors.bg, fg = colors.fg },
        },
        insert = {
            a = { bg = colors.red, fg = colors.bg, gui = "bold" },
            b = { bg = colors.bg, fg = colors.fg },
            c = { bg = colors.bg, fg = colors.fg },
        },
        visual = {
            a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
            b = { bg = colors.bg, fg = colors.fg },
            c = { bg = colors.bg, fg = colors.fg },
        },
        command = {
            a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
            b = { bg = colors.bg, fg = colors.fg },
            c = { bg = colors.bg, fg = colors.fg },
        },
        replace = {
            a = { bg = colors.green, fg = colors.bg, gui = "bold" },
            b = { bg = colors.bg, fg = colors.fg },
            c = { bg = colors.bg, fg = colors.fg },
        },
        inactive = {
            a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
            b = { bg = colors.inactive_bg, fg = colors.semilightgray },
            c = { bg = colors.inactive_bg, fg = colors.semilightgray },
        },
    }
    -- returning the lualine theme created
   return my_lualine_theme
end

local harpoon_component = function()
    local harpoon = require("harpoon.mark")
    local total_marks = harpoon.get_length()
    if total_marks == 0 then
        return ""
    end
    local current_mark = "—"
    local mark_idx = harpoon.get_current_index()
    if mark_idx ~= nil then
        current_mark = tostring(mark_idx)
    end
    return string.format("󱡅 %s/%d", current_mark, total_marks)
end

local lazy_status = function()
    return require("lazy.status")
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    opts = {
        options = {
            theme = get_lualine_theme(),
        },
        sections = {
            lualine_b = {
                { "branch", icon = "" },
                harpoon_component,
                "diff",
                "diagnostics",
            },
            lualine_c = {
                { "hostname" },
                { "filename", path = 1 },
                { "filesize" },
            },
            lualine_x = {
                {
                    lazy_status().updates,
                    cond = lazy_status().has_updates,
                    color = { fg = "#ff9e64" },
                },
                { "encoding" },
                { "fileformat" },
                { "filetype" },
                { "searchcount" },
            },
        },
    }
}
