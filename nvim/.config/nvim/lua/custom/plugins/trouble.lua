-- lua/custom/plugins/trouble.lua
-- Better diagnostics and code navigation with Trouble.nvim

return {
  -- Trouble - Better diagnostics
  {
    'folke/trouble.nvim',
    opts = {
      -- Configure default keybindings within Trouble window
      keys = {
        ["<cr>"] = "jump_close", -- Enter jumps to item and closes Trouble
        ["<tab>"] = "jump_close", -- Tab also jumps and closes
        ["o"] = "jump", -- 'o' jumps to item but keeps Trouble open
        ["<c-x>"] = "jump_split", -- Open in horizontal split
        ["<c-v>"] = "jump_vsplit", -- Open in vertical split
        ["<c-t>"] = "jump_tab", -- Open in new tab
        ["q"] = "close", -- Close Trouble
        ["<esc>"] = "close", -- Also close with Escape
      },
    },
    cmd = 'Trouble',
    keys = {
      -- Main diagnostic views (auto-focus like quickfix)
      { '<leader>q', '<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>', desc = 'Buffer Diagnostics (Trouble)' },
      { '<leader>xx', '<cmd>Trouble diagnostics toggle focus=true<cr>', desc = 'Workspace Diagnostics (Trouble)' },
      
      -- Code navigation (auto-focus for better navigation)
      { '<leader>cs', '<cmd>Trouble symbols toggle focus=true<cr>', desc = '[C]ode [S]ymbols' },
      { '<leader>cl', '<cmd>Trouble lsp toggle focus=true win.position=right<cr>', desc = '[C]ode [L]SP' },
      
      -- List views (auto-focus like quickfix)
      { '<leader>xL', '<cmd>Trouble loclist toggle focus=true<cr>', desc = 'Location List (Trouble)' },
      { '<leader>xQ', '<cmd>Trouble qflist toggle focus=true<cr>', desc = 'Quickfix List (Trouble)' },
      
      -- Focus switching keybindings
      { '<C-w>t', function()
          -- Switch focus to Trouble window if it's open
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            local buf_name = vim.api.nvim_buf_get_name(buf)
            if buf_name:match("Trouble") then
              vim.api.nvim_set_current_win(win)
              return
            end
          end
        end, desc = 'Focus Trouble Window' },
      
      { '<C-w>m', function()
          -- Switch focus back to main editor window (non-Trouble window)
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            local buf_name = vim.api.nvim_buf_get_name(buf)
            if not buf_name:match("Trouble") and vim.api.nvim_buf_get_option(buf, 'buftype') == '' then
              vim.api.nvim_set_current_win(win)
              return
            end
          end
        end, desc = 'Focus Main Window' },
    },
  },
}

--[[
TROUBLE.NVIM NAVIGATION GUIDE:

=== OPENING TROUBLE ===
<leader>q     - Buffer diagnostics (current file only) - MAIN ONE TO USE
<leader>xx    - Workspace diagnostics (entire project)
<leader>cs    - Code symbols (functions, classes, variables)
<leader>cl    - LSP references/definitions (opens in right panel)
<leader>xL    - Location list in Trouble interface
<leader>xQ    - Quickfix list in Trouble interface

=== NAVIGATION INSIDE TROUBLE ===
j / ↓         - Move down to next item
k / ↑         - Move up to previous item
<Enter>       - Jump to item and CLOSE Trouble (like quickfix)
o             - Jump to item but KEEP Trouble open (for browsing)
<Tab>         - Jump to item and CLOSE Trouble (same as Enter)
<C-x>         - Open item in horizontal split
<C-v>         - Open item in vertical split
<C-t>         - Open item in new tab

=== FOCUS SWITCHING ===
<C-w>t        - Switch focus TO Trouble window
<C-w>m        - Switch focus to MAIN editor window
<C-w>w        - Cycle through all windows (standard vim)
<C-w>h/j/k/l  - Move focus by direction (standard vim)

=== FILTERING & SEARCH ===
/             - Start filtering items
<Esc>         - Clear filter
<C-c>         - Clear filter (alternative)

=== CLOSING TROUBLE ===
q             - Close Trouble window
<Esc>         - Close Trouble window (alternative)
:q            - Close Trouble window (vim command)

=== HELP ===
?             - Show help with all available keybindings
:h trouble    - Open Trouble documentation

=== USEFUL TIPS ===
- Use <leader>q for current file diagnostics (replaces old quickfix)
- Use <leader>xx for project-wide diagnostic overview
- Press 'o' to browse items while keeping Trouble open
- Press <Enter> for quickfix-like behavior (jump and close)
- Use <C-w>t and <C-w>m to quickly switch focus between windows
- Trouble automatically updates as you fix issues in your code
--]]
