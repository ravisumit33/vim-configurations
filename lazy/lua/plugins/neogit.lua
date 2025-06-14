return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "folke/snacks.nvim",
  },
  config = true,
  keys = {
    { "<leader>gg", "<cmd>Neogit kind=floating<CR>" },
  },
}
