-- plugins/harpoon.lua:
return {
    "ThePrimeagen/harpoon",
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = true,
    keys = {
        { "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "mark file with harpoon" },
        { "<leader>hr", "<cmd>lua require('harpoon.mark').rm_file()<cr>", desc = "remove file with harpoon" },
        { "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "go to next harpoon mark" },
        { "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "go to previous harpoon mark" },
        { "<leader>hs", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "show harpoon marks" },
        { "<leader>h1", "<cmd> lua require('harpoon.ui').nav_file(1)<cr>", desc = "file 1" },
        { "<leader>h2", "<cmd> lua require('harpoon.ui').nav_file(2)<cr>", desc = "file 2" },
        { "<leader>h3", "<cmd> lua require('harpoon.ui').nav_file(3)<cr>", desc = "file 3" },
        { "<leader>h4", "<cmd> lua require('harpoon.ui').nav_file(4)<cr>", desc = "file 4" },
        { "<leader>h5", "<cmd> lua require('harpoon.ui').nav_file(4)<cr>", desc = "file 5" },
        { "<leader>h6", "<cmd> lua require('harpoon.ui').nav_file(4)<cr>", desc = "file 6" },
        { "<leader>h7", "<cmd> lua require('harpoon.ui').nav_file(4)<cr>", desc = "file 7" },
        { "<leader>h8", "<cmd> lua require('harpoon.ui').nav_file(4)<cr>", desc = "file 8" },
        { "<leader>h9", "<cmd> lua require('harpoon.ui').nav_file(4)<cr>", desc = "file 9" },
    },
}
