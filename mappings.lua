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

M.auto_session = {
  n = {
    ["<leader>ss"] = { ":AutoSessionSave<CR>", "Save Session" },
    ["<leader>sd"] = { ":AutoSessionDelete<CR>", "Delete Session" },
  },
}

M.kulala = {
  n = {
    ["<leader>kr"] = { ":lua require('kulala').run()<CR>", "Run Kulala" },
    ["<leader>kcp"] = { ":lua require('kulala').copy()<CR>", "Copy Kulala" },
    ["<leader>kcl"] = { ":lua require('kulala').close()<CR>", "Close Kulala" },
    ["<leader>kt"] = { ":lua require('kulala').toggle_view()<CR>", "Toggle View Kulala" },
    ["[e"] = { ":lua require('kulala').jump_prev()<CR>", "Kulala Jump Prev" },
    ["]e"] = { ":lua require('kulala').jump_next()<CR>", "Kulala Jump Next" },
  },
}

M.markdown_preview = {
  n = {
    ["<leader>mp"] = { ":MarkdownPreviewToggle<CR>", "Toggle Markdown Preview" },
  },
}

M.dap = {
  n = {
    ["<leader>db"] = { ":lua require('dap').toggle_breakpoint()<CR>", "Debug Toggle Breakpoint" },
    ["<leader>dc"] = { ":lua require('dap').clear_breakpoint()<CR>", "Debug Clear Breakpoint" },
    ["<leader>d]"] = { ":lua require('dap').continue()<CR>", "Debug Run/Continue" },
    ["<leader>ds"] = {
      function()
        require("dap").session()
        require("dapui").open()
      end,
      "Debug New Session",
    },
    ["<leader>dt"] = {
      function()
        require("dap").terminate()
        require("dapui").close()
      end,
      "Debug Terminate",
    },
  },
}

return M
