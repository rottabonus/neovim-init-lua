local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
                install_path)
    execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'justinmk/vim-dirvish'

    --haskell language server
    use {
      'autozimu/LanguageClient-neovim',
      branch = 'next',
      run = 'bash install.sh',
      config = function()
            vim.cmd [[
                nnoremap <F5> :call LanguageClient_contextMenu()<CR>
                map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
                map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
                map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
                map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
                map <Leader>lb :call LanguageClient#textDocument_references()<CR>
                map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
                map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
            ]]
        end
  }

    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
          require('lualine').setup{
            options = {
              theme = 'gruvbox',
              section_separators = {'', ''},
              component_separators = {'', ''},
              icons_enabled = true,
            },
            sections = {
              lualine_a = { {'mode', upper = true} },
              lualine_b = { {'branch', icon = ''} },
              lualine_c = { {'filename', file_status = true}, { 'diagnostics', sources = { 'coc' } } },
              lualine_x = { 'encoding', 'fileformat', 'filetype' },
              lualine_y = { 'progress' },
              lualine_z = { 'location'  },
            },
            inactive_sections = {
              lualine_a = {  },
              lualine_b = {  },
              lualine_c = { 'filename' },
              lualine_x = { 'location' },
              lualine_y = {  },
              lualine_z = {   }
            },
            extensions = { 'fugitive' }
        }
      end
    }

    use {
        'mhinz/vim-startify',
    	  config = function()
            vim.g['startify_change_to_vcs_root'] = 1
            vim.g['startify_change_to_dir'] = 0
        end
	  }

   use {
        'junegunn/goyo.vim',
        config = 'vim.cmd[[nnoremap <leader>o :Goyo<CR>]]'
    }

    use 'tpope/vim-repeat'
    use 'tpope/vim-eunuch'
    use 'tpope/vim-rsi'
    use 'tpope/vim-abolish'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use {
        'tpope/vim-fugitive',
        config = function()
          vim.cmd [[
              nnoremap <leader>gdm :Gdiff master<CR>
              nnoremap <leader>gdi :Gdiff<CR>
              nnoremap <leader>gs :Gstatus<CR>
              nnoremap <leader>gb :Gblame<CR>
              nnoremap <leader>gw :Gwrite<CR>
              nnoremap <leader>gr :Ggrep<Space>
              nnoremap <leader>gc :G commit<CR>
          ]]
        end
    }

    use 'preservim/vimux'

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function()
            vim.cmd [[
                nnoremap <leader>ff <cmd>Telescope find_files<cr>
                nnoremap <leader>fg <cmd>Telescope live_grep<cr>
                nnoremap <leader>fb <cmd>Telescope buffers<cr>
                nnoremap <leader>fh <cmd>Telescope help_tags<cr>
                nnoremap <leader>fq <cmd>Telescope quickfix<cr>
                nnoremap <leader>fm <cmd>Telescope marks<cr>
                nnoremap ; <cmd>Telescope git_files<cr>
            ]]
        end
    }

    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require'colorizer'.setup() end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            vim.cmd [[
      TSUpdate
    ]]
        end,
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
                highlight = {enable = true}
            }
        end
    }

    -- Are these used?
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        requires = {'nvim-treesitter/nvim-treesitter'},
        config = function()
            require'nvim-treesitter.configs'.setup {
                textobjects = {
                    select = {
                        enable = true,
                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",

                        }
                    },
                    swap = {
                        enable = true,
                        swap_next = {["<leader>s"] = "@parameter.inner"},
                        swap_previous = {["<leader>S"] = "@parameter.inner"}
                    },
                    move = {
                        enable = true,
                        goto_next_start = {
                            ["]]"] = "@function.outer",
                            ["]c"] = "@class.outer"
                        },
                        goto_next_end = {
                            ["]["] = "@function.outer",
                            ["]C"] = "@class.outer"
                        },
                        goto_previous_start = {
                            ["[["] = "@function.outer",
                            ["[c"] = "@class.outer"
                        },
                        goto_previous_end = {
                            ["[]"] = "@function.outer",
                            ["[C"] = "@class.outer"
                        }
                    }
                }
            }
        end
    }

    -- js/ts [[[
    use {
        'pangloss/vim-javascript',
        opt = true,
        ft = {'javascript', 'typescript', 'typescriptreact'}
    }
    use {
        'MaxMEllon/vim-jsx-pretty',
        opt = true,
        ft = {'javascript', 'typescript', 'typescriptreact'}
    }
    use {
        'HerringtonDarkholme/yats.vim',
        opt = true,
        ft = {'javascript', 'typescript', 'typescriptreact'}
    }
    use {
        'windwp/nvim-ts-autotag',
        opt = true,
        ft = {'javascript', 'typescript', 'typescriptreact'},
        requires = {'nvim-treesitter/nvim-treesitter'},
        config = function() require('nvim-ts-autotag').setup() end
    }
    use {
        'neoclide/coc.nvim',
        branch = 'release',
        opt = true,
        ft = {'javascript', 'typescript', 'typescriptreact', 'haskell', 'javascriptreact', 'java'},
        run = function() vim.cmd [[CocInstall coc-tsserver], [CocInstall coc-java]] end,
        config = function()
            vim.cmd [[
      autocmd CursorHold * silent call CocActionAsync('highlight')

      nmap <leader>ak <Plug>(coc-diagnostic-prev)
      nmap <leader>aj <Plug>(coc-diagnostic-next)

      nmap <silent> gd <Plug>(coc-definition)
      nmap <silent> gy <Plug>(coc-type-definition)
      nmap <silent> gi <Plug>(coc-implementation)
      nmap <silent> gr <Plug>(coc-references)
      nmap <silent> K :call CocActionAsync('doHover')<cr>
   ]]
        end
    }
    -- ]]]

    use {
        'TimUntersberger/neogit',
        config = function()
            local neogit = require('neogit')
            neogit.setup {}
        end
    }

    use {
        "npxbr/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"},
        config = function()
            vim.g['gruvbox_contrast_dark'] = 'soft'
            vim.cmd [[colo gruvbox]]
        end
    }

    use {
        'savq/melange'
        -- config = 'vim.cmd[[colo melange]]'
    }

    use "tversteeg/registers.nvim"

    use {
        'npxbr/glow.nvim',
        opt = true,
        ft = 'markdown',
        config = function()
            vim.cmd [[
      nnoremap <leader>p :Glow<CR>
    ]]
        end
    }

    use {'mhinz/vim-signify'}

    use {
        'edluffy/specs.nvim',
        config = function()
            require('specs').setup {
                show_jumps = true,
                min_jump = 30,
                popup = {
                    delay_ms = 0, -- delay before popup displays
                    inc_ms = 10, -- time increments used for fade/resize effects
                    blend = 40, -- starting blend, between 0-100 (fully transparent), see :h winblend
                    width = 10,
                    winhl = "PMenu",
                    fader = require('specs').linear_fader,
                    resizer = require('specs').shrink_resizer
                }
            }
        end
    }


    
    use 'ryanoasis/vim-devicons'
end)
