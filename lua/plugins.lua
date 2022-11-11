local M = {}

function M.setup()
  -- Autocommand that reloads neovim whenever you save the plugins.lua file
  vim.cmd [[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]

  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
		profile = {
			enable = true,
			threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
		},
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
		-- Will be installed under $XDG_DATA_HOME/site/pack/packer/start
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }

		-- Use the following colorscheme as default
    use {
      "sainnhe/everforest",
      config = function()
        vim.cmd "colorscheme everforest"
      end,
    }

    -- Startup screen
    use {
      "goolord/alpha-nvim",
      config = function()
        require("configs.alpha").setup()
      end,
    }

    -- Git
    use {
      "TimUntersberger/neogit",
			cmd = "Neogit",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("configs.neogit").setup()
      end,
    }

		-- WhichKey
		use {
      "folke/which-key.nvim",
      event = "VimEnter",
      config = function()
        require("configs.whichkey").setup()
      end,
		}

		-- IndentLine
		use {
			"lukas-reineke/indent-blankline.nvim",
			event = "BufReadPre",
			config = function()
				require("configs.indentblankline")
			end,
		}

    use { "nvim-lua/plenary.nvim", module = "plenary" }

    -- Better icons
    use {
      "kyazdani42/nvim-web-devicons",
      module = "nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup { default = true }
      end,
    }

    -- Better Comment
    use {
      "numToStr/Comment.nvim",
      opt = true,
      keys = { "gc", "gcc", "gbc" },
      config = function()
        require("Comment").setup {}
      end,
    }

    -- Easy hopping
    use {
      "phaazon/hop.nvim",
      cmd = { "HopWord", "HopChar2" },
      config = function()
        require("hop").setup {}
      end,
    }
		
    -- Markdown
    use {
      "iamcco/markdown-preview.nvim",
      run = function()
        vim.fn["mkdp#util#install"]()
      end,
      ft = "markdown",
      cmd = { "MarkdownPreview" },
    }

		-- Fancy Statusline
		use {
			"nvim-lualine/lualine.nvim",
			event = "VimEnter",
			config = function()
			 require("configs.lualine").setup()
			end,
			wants = { "nvim-web-devicons" },
		}

		-- Treesitter
		use {
			run = ":TSUpdate",
			"nvim-treesitter/nvim-treesitter",
			config = function()
				require("configs.treesitter").setup()
			end,
		}

    -- User interface
    use {
      "stevearc/dressing.nvim",
      event = "BufEnter",
      config = function()
        require("dressing").setup {
          select = {
            backend = { "telescope", "fzf", "builtin" },
          },
        }
      end,
    }

    -- File explorer
    use {
      "nvim-neo-tree/neo-tree.nvim",
      cmd = "Neotree",
      requires = { "MunifTanjim/nui.nvim", module = "nui" },
      setup = function() vim.g.neo_tree_remove_legacy_commands = true end,
      config = function() require "configs.neo-tree" end,
    }

    -- Fuzzy finder
    use {
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      module = "telescope",
      config = function() require "configs.telescope" end,
    }

		-- Motions
		use { "chaoren/vim-wordmotion", opt = true, fn = { "<Plug>WordMotion_w" } }

		-- Completion
    use {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      opt = true,
      config = function()
        require("configs.cmp").setup()
      end,
      wants = { "LuaSnip" },
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-emoji",
        "hrsh7th/cmp-calc",
        "ray-x/cmp-treesitter",
        "saadparwaiz1/cmp_luasnip",
        "f3fora/cmp-spell",
        {
          "L3MON4D3/LuaSnip",
          wants = "friendly-snippets",
          config = function()
            require("configs.luasnip").setup()
          end,
        },
        "rafamadriz/friendly-snippets",
      },
    }

    -- Formatting and linting
    use {
      "jose-elias-alvarez/null-ls.nvim",
      event = { "BufRead", "BufNewFile" },
    }

    -- Auto pairs
    use {
      "windwp/nvim-autopairs",
      wants = "nvim-treesitter",
      module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
      config = function()
        require("configs.autopairs").setup()
      end,
    }

    -- LSP

    -- Editor Config
    use "gpanders/editorconfig.nvim" 
    use "RRethy/vim-illuminate"
		
		----------------------------------------------------------

    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end

  end

  packer_init()

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
