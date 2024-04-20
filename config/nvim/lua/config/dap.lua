local dap, dapui = require("dap"), require("dapui")
require("dapui").setup()
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
        runInTerminal = true,
    },
}

vim.keymap.set('n', '<leader>dk', function() dap.continue() end)
vim.keymap.set('n', '<leader>do', function() dap.step_over() end)
vim.keymap.set('n', '<leader>di', function() dap.step_into() end)
vim.keymap.set('n', '<leader>dl', function() dap.run_last() end)
vim.keymap.set('n', '<leader>b',  function() dap.toggle_breakpoint() end)
