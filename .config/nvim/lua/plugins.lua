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
        use {
            "EdenEast/nightfox.nvim",
            config = function()
                require("nightfox").setup({
                    options = {
                        transparent = true,
                    },
                })
            end
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

        -- Fuzzy Finder
        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.1',
            requires = { { 'nvim-lua/plenary.nvim' } }
        }

        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

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

        -- TODO: evaulate the need for this
        use {
            'sindrets/winshift.nvim',
            config = function()
                require("winshift").setup({
                })
            end
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
        -- 2. BoGuild is always successfull even when build errors exist
        -- use 'ray-x/go.nvim'
        -- use 'ray-x/guihua.lua' -- recommended if need floating window support

        use { 'fatih/vim-go' }
        use { 'buoto/gotests-vim' }
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

        -- Debugging
        use 'mfussenegger/nvim-dap'

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
    end)
