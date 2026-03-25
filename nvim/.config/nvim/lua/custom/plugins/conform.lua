-- lua/custom/plugins/conform.lua
-- Formatter configuration using conform.nvim
return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    -- Define your formatters here
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      javascriptreact = { 'prettier' },
      typescriptreact = { 'prettier' },
      css = { 'prettier' },
      html = { 'prettier' },
      json = { 'prettier' },
      yaml = { 'prettier' },
      markdown = { 'prettier' },
      python = { 'isort', 'black' },
      java = { 'google-java-format' },
      sql = { 'sql-formatter' },
      go = { 'goimports', 'gofumpt' },
    },
    -- Run formatters on save
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}

