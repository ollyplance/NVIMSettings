" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    " Auto-Pairs
    Plug 'LunarWatcher/auto-pairs'
    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'preservim/nerdtree'
    Plug 'itchyny/lightline.vim'
    " If you want to have icons in your statusline choose one of these
    Plug 'kyazdani42/nvim-web-devicons'
    "Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'sharkdp/fd'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'BurntSushi/ripgrep'
    "Trouble
    Plug 'folke/trouble.nvim'
    "Gitsigns
    Plug 'lewis6991/gitsigns.nvim'
    " Null-ls
    Plug 'jose-elias-alvarez/null-ls.nvim'
    " Toggle-term
    Plug 'akinsho/toggleterm.nvim'
    " lspconfig
    Plug 'neovim/nvim-lspconfig'
    "file view
    Plug 'kyazdani42/nvim-web-devicons' 
    " for file icons
    Plug 'kyazdani42/nvim-tree.lua'
    " for key support
    Plug 'folke/which-key.nvim'
    " CTags
    Plug 'universal-ctags/ctags'
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    " Start screen
    Plug 'mhinz/vim-startify'
    " Comments
    Plug 'numToStr/Comment.nvim'
    " Work with import-sort
    Plug 'ruanyl/vim-sort-imports'
call plug#end()

"Config section

if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme rose-pine
