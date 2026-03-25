-- Save this file as: lua/plugins/autoclose.lua
-- Enables auto-closing pairs and auto-tag for HTML/JSX/TSX in LazyVim

return {
  -- Auto pairs ((), {}, "", etc.) with Treesitter awareness and cmp integration
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      check_ts = true,
      fast_wrap = { map = '<M-e>' },
    },
    config = function(_, opts)
      local npairs = require 'nvim-autopairs'
      npairs.setup(opts)

      -- Integrate with nvim-cmp if available
      local ok, cmp = pcall(require, 'cmp')
      if ok then
        local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
      end
    end,
  },
}
