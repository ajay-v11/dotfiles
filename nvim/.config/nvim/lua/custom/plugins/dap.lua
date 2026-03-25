-- lua/custom/plugins/dap.lua
-- Debugger configuration using nvim-dap
return {
  {
    -- Debug Adapter Protocol client
    'mfussenegger/nvim-dap',
    dependencies = {
      -- Installs DAP adapters
      'williamboman/mason.nvim',
      'theHamsta/nvim-dap-virtual-text',

      -- A UI for nvim-dap
      {
        'rcarriga/nvim-dap-ui',
        opts = {
          icons = { expanded = '▾', collapsed = '▸', current_frame = '▸' },
          controls = {
            enabled = true,
            element = 'repl',
            icons = {
              pause = '',
              play = '▶',
              step_into = '',
              step_over = '',
              step_out = '',
              step_back = '',
              run_last = '↻',
              terminate = '⏹',
            },
          },
          layouts = {
            {
              elements = {
                { id = 'scopes', size = 0.25 },
                { id = 'breakpoints', size = 0.25 },
                { id = 'stacks', size = 0.25 },
                { id = 'watches', size = 0.25 },
              },
              size = 40,
              position = 'left',
            },
            {
              elements = {
                { id = 'repl', size = 0.5 },
                { id = 'console', size = 0.5 },
              },
              size = 10,
              position = 'bottom',
            },
          },
        },
      },
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')

      -- Keymaps for debugging
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'DAP: Toggle [B]reakpoint' })
      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'DAP: [C]ontinue' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'DAP: Step [I]nto' })
      vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'DAP: Step [O]ver' })
      vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = 'DAP: Step [O]ut' })
      vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = 'DAP: Open [R]EPL' })
      vim.keymap.set('n', '<leader>dl', dap.run_last, { desc = 'DAP: [L]aunch last' })
      vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'DAP: Toggle [U]I' })
      vim.keymap.set('n', '<leader>dk', dap.terminate, { desc = 'DAP: Terminate/[K]ill' })

      -- Automatically setup DAP configurations for detected languages
      require('mason-nvim-dap').setup({
        -- Makes sure configured adapters are installed
        ensure_installed = {
          'js-debug-adapter',
          'javatest',
          'java-debug-adapter',
          'python-debugger',
        },
        -- Sets up dap configs for certain languages automatically
        automatic_installation = true,
        handlers = {},
      })
    end,
  },
}