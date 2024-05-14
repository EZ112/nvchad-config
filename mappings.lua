local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
  },
}

M.git_fugitive = {
  n = {
    ["<leader>gd"] = { ":Gvdiffsplit! <CR>", "Git Diff" },
    ["<leader>gb"] = { ":Git blame <CR>", "Git Blame" },
  },
}

M.telescope = {
  n = {
    ["<leader>fi"] = { ":Telescope media_files <CR>", "Find Media Files" },
  },
}

-- local mark = require "harpoon.mark"
-- local ui = require "harpoon.ui"

M.harpoon = {
  n = {
    ["<leader>a"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "harpoon add file",
    },
    ["<C-e>"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "toggle harpoon ui",
    },
    ["<C-]>"] = {
      function()
        require("harpoon.ui").nav_next()
      end,
      "nav next harpoon",
    },
    ["<C-[>"] = {
      function()
        require("harpoon.ui").nav_prev()
      end,
      "nav prev harpoon",
    },
  },
}

M.dad_bod = {
  n = {
    ["D"] = { ":DBUIToggle <CR>", "Toggle DBUI" },
  },
}

M.window_split = {
  n = {
    ["<leader>sv"] = { ":vsp<CR>", "Windows Split Vertical" },
    ["<leader>sh"] = { ":sp<CR>", "Windows Split Horizontal" },
  },
}

return M
