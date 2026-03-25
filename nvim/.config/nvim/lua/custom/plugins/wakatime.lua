return {
  'wakatime/vim-wakatime',
  lazy = false, -- load on startup
  init = function()
    -- Optional: Log or notify WakaTime loaded
    vim.notify('WakaTime loaded', vim.log.levels.INFO)
  end,
}
