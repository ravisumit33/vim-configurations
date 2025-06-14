return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          ignored = true,
          hidden = true,
        },
      },
    },
  },
  keys = {
    {
      "<c-/>",
      function()
        Snacks.terminal("zsh")
      end,
      desc = "Toggle Terminal",
    },
  },
}
