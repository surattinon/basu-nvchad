local alpha = require "alpha"
local dashboard = require "alpha.themes.dashboard"

-- Set header
dashboard.section.header.val = {
  "                                       ",
  "                                       ",
  "███╗    ██╗   ██╗██╗███╗   ███╗    ███╗",
  "██╔╝    ██║   ██║██║████╗ ████║    ╚██║",
  "██║     ██║   ██║██║██╔████╔██║     ██║",
  "██║     ╚██╗ ██╔╝██║██║╚██╔╝██║     ██║",
  "███╗     ╚████╔╝ ██║██║ ╚═╝ ██║    ███║",
  "╚══╝      ╚═══╝  ╚═╝╚═╝     ╚═╝    ╚══╝",

  "███████  BASU = () => CODE EAT SLEEP 🤪",
  "                                       ",
  "                                       ",
}

-- Set menu
dashboard.section.buttons.val = {
  dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
  dashboard.button("t", "  > Find text", ":Telescope live_grep<CR>"),
  dashboard.button("z", "  > Lazy", ":Lazy<CR>"),
  dashboard.button("q", "󰈆  > Quit NVIM", ":qa<CR>"),
}

alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd [[
    autocmd FileType alpha setlocal nofoldenable
]]

vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    math.randomseed(os.time())
    local fg_color = tostring(math.random(0, 12))
    local hi_setter = "hi AlphaHeader ctermfg="
    vim.cmd(hi_setter .. fg_color)
  end,
})
