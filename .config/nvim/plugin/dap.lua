local wk = require("which-key")

function GetSubstitutePath()
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
            substitutePath = GetSubstitutePath(),
        },
    },
    delve = {
        path = "dlv",
        port = 2345,
    }
})

require("dapui").setup()


vim.keymap.set('n', '<F5>', function() require('dap').continue() end)

wk.add({
      { "<leader>db", function() require('dap').continue() end, desc = "Toggle Breakpoint" },
      { "<leader>dc", function() require('dap').toggle_breakpoint() end, desc = "Continue" },
      { "<leader>di", function() require('dap').step_into() end, desc = "Step Into" },
      { "<leader>dl", function() require('dap').step_over() end, desc = "Toggle UI" },
      { "<leader>do", function() require('dap').step_out() end, desc = "Step Over" },
      { "<leader>dq", function() require('dap').disconnect() end, desc = "Disconnect" },
      { "<leader>dr", function() require('dap').repl.open() end, desc = "Open REPL" },
      { "<leader>du", function() require('dapui').toggle() end, desc = "Step Out" },
  })

