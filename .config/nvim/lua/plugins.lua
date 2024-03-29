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

        -------------------------
        ----- File explorer -----
        -------------------------
        use {
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
            },
            -- tag = 'nightly' -- optional, updated every week. (see issue #1193)
        }

        ---------------
        ----- LSP -----
        ---------------
        -- use {
        --     'VonHeikemen/lsp-zero.nvim',
        --     branch = 'v1.x',
        --     requires = {
        --         -- LSP Support
        --         { 'neovim/nvim-lspconfig' }, -- Required
        --         { 'williamboman/mason.nvim' }, -- Optional
        --         { 'williamboman/mason-lspconfig.nvim' }, -- Optional
        --
        --         -- Autocompletion
        --         { 'hrsh7th/nvim-cmp' }, -- Required
        --         { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        --         { 'hrsh7th/cmp-buffer' }, -- Optional
        --         { 'hrsh7th/cmp-path' }, -- Optional
        --         { 'saadparwaiz1/cmp_luasnip' }, -- Optional
        --         { 'hrsh7th/cmp-nvim-lua' }, -- Optional
        --
        --         -- Snippets
        --         { 'L3MON4D3/LuaSnip' }, -- Required
        --         { 'rafamadriz/friendly-snippets' }, -- Optional
        --     }
        -- }
        --
        -- use {
        --     "glepnir/lspsaga.nvim",
        --     branch = "main",
        --     config = function()
        --         require("lspsaga").setup({})
        --     end,
        --     requires = {
        --         { "nvim-tree/nvim-web-devicons" },
        --         --Please make sure you install markdown and markdown_inline parser
        --         { "nvim-treesitter/nvim-treesitter" }
        --     }
        -- }
        --
        -- use {
        --     "jose-elias-alvarez/null-ls.nvim",
        --     requires = {
        --         { "nvim-lua/plenary.nvim" }
        --     }
        -- }
        --

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
            'nvim-telescope/telescope.nvim', tag = '0.1.1',
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

        use 'cljoly/telescope-repo.nvim' -- External dependencies are: glow, locate, fd

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
            branch = 'v2', -- optional but strongly recommended
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
        -- MiniMisc command not found
        -- use {
        --     "echasnovski/mini.misc",
        --     config = function()
        --         require("mini.misc").setup()
        --     end
        -- }

        use {
            'sindrets/winshift.nvim', -- TODO: evaulate the need for this
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
                "numToStr/Comment.nvim", -- Optional
                "nvim-telescope/telescope.nvim" -- Optional
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
                'stevearc/dressing.nvim', -- optional for vim.ui.select
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

        use 'ray-x/guihua.lua' -- recommended if need floating window support

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

        -- http requests
        -- use {
        --     "rest-nvim/rest.nvim",
        --     requires = { "nvim-lua/plenary.nvim" },
        -- }
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
            connfig = function()
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
        -- NOT WORKING WITH CONTAINERS IN KUBERNETES :(
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
