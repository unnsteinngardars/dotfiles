local utils = require('utils')
local options = { silent = true, expr = true }
local wk = require("which-key")

function getSubstitutePath()
    local projectRoot = vim.fn.getcwd()
    local containerRoot = "/app"

    -- Determine the container root dynamically or use an environment variable
    -- containerRoot = os.getenv("CONTAINER_ROOT_PATH") or containerRoot

    return {
        {
            from = projectRoot,
            to = containerRoot,
        },
    }
end

require('dap-go').setup({
    dap_configurations = {
        {
            type = "go",
            name = "Attach Remote",
            mode = "remote",
            request = "attach",
            port = 2345,
            host = "127.0.0.1",
            substitutePath = getSubstitutePath(),
        },
    },
    delve = {
        path = "dlv",
        port = 2345,
    }
})

require("dapui").setup()


vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
wk.register({
    d = {
        c = { function() require('dap').continue() end, "Continue" },
        b = { function() require('dap').toggle_breakpoint() end, "Toggle Breakpoint" },
        i = { function() require('dap').step_into() end, "Step Into" },
        o = { function() require('dap').step_over() end, "Step Over" },
        u = { function() require('dap').step_out() end, "Step Out" },
        r = { function() require('dap').repl.open() end, "Open REPL" },
        q = { function() require('dap').disconnect() end, "Disconnect" },
        l = { function() require('dapui').toggle() end, "Toggle UI" },
    }
}, { prefix = "<leader>" })
utils.map("n", "<C-b>", 'copilot#Next()', options)
