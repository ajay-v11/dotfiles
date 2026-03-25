-- lua/custom/plugins/ui.lua
-- UI plugins including file explorer, buffer management, etc.

return {
  -- File Explorer (like VSCode's sidebar)
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '<leader>ft', '<cmd>Neotree toggle<cr>', desc = '[F]ile [T]ree Toggle' },
      { '<leader>fe', '<cmd>Neotree focus<cr>', desc = '[F]ile [E]xplorer Focus' },
      { '<leader>fg', '<cmd>Neotree float git_status<cr>', desc = '[F]ile [G]it Status' },
    },
    opts = {
      filesystem = {
        window = {
          mappings = {
            ['\\'] = 'close_window',
          },
        },
        filtered_items = {
          hide_dotfiles = false, -- show dotfiles
          hide_gitignored = false,
        },
      },
    },
  },

  -- Buffer management
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        mode = 'buffers',
        diagnostics = 'nvim_lsp',
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo-tree',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
    },
  },

  -- Better notifications
  {
    'rcarriga/nvim-notify',
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
    init = function()
      vim.notify = require 'notify'
    end,
  },

  -- Dashboard
  {
    'nvimdev/dashboard-nvim',
    --[[   ]]
    event = 'VimEnter',
    opts = function()
      local logo = [[   _,    _   _    ,_
               .o888P     Y8o8Y     Y888o.
              d88888      88888      88888b
             d888888b_  _d88888b_  _d888888b
             8888888888888888888888888888888
             8888888888888888888888888888888
             YJGS8P"Y888P"Y888P"Y888P"Y8888P
              Y888   '8'   Y8P   '8'   888Y
               '8o          V          o8'
                 `                     `]]

      logo = string.rep('\n', 8) .. logo .. '\n\n'

      local opts = {
        theme = 'doom',
        hide = {
          statusline = false,
        },
        config = {
          header = vim.split(logo, '\n'),
          center = {
            { action = 'Telescope find_files', desc = ' Find file', icon = ' ', key = 'f' },
            { action = 'ene | startinsert', desc = ' New file', icon = ' ', key = 'n' },
            { action = 'Telescope oldfiles', desc = ' Recent files', icon = ' ', key = 'r' },
            { action = 'Telescope live_grep', desc = ' Find text', icon = ' ', key = 'g' },
            { action = 'Lazy', desc = ' Lazy', icon = '󰒲 ', key = 'l' },
            { action = 'qa', desc = ' Quit', icon = ' ', key = 'q' },
          },
          footer = function()
            local stats = require('lazy').stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(' ', 43 - #button.desc)
        button.key_format = '  %s'
      end

      return opts
    end,
  },
}
