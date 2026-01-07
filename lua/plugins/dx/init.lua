return {
	"windwp/nvim-autopairs",
	"numToStr/Comment.nvim",
	{
		"mg979/vim-visual-multi",
		init = function()
			vim.g.VM_maps = {
				["Find Under"] = "<C-d>",
				["Find Subword Under"] = "<C-d>",
			}
		end,
	},
	"hedyhli/outline.nvim",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-ui-select.nvim",
	"akinsho/toggleterm.nvim",
	{
		"folke/snacks.nvim",
		opts = {
			indent = {
			},
		},
	},
}
