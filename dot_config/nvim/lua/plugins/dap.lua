return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      "mfussenegger/nvim-dap-python",
      config = function()
        -- Get the Python path from your Poetry environment
        local handle = io.popen("poetry env info -e")
        local python_path = handle:read("*a"):gsub("%s+$", "")
        handle:close()

        require("dap-python").setup(python_path)
      end,
    },
  },
}
