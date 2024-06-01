require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- CUSTOM TERM
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

-- TMUX NAVIGATOR
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", {})
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", {})
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", {})
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", {})
