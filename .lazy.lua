return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			setup = {
				clangd = function(_, opts)
					local clangd_arguments = {
						"--log=verbose",
						"--pretty",
						"--query-driver=<path-to-emsdk>/upstream/emscripten/em*",
					}
					vim.list_extend(opts.cmd, clangd_arguments)
				end,
			},
		},
	},
}
