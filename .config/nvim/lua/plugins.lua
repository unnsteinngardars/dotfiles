-- This file can be loaded by calling `lua require('plugins')` from your init.vimplginsplugins

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- MISSING FROM OLD PLUGIN MANAGERS
-- p00f/nvim-ts-rainbow
-- tpope/vim-surround
-- kevinhwang91/nvim-bqf
-- windwp/nvim-ts-autotag
-- michaelb/sniprun
-- kdheepak/lazygit.nvim
-- sindrets/diffview.nvim,
-- akinsho/git-conflict.nvim,
-- norcalli/nvim-colorizer.lua
-- glepnir/dashboard-nvim
-- gbprod/yanky.nvim
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -----------------------
    ----- Colorscheme -----
    -----------------------
    use {
        "Mofiqul/dracula.nvim",
    }

    use { "catppuccin/nvim", as = "catppuccin" }

    use { "ellisonleao/gruvbox.nvim" }

    use { 'maxmx03/solarized.nvim' }

    use({
      "neanias/everforest-nvim",
      -- Optional; default configuration will be used if setup isn't called.
      config = function()
        require("everforest").setup()
      end,
    })

    -------------------------
    ----- GIT -----
    -------------------------
    use {
        'f-person/git-blame.nvim',
    }


    -------------------------
    ----- File explorer -----
    -------------------------
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',     -- optional, for file icons
        },
        -- tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    ---------------
    ----- LSP -----
    ---------------

    -- Quickstart configs for nvim core lsp
    use {
        'neovim/nvim-lspconfig',
    }
    -- Packaga manager for language servers
    use {
        'williamboman/mason.nvim',
    }
    -- A bridge between nvim-lspconfig and mason.nvim making it easier to use both plugins together
    use {
        'williamboman/mason-lspconfig.nvim',
    }

    -- Autocompletion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
        }
    }

    use {
        'nvimdev/lspsaga.nvim',
        requires = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
        }
    }
    use {
        'mfussenegger/nvim-lint'
    }

    ----------------------
    ----- Treesitter -----
    ----------------------
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })



    ---------------------
    ----- Telescope -----
    ---------------------
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- extensions for telescope
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
    }
    use {
        'nvim-telescope/telescope-project.nvim',
    }
    use { 'nvim-telescope/telescope-smart-history.nvim' }
    use {
        'nvim-telescope/telescope-frecency.nvim',
        -- TODO: figure out sqlite issue
        requires = { 'kkharji/sqlite.lua' }
    }

    use 'cljoly/telescope-repo.nvim'     -- External dependencies are: glow, locate, fd

    -- Terminal
    use { "akinsho/toggleterm.nvim" }

    -- Editing utilities
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }


    ----------------------
    ----- Navigation -----
    ----------------------
    use {
        'phaazon/hop.nvim',
        branch = 'v2',     -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

    use {
        "folke/flash.nvim",
        config = function()
            require("flash").setup()
        end
    }


    use {
        'ThePrimeagen/harpoon',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    use 'https://gitlab.com/yorickpeterse/nvim-window.git'

    use {
        "SmiteshP/nvim-navbuddy",
        requires = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim",
            "numToStr/Comment.nvim",            -- Optional
            "nvim-telescope/telescope.nvim"     -- Optional
        }
    }


    --------------------------------
    ----- Languages and markup -----
    --------------------------------
    -- go
    use 'ray-x/go.nvim'

    -- dart & flutter
    use {
        'akinsho/flutter-tools.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim',     -- optional for vim.ui.select
        },
        config = function()
            require("flutter-tools").setup()
        end,
    }
    -- markdown
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    --------------
    ----- UI -----
    --------------

    use 'ray-x/guihua.lua'     -- recommended if need floating window support

    -- tab bar
    use { 'romgrk/barbar.nvim', requires = 'nvim-web-devicons' }

    -- window management
    use {
        'gorbit99/codewindow.nvim',
        config = function()
            local codewindow = require('codewindow')
            codewindow.setup()
            codewindow.apply_default_keybinds()
        end,
    }

    -- status Line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- quickfix
    use "kevinhwang91/nvim-bqf"

    use {
        "folke/noice.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }

    }
    -- Block
    use {
        "HampusHauffman/block.nvim",
        config = function()
            require("block").setup({})
        end
    }

    ---------------------
    ----- Utilities -----
    ---------------------
    use 'github/copilot.vim'

    use {
        'nmac427/guess-indent.nvim',
        config = function() require('guess-indent').setup {} end,
    }

    use {
        'sudormrfbin/cheatsheet.nvim',

        requires = {
            { 'nvim-telescope/telescope.nvim' },
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
        }
    }

    use "gbprod/yanky.nvim"

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- storage
    use { "kkharji/sqlite.lua" }

    ----------------------------
    ----- Nvim development -----
    ----------------------------
    use {
        "folke/neodev.nvim",
        config = function()
            require("neodev").setup({
                library = { plugins = { "nvim-dap-ui" }, types = true },
            })
        end
    }

    ---------------------
    ----- Debugging -----
    ---------------------
    -- Debugging
    -- Not working with any port other than 2345
    -- dependencies:
    -- go install github.com/go-delve/delve/cmd/dlv@latest
    -- git clone https://github.com/golang/vscode-go
    -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#go-using-delve-directly
    use { 'mfussenegger/nvim-dap', requires = { "nvim-neotest/nvim-nio" } }
    use 'leoluz/nvim-dap-go'
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

    -------------------
    ----- Testing -----
    -------------------
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim"
        }
    }

    -----------------
    ----- Jokes -----
    -----------------

    use 'eandrju/cellular-automaton.nvim'
end)
