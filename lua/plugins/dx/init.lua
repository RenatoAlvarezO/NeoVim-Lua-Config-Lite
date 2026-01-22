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
			indent = {},
		},
	},
	{
		"greggh/claude-code.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required for git operations
		},
		config = function()
			require("claude-code").setup()
		end,
	},
}
