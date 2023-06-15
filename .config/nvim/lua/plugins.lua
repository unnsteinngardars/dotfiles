-- This file can be loaded by calling `lua require('plugins')` from your init.vimplgins

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

        -- Colorscheme
        -- use {
        --     "EdenEast/nightfox.nvim",
        -- }
        use {
            "Mofiqul/dracula.nvim",
        }

        -- popup (lua development plugin that I am not sure why I have installed...)
        use 'nvim-lua/popup.nvim'

        -- file explorer
        use {
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
            },
            -- tag = 'nightly' -- optional, updated every week. (see issue #1193)
        }

        -- LSP
        use {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v1.x',
            requires = {
                -- LSP Support
                { 'neovim/nvim-lspconfig' }, -- Required
                { 'williamboman/mason.nvim' }, -- Optional
                { 'williamboman/mason-lspconfig.nvim' }, -- Optional

                -- Autocompletion
                { 'hrsh7th/nvim-cmp' }, -- Required
                { 'hrsh7th/cmp-nvim-lsp' }, -- Required
                { 'hrsh7th/cmp-buffer' }, -- Optional
                { 'hrsh7th/cmp-path' }, -- Optional
                { 'saadparwaiz1/cmp_luasnip' }, -- Optional
                { 'hrsh7th/cmp-nvim-lua' }, -- Optional

                -- Snippets
                { 'L3MON4D3/LuaSnip' }, -- Required
                { 'rafamadriz/friendly-snippets' }, -- Optional
            }
        }

        -- Dart & Flutter
        -- Vimscript plugins

        -- use 'dart-lang/dart-vim-plugin'
        -- use 'thosakwe/vim-flutter'
        -- use 'natebosch/vim-lsc'
        -- use 'natebosch/vim-lsc-dart'

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


        use {
            "glepnir/lspsaga.nvim",
            branch = "main",
            config = function()
                require("lspsaga").setup({})
            end,
            requires = {
                { "nvim-tree/nvim-web-devicons" },
                --Please make sure you install markdown and markdown_inline parser
                { "nvim-treesitter/nvim-treesitter" }
            }
        }

        use {
            "jose-elias-alvarez/null-ls.nvim",
            requires = {
                { "nvim-lua/plenary.nvim" }
            }
        }
        -- Treesitter
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }

        use({
            "nvim-treesitter/nvim-treesitter-textobjects",
            after = "nvim-treesitter",
            requires = "nvim-treesitter/nvim-treesitter",
        })

        -- Status Line
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }

        -- Telescope
        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.1',
            requires = { { 'nvim-lua/plenary.nvim' } }
        }

        -- Extensions for telescope

        use {
            'nvim-telescope/telescope-fzf-native.nvim',
            run = 'make',
            config = function()
                require('telescope').load_extension('fzf')
            end
        }
        use {
            'nvim-telescope/telescope-project.nvim',
            config = function()
                require('telescope').load_extension('project')
            end
        }
        -- TODO: figure out sqlite issue
        use { 'nvim-telescope/telescope-smart-history.nvim' }
        use {
            'nvim-telescope/telescope-frecency.nvim',
            config = function()
                require('telescope').load_extension('frecency')
            end,
            requires = { 'kkharji/sqlite.lua' }
        }

        -- External dependencies are: glow, locate, fd
        use 'cljoly/telescope-repo.nvim'


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

        -- Navigation
        use {
            'phaazon/hop.nvim',
            branch = 'v2', -- optional but strongly recommended
            config = function()
                -- you can configure Hop the way you like here; see :h hop-config
                require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
            end
        }
        -- MiniMisc command not found
        -- use {
        --     "echasnovski/mini.misc",
        --     config = function()
        --         require("mini.misc").setup()
        --     end
        -- }

        -- TODO: evaulate the need for this
        use {
            'sindrets/winshift.nvim',
        }

        use {
            'ThePrimeagen/harpoon',
            requires = { 'nvim-lua/plenary.nvim' }
        }

        use 'https://gitlab.com/yorickpeterse/nvim-window.git'

        -- Tab bar
        use { 'romgrk/barbar.nvim', requires = 'nvim-web-devicons' }

        -- Go
        -- ISSUES:
        -- 1. goimports is making neovim slow to start
        -- https://github.com/ray-x/go.nvim/issues/304
        use 'ray-x/go.nvim'
        use 'ray-x/guihua.lua' -- recommended if need floating window support

        -- use { 'fatih/vim-go' }
        -- use { 'buoto/gotests-vim' }
        --

        -- HTTP Requests
        use {
            "rest-nvim/rest.nvim",
            requires = { "nvim-lua/plenary.nvim" },
            config = function()
                -- TODO: Move to rest file.

                require("rest-nvim").setup({
                    -- Open request results in a horizontal split
                    result_split_horizontal = false,
                    -- Keep the http file buffer above|left when split horizontal|vertical
                    result_split_in_place = false,
                    -- Skip SSL verification, useful for unknown certificates
                    skip_ssl_verification = false,
                    -- Encode URL before making request
                    encode_url = true,
                    -- Highlight request on run
                    highlight = {
                        enabled = true,
                        timeout = 150,
                    },
                    result = {
                        -- toggle showing URL, HTTP info, headers at top the of result window
                        show_url = true,
                        show_http_info = true,
                        show_headers = true,
                        -- executables or functions for formatting response body [optional]
                        -- set them to false if you want to disable them
                        formatters = {
                            json = "jq",
                            html = function(body)
                                return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
                            end
                        },
                    },
                    -- Jump to request line on run
                    jump_to_request = false,
                    env_file = '.env',
                    custom_dynamic_variables = {},
                    yank_dry_run = true,
                })
            end
        }

        -- UI
        use {
            'gorbit99/codewindow.nvim',
            config = function()
                local codewindow = require('codewindow')
                codewindow.setup()
                codewindow.apply_default_keybinds()
            end,
        }


        use 'github/copilot.vim'


        -- Utilities
        use {
            'nmac427/guess-indent.nvim',
            config = function() require('guess-indent').setup {} end,
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

        -- Neovim development
        use {
            "folke/neodev.nvim",
            config = function()
                require("neodev").setup({
                    library = { plugins = { "nvim-dap-ui" }, types = true },
                })
            end
        }

        -- Debugging
        -- dependencies:
        -- go install github.com/go-delve/delve/cmd/dlv@latest
        -- git clone https://github.com/golang/vscode-go
        -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#go-using-delve-directly
        use 'mfussenegger/nvim-dap'
        use 'leoluz/nvim-dap-go'
        use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }


        use {
            'sudormrfbin/cheatsheet.nvim',

            requires = {
                { 'nvim-telescope/telescope.nvim' },
                { 'nvim-lua/popup.nvim' },
                { 'nvim-lua/plenary.nvim' },
            }
        }

        -- git

        -- markdown
        -- -- install without yarn or npm
        use({
            "iamcco/markdown-preview.nvim",
            run = function() vim.fn["mkdp#util#install"]() end,
        })

        -- Quickfix
        use "kevinhwang91/nvim-bqf";

        use { "kkharji/sqlite.lua" }
    end)
