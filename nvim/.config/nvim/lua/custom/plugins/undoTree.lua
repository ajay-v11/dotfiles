return {
  {
    'mbbill/undotree',
    keys = {
      { '<leader>u', '<cmd>UndotreeToggle<CR>', desc = 'Toggle Undo Tree' },
    },
    config = function()
      -- UndoTree configuration
      vim.g.undotree_WindowLayout = 2 -- Layout: undotree on left, diff on right
      vim.g.undotree_SplitWidth = 30 -- Width of the undotree window
      vim.g.undotree_DiffpanelHeight = 10 -- Height of the diff panel
      vim.g.undotree_SetFocusWhenToggle = 1 -- Focus undotree when opened
      vim.g.undotree_ShortIndicators = 1 -- Use short time indicators
      vim.g.undotree_HighlightChangedText = 1 -- Highlight changed text in diff
      vim.g.undotree_HighlightSyntaxAdd = "DiffAdd" -- Highlight for additions
      vim.g.undotree_HighlightSyntaxChange = "DiffChange" -- Highlight for changes
      vim.g.undotree_HighlightSyntaxDel = "DiffDelete" -- Highlight for deletions
      
      -- Show relative timestamps instead of absolute
      vim.g.undotree_RelativeTimestamp = 1
      
      -- Automatically save undo history when switching buffers
      vim.g.undotree_HelpLine = 0 -- Hide the help line to save space
      
      -- Custom keymaps for better UndoTree navigation (when UndoTree is focused)
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'undotree',
        callback = function()
          local opts = { buffer = true, silent = true }
          -- Quick navigation
          vim.keymap.set('n', '<C-j>', '5j', opts)
          vim.keymap.set('n', '<C-k>', '5k', opts)
          -- Jump to specific points
          vim.keymap.set('n', 'J', 'G', opts) -- Jump to bottom (newest)
          vim.keymap.set('n', 'K', 'gg', opts) -- Jump to top (oldest)
          -- Quick apply and close
          vim.keymap.set('n', '<CR>', '<CR><cmd>UndotreeHide<CR>', opts)
        end,
      })
    end,
  }
}