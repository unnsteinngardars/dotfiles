local dap = require("dap")
-- TODO: Figure out how to get this working with kubernetes pods
dap.configurations.go = {
    {
        type = "delve",
        name = "Debug (Remote binary)",
        request = "launch",
        mode = "exec",
        hostName = "127.0.0.1",
        port = "38697",
        program = function()
            local argument_string = vim.fn.input "Path to binary: "
            vim.notify("Debugging binary: " .. argument_string)
            return vim.fn.split(argument_string, " ", true)[1]
        end,
    },
}

dap.adapters.delve = {
    type = "server",
    host = "127.0.0.1",
    executable = {
        command = "dlv",
        args = { 'dap', '-l', '127.0.0.1:38697', '--log', '--log-output="dap"'}
    },
    port = 38697,
}

-- require("dap-go").setup({
--     -- Additional dap configurations can be added.
--     -- dap_configurations accepts a list of tables where each entry
--     -- represents a dap configuration. For more details do:
--     -- :help dap-configuration
--     dap_configurations = {
--         {
--             -- Must be "go" or it will be ignored by the plugin
--             type = "go",
--             name = "Attach remote",
--             mode = "remote",
--             request = "attach",
--         },
--         program = function()
--             local argument_string = vim.fn.input "Path to binary: "
--             vim.notify("Debugging binary: " .. argument_string)
--             return vim.fn.split(argument_string, " ", true)[1]
--         end
--     },
--     -- delve configurations
--     delve = {
--         -- the path to the executable dlv which will be used for debugging.
--         -- by default, this is the "dlv" executable on your PATH.
--         path = "dlv",
--         -- time to wait for delve to initialize the debug session.
--         -- default to 20 seconds
--         initialize_timeout_sec = 20,
--         -- a string that defines the port to start delve debugger.
--         -- default to string "${port}" which instructs nvim-dap
--         -- to start the process in a random available port
--         port = 38697,
--         -- additional args to pass to dlv
--         args = {}
--     },
-- })
