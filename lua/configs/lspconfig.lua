-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local map = vim.keymap.set

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

require("java").setup()
require("lspconfig").jdtls.setup {}

-- NVIM-JAVA CONFIG
map("n", "<Leader>jr", function()
  require("java").runner.built_in.run_app {}
end, { desc = "Run java app" })
map("n", "<Leader>js", function()
  require("java").runner.built_in.stop_app()
end, { desc = "Stop java app" })
map("n", "<Leader>jt", function()
  require("java").runner.built_in.toggle_logs()
end, { desc = "Toggle java logs" })

-- SETUP MASON LSP CONFIG

local mason_lspconfig = require "mason-lspconfig"
mason_lspconfig.setup {
  ensure_installed = {
    "tsserver",
  },
}

-- JAVA REFACTORING
require("simaxme-java").setup {
  rename = {
    enable = true, -- enable the functionality for renaming java files
    nvimtree = true, -- enable nvimtree integration
    write_and_close = true, -- automatically write and close modified (previously unopened) files after refactoring a java file
  },
  snippets = {
    enable = true, -- enable the functionality for java snippets
  },
  root_markers = { -- markers for detecting the package path (the package path should start *after* the marker)
    "main/java/",
    "src/main/java/",
    "test/java/",
    "src/test/java/",
  },
}
