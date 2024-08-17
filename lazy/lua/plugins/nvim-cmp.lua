return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- Change the mapping of confirm from <CR> to <Right>
      opts.mapping["<Right>"] = opts.mapping["<CR>"] -- Copy the mapping from <CR> to <Right>
      opts.mapping["<CR>"] = nil -- Remove the original <CR> mapping
      return opts
    end,
  },
}
