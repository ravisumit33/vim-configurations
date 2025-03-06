return {
  "folke/snacks.nvim",
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
