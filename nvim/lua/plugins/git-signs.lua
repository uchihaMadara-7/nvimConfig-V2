return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
            end

            -- Navigation
            map("n", "]h", gs.next_hunk, "next hunk")
            map("n", "[h", gs.prev_hunk, "prev hunk")

            -- Actions
            map("n", "<leader>he", gs.stage_hunk, "stage hunk")
            map("n", "<leader>hy", gs.reset_hunk, "reset hunk")
            map("v", "<leader>he",
                function()
                    gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end,
                "stage hunk"
            )
            map("v", "<leader>hy",
                function()
                    gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end,
                "reset hunk"
            )
            map("n", "<leader>hE", gs.stage_buffer, "stage buffer")
            map("n", "<leader>hY", gs.reset_buffer, "reset buffer")
            map("n", "<leader>hu", gs.undo_stage_hunk, "undo stage hunk")
            map("n", "<leader>ht", gs.preview_hunk, "preview hunk")
            map("n", "<leader>hb",
                function()
                    gs.blame_line({ full = true })
                end,
                "blame line"
            )
            map("n", "<leader>hB", gs.toggle_current_line_blame, "toggle line blame")
            map("n", "<leader>hd", gs.diffthis, "diff this")
            map("n", "<leader>hD",
                function()
                    gs.diffthis("~")
                end,
                "Diff this ~"
            )

            -- Text object
            map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "gitsigns select hunk")
        end,
    },
}
