return {
  "b0o/incline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "BufReadPre",
  config = function()
    require("incline").setup({
      window = {
        margin = { vertical = 0, horizontal = 1 },
        placement = {
          vertical = "top",
          horizontal = "left",
        },
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if filename == "" then
          filename = "[No Name]"
        end
        local devicons = require("nvim-web-devicons")
        local icon, color = devicons.get_icon_color(filename)

        return {
          { icon, guifg = color },
          { " " },
          { filename, gui = props.focused and "bold" or "" },
        }
      end,
    })
  end,
}
