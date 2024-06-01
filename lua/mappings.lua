require "nvchad.mappings"

local map = vim.keymap.set
local silent = { noremap = true, silent = true }

------------------- Default NvChad -------------------
map("n", ";", ":", { desc = "CMD enter command mode" }) -- CMDLINE
map("i", "jk", "<ESC>") -- EXIT INSERT WITH "jk"
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>") -- SAVE WITH CTRL + S

------------------- CUSTOM KEYBINDS -------------------
-- SPLIT WINDOW
map("n", "ss", ":split<CR>:Telescope find_files<CR>", silent)
map("n", "sv", ":vsplit<CR>:Telescope find_files<CR>", silent)

-- RESIZE WINDOW
map("n", "<C-w><left>", "<C-w><")
map("n", "<C-w><right>", "<C-w>>")
map("n", "<C-w><up>", "<C-w>+")
map("n", "<C-w><down>", "<C-w>-")

-- TMUX NAVIGATOR
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", silent)
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", silent)
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", silent)
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", silent)

-------------------- CUSTOM TERM ----------------------
-- HORIZONTAL TERM TOGGLE
map({ "n", "t" }, "<C-t>", function()
  require("nvchad.term").toggle {
    pos = "sp",
    id = "hTerm",
  }
end)

-- FLOAT LAZYGIT
map({ "n", "t" }, "<A-g>", function()
  require("nvchad.term").toggle {
    pos = "float",
    float_opts = {
      row = 0.05,
      col = 0.10,
      width = "0.8",
      height = "0.8",
      border = "double",
    },
    id = "lazygit",
    cmd = "lazygit",
  }
end)
