--[[
=====================================================================
==================== MODULAR KICKSTART CONFIG =====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||   Full-Stack Web   ||   | === |          ========
========         ||   Development      ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is this config?
  This is a modular Kickstart.nvim configuration optimized for full-stack web development.
  It's organized into separate plugin files for better maintainability.
  
  Perfect for: TypeScript, React, Node.js, Next.js, Prisma, Java, Python, Docker, Tailwind, etc.

How to add new plugins?
  1. Create a new file in lua/custom/plugins/ (e.g., lua/custom/plugins/my-plugin.lua)
  2. Return a plugin specification table from that file
  3. Restart Neovim - Lazy will automatically load it!

Example plugin file:
  -- lua/custom/plugins/example.lua
  return {
    'owner/plugin-name',
    opts = {
      -- plugin options here
    },
  }

Folder structure:
  ~/.config/nvim/
  ├── init.lua (this file)
  └── lua/
      ├── custom/
      │   └── plugins/
      │       ├── init.lua
      │       ├── lsp.lua
      │       ├── ui.lua
      │       ├── editor.lua
      │       └── webdev.lua
      └── kickstart/
          └── plugins/
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true -- Changed to true for better web dev experience

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.o.number = true
-- Add relative line numbers for easier navigation
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Confirm before quitting with unsaved changes
vim.o.confirm = true

-- Better tab settings for web development
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- To keep the undo tree histroy between sessions
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath 'cache' .. '/undo'

-- Enhanced undo settings (add these to your existing undo configuration)
vim.o.undolevels = 10000 -- Increase undo levels (default is usually 1000)
vim.o.undoreload = 10000 -- Save the whole buffer for undo when reloading

-- ✅ ADD THESE LINES FOR MULTI-EDITOR WORKFLOW
-- Auto-reload files when changed externally (for multi-editor workflow)
vim.o.autoread = true -- Automatically read file when changed outside of Neovim

-- Check for external changes more frequently
vim.o.updatetime = 100 -- Reduced from 250 to check more often (in milliseconds)

-- Set up autocommands for better file watching
vim.api.nvim_create_augroup('AutoReload', { clear = true })

-- Trigger checktime on various events to detect external changes
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  group = 'AutoReload',
  callback = function()
    if vim.fn.mode() ~= 'c' then -- Don't check in command-line mode
      vim.cmd 'checktime'
    end
  end,
})

-- Notify when file is reloaded
vim.api.nvim_create_autocmd('FileChangedShellPost', {
  group = 'AutoReload',
  callback = function()
    vim.notify('File reloaded: ' .. vim.fn.expand '%:t', vim.log.levels.INFO)
  end,
})

-- Handle file changes more gracefully
vim.api.nvim_create_autocmd('FileChangedShell', {
  group = 'AutoReload',
  callback = function()
    -- If the file has no unsaved changes, reload automatically
    if vim.bo.modified == false then
      vim.cmd 'edit!'
    else
      -- If there are unsaved changes, ask what to do
      local choice = vim.fn.confirm('File changed externally. Reload?', '&Yes\n&No\n&Diff', 1)
      if choice == 1 then
        vim.cmd 'edit!'
      elseif choice == 3 then
        vim.cmd 'DiffOrig'
      end
    end
  end,
})

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps (now handled by Trouble.nvim in lua/custom/plugins/trouble.lua)

-- Exit terminal mode easier
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Better window management
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = '[S]plit [V]ertically' })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = '[S]plit [H]orizontally' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = '[S]plit [E]qual' })
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = '[S]plit [X] Close' })

-- Cursor movement in insert mode (does not conflict with normal mode)
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Move cursor right in insert mode' })
vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Move cursor left in insert mode' })

-- Buffer navigation
vim.keymap.set('n', '<S-h>', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<S-l>', '<cmd>bnext<CR>', { desc = 'Next buffer' })

-- Better indenting
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right' })

-- Move text up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Open media files
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = { '*.png', '*.jpg', '*.jpeg', '*.bmp', '*.gif', '*.webp' },
  callback = function()
    vim.cmd 'split'
    vim.cmd 'resize 30'
    local file = vim.fn.expand '%:p'
    vim.cmd("term chafa '" .. file .. "'")
  end,
})

-- File reload keybindings for multi-editor workflow (now using <leader>r since Harpoon is removed)
vim.keymap.set('n', '<leader>r', '<cmd>checktime<CR>', { desc = '[R]eload files from disk' })
vim.keymap.set('n', '<leader>R', '<cmd>edit!<CR>', { desc = '[R]eload current file (force)' })
vim.keymap.set('n', '<leader>ar', '<cmd>bufdo checktime<CR>', { desc = '[A]ll buffers [R]eload' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('close_with_q', { clear = true }),
  pattern = {
    'PlenaryTestPopup',
    'help',
    'lspinfo',
    'man',
    'notify',
    'qf',
    'spectre_panel',
    'startuptime',
    'tsplayground',
    'neotest-output',
    'checkhealth',
    'neotest-summary',
    'neotest-output-panel',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup({
  -- Import all plugins from custom/plugins directory
  { import = 'custom.plugins' },

  { import = 'kickstart.plugins' },

  -- Core plugins that should always be loaded
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

  -- Git integration
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- Useful plugin to show you pending keybinds
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      delay = 0,
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },
      spec = {
        { '<leader>b', group = '[B]uffer' },
        { '<leader>c', group = '[C]ode' },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]eload/[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        { '<leader>g', group = '[G]it' },
        { '<leader>f', group = '[F]ile' },
        { '<leader>x', group = '[X] Trouble' },
      },
    },
  },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
