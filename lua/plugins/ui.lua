return {
  -- ALPHA DASHBOARD
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    priority = 1000,
    lazy = true,
    opts = {
      position = "center",
    },
    config = function()
      require "configs.dashboard"
    end,
  },

  -- NOCIE
  {
    "folk/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require "configs.noice"
    end,
  },
}
