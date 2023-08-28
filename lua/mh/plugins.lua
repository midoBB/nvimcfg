return require("lazy").setup(function(use)
	use({ "wbthomason/packer.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "nvim-tree/nvim-web-devicons" })
	use({ "stevearc/dressing.nvim" })
	use({ "MunifTanjim/nui.nvim" })
	use({ "folke/noice.nvim" })
	use({ "kevinhwang91/promise-async" })
	use({ "ray-x/guihua.lua" })
	-- colorscheme
	use({ "folke/tokyonight.nvim" })
	use({ "nyoom-engineering/oxocarbon.nvim" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "tpope/vim-sleuth" })
	use({ "norcalli/nvim-colorizer.lua" })
	use({ "romainl/vim-cool" })
	-- file managment
	use({ "nvim-tree/nvim-tree.lua", tag = "nightly" })
	use({ "nvim-telescope/telescope.nvim", commit = "22e13f6f6999da7e4025497151e3b61d0ede7351" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	-- text utils
	use({ "kylechui/nvim-surround", tag = "*" })
	use({ "numToStr/Comment.nvim" })
	-- treesitter
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })
	use({ "nvim-treesitter/nvim-treesitter-context" })
	use({ "p00f/nvim-ts-rainbow" })
	use({ "windwp/nvim-ts-autotag" })
	use({ "bennypowers/splitjoin.nvim" })
	use({ "m-demare/hlargs.nvim" })
	use({ "haringsrob/nvim_context_vt" })
	-- use { 'anuvyklack/pretty-fold.nvim' }
	use({ "kevinhwang91/nvim-ufo" })
	use({ "windwp/nvim-autopairs" })
	use({ "RRethy/vim-illuminate" })
	-- yank ring
	use({ "gbprod/yanky.nvim" })
	use({ "gbprod/cutlass.nvim" })
	-- search
	use({ "kevinhwang91/nvim-hlslens" })
	use({ "mg979/vim-visual-multi" })
	use({ "roobert/search-replace.nvim" })

	-- start where you left
	use({ "ethanholz/nvim-lastplace" })
	use({ "airblade/vim-rooter" })
	use({ "Shatur/neovim-session-manager" })
	use({ "ThePrimeagen/harpoon" })
	-- Motions
	use({ "abecodes/tabout.nvim" })
	use({ "ggandor/leap.nvim" })
	use({ "tpope/vim-repeat" })
	use({ "ggandor/flit.nvim" })
	use({ "Vonr/align.nvim" })
	use({ "gbprod/stay-in-place.nvim" })
	-- Smart resize
	use({ "kevinhwang91/nvim-bqf", ft = "qf" })
	use({ "mrjones2014/smart-splits.nvim" })
	use({ "tummetott/reticle.nvim" })
	-- Git
	use({ "lewis6991/gitsigns.nvim", commit = "bb808fc7376ed7bac0fbe8f47b83d4bf01738167" })
	use({ "sindrets/diffview.nvim" })
	use({ "TimUntersberger/neogit" })
	-- Terminal
	use({ "akinsho/toggleterm.nvim", tag = "2.3.0" })
	-- WhichKey
	use({ "folke/which-key.nvim" })
	-- bars
	use({ "tiagovla/scope.nvim" })
	use({ "akinsho/bufferline.nvim" })
	use({ "roobert/bufferline-cycle-windowless.nvim" })
	use({ "ojroques/nvim-bufdel" })
	use({ "b0o/incline.nvim" })
	use({ "lewis6991/satellite.nvim" })
	use({ "nvim-lualine/lualine.nvim" })
	-- Todos and Trouble
	use({ "folke/trouble.nvim" })
	use({ "folke/todo-comments.nvim" })
	use({ "folke/twilight.nvim" })
	-- Undo tree
	use({ "mbbill/undotree" })
	-- LSP
	-- LSP Support
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "jayp0521/mason-null-ls.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	-- Autocompletion
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "lukas-reineke/cmp-rg" })
	-- Snippets
	use({ "L3MON4D3/LuaSnip" })
	use({ "rafamadriz/friendly-snippets" })
	use({ "j-hui/fidget.nvim" })
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({
				ui = {
					winblend = 10,
					border = "rounded",
				},
				rename = {
					quit = "<C-c>",
					exec = "<CR>",
					mark = "x",
					confirm = "<CR>",
					in_select = false,
				},
				symbol_in_winbar = {
					enable = false,
				},
			})
		end,
	})
	use({ "lvimuser/lsp-inlayhints.nvim" })
	use({ "SmiteshP/nvim-navic" })
	use({ "stevearc/aerial.nvim" })
	use({ "ray-x/lsp_signature.nvim" })
	use({ "smjonas/inc-rename.nvim" })
	use({ "onsails/lspkind-nvim" })
	-- Debugging
	use({ "mfussenegger/nvim-dap" })
	use({ "rcarriga/nvim-dap-ui" })
	use({ "theHamsta/nvim-dap-virtual-text" })
	use({ "Weissle/persistent-breakpoints.nvim" })
	use({ "leoluz/nvim-dap-go" })
	-- GoLang
	use({ "ray-x/go.nvim" })
	use({ "ThePrimeagen/refactoring.nvim" })
	-- Java
	use({ "mfussenegger/nvim-jdtls" })
	-- Json and Yaml
	use({ "b0o/schemastore.nvim" })
	-- Typescript
	use({ "jose-elias-alvarez/typescript.nvim" })
	-- Annotations
	use({ "danymat/neogen" })
	-- Obsidian and Markdown
	use({ "preservim/vim-markdown" })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
