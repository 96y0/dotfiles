local dap, dapui = require("dap"), require("dapui")

vim.api.nvim_set_hl(0,'DapBreakpoint', { ctermbg=0, fg='#993939', bg='#31353f' })
vim.api.nvim_set_hl(0,'DapLogPoint', { ctermbg=0, fg='#61afef', bg='#31353f' })
vim.api.nvim_set_hl(1,'DapStopped', { ctermbg=0, fg='#98c379', bg='#31353f' })

vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })

dapui.setup()

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

dap.adapters.gdb = {
    id      = 'gdb',
    type    = 'executable',
    command = '/usr/bin/gdb',
    args    = {'--quiet', '--interpreter=dap'},
}

dap.configurations.c = {
    {
        name          = 'Launch gdb',
        type          = 'gdb',
        request       = 'launch',
        program       = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd           = '${workspaceFolder}',
        stopOnEntry   = false,
        args          = {},
        -- runInTerminal = true,
    },
}

-- vim.keymap.set('n', '<leader>dc', function() dap.close() dapui.close() end)
-- vim.keymap.set('n', '<leader>dk', function() dap.continue() end)
-- vim.keymap.set('n', '<leader>do', function() dap.step_over() end)
-- vim.keymap.set('n', '<leader>di', function() dap.step_into() end)
-- vim.keymap.set('n', '<leader>dl', function() dap.run_last() end)
-- vim.keymap.set('n', '<leader>b',  function() dap.toggle_breakpoint() end)

vim.keymap.set('n', "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set('n', "<leader>db", function() require("dap").toggle_breakpoint() end)
vim.keymap.set('n', "<leader>dc", function() require("dap").continue() end)
vim.keymap.set('n', "<leader>dC", function() require("dap").run_to_cursor() end)
vim.keymap.set('n', "<leader>dg", function() require("dap").goto_() end)
vim.keymap.set('n', "<leader>di", function() require("dap").step_into() end)
vim.keymap.set('n', "<leader>dj", function() require("dap").down() end)
vim.keymap.set('n', "<leader>dk", function() require("dap").up() end)
vim.keymap.set('n', "<leader>dl", function() require("dap").run_last() end)
vim.keymap.set('n', "<leader>do", function() require("dap").step_out() end)
vim.keymap.set('n', "<leader>dO", function() require("dap").step_over() end)
vim.keymap.set('n', "<leader>dp", function() require("dap").pause() end)
vim.keymap.set('n', "<leader>dr", function() require("dap").repl.toggle() end)
vim.keymap.set('n', "<leader>ds", function() require("dap").session() end)
vim.keymap.set('n', "<leader>dt", function() require("dap").terminate() end)
vim.keymap.set('n', "<leader>dw", function() require("dap.ui.widgets").hover() end)
vim.keymap.set('n', "<leader>du", function() require("dapui").toggle({ }) end)
vim.keymap.set('n', "<leader>de", function() require("dapui").eval() end)
