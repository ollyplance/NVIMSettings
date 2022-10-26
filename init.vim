source $HOME/.config/nvim/vim-plug/plugins.vim

lua << EOF

require("trouble").setup {}

require('gitsigns').setup()

require('Comment').setup()

require'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "cpp", "html", "javascript", "typescript", "css", "scss"},

  -- Automatically install missing parsers when entering buffer
  auto_install = true,
}

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.completion.spell,
    },
})

require('lspconfig').angularls.setup{}

require('nvim-tree').setup()

require("which-key").setup({})

require("toggleterm").setup({
  open_mapping = [[<C-\>]],
  hide_numbers = true,
	size = 10,
  shade_filetypes = {},
  start_in_insert = true,
  terminal_mappings = true, 
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true,
  float_opts = {
    border = 'double',
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }})

EOF

let g:toggleterm_terminal_mapping = '<C-t>'
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-scssmodules', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-angular']

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Mouse support
set mouse=a

set updatetime=300

" Highlight search results
set hlsearch
set incsearch

" auto + smart indent for code
set autoindent
set smartindent

" Position in code
set number
set ruler

syntax on

" Don't make noise
set visualbell

" Line wrap
set wrap

" Relative line numbers
:set relativenumber

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Remap C-c to <esc>
nmap <c-c> <esc>
imap <c-c> <esc>
vmap <c-c> <esc>
omap <c-c> <esc>

" Shortcut to edit THIS configuration file: (e)dit (c)onfiguration
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>

" Shortcut to source (reload) THIS configuration file after editing it: (s)ource (c)onfiguraiton
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>

" use jk for escape
" http://vim.wikia.com/wiki/Avoid_the_escape_key
inoremap jk <Esc>

" toggle tagbar
nnoremap <silent> <leader>tb :TagbarToggle<CR>

" toggle line numbers
nnoremap <silent> <leader>n :set number! number?<CR>

" toggle line wrap
nnoremap <silent> <leader>w :set wrap! wrap?<CR>

" toggle buffer (switch between current and last buffer)
nnoremap <silent> <leader>bb <C-^>

" go to next buffer
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <C-l> :bn<CR>

" go to previous buffer
nnoremap <silent> <leader>bp :bp<CR>
" https://github.com/neovim/neovim/issues/2048
nnoremap <C-h> :bp<CR>

" close buffer
nnoremap <silent> <leader>bd :bd<CR>

" kill buffer
nnoremap <silent> <leader>bk :bd!<CR>

" list buffers
nnoremap <silent> <leader>bl :ls<CR>
" list and select buffer
nnoremap <silent> <leader>bg :ls<CR>:buffer<Space>

" horizontal split with new buffer
nnoremap <silent> <leader>bh :new<CR>

" vertical split with new buffer
nnoremap <silent> <leader>bv :vnew<CR>

" improved keyboard navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" improved keyboard support for navigation (especially terminal)
" https://neovim.io/doc/user/nvim_terminal_emulator.html
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
nnoremap <silent> <leader>tt :terminal<CR>
nnoremap <silent> <leader>tv :vnew<CR>:terminal<CR>
nnoremap <silent> <leader>th :new<CR>:terminal<CR>
tnoremap <C-x> <C-\><C-n><C-w>q

" Function to trim extra whitespace in whole file
function! Trim()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

command! -nargs=0 Trim call Trim()

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

noremap <Leader>s :update<CR>

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Prettier' to format with Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Find the current buffer in NerdTree
map <leader>r :NERDTreeFind<cr>

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" add cocstatus into lightline
let g:lightline = {
	\ 'colorscheme': 'rosepine',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status'
	\ },
	\ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

let g:import_sort_auto = 1
let g:startify_custom_header = [
\ '',
\ '			  ▒█████   ██▓     ██▓ ██▒   █▓▓█████  ██▀███      ██▓    ▄▄▄       ███▄    █  ▄████▄  ▓█████    ',
\ '			 ▒██▒  ██▒▓██▒    ▓██▒▓██░   █▒▓█   ▀ ▓██ ▒ ██▒   ▓██▒   ▒████▄     ██ ▀█   █ ▒██▀ ▀█  ▓█   ▀    ',
\ '			 ▒██░  ██▒▒██░    ▒██▒ ▓██  █▒░▒███   ▓██ ░▄█ ▒   ▒██░   ▒██  ▀█▄  ▓██  ▀█ ██▒▒▓█    ▄ ▒███      ',
\ '			 ▒██   ██░▒██░    ░██░  ▒██ █░░▒▓█  ▄ ▒██▀▀█▄     ▒██░   ░██▄▄▄▄██ ▓██▒  ▐▌██▒▒▓▓▄ ▄██▒▒▓█  ▄    ',
\ '			 ░ ████▓▒░░██████▒░██░   ▒▀█░  ░▒████▒░██▓ ▒██▒   ░██████▒▓█   ▓██▒▒██░   ▓██░▒ ▓███▀ ░░▒████▒   ',
\ '			 ░ ▒░▒░▒░ ░ ▒░▓  ░░▓     ░ ▐░  ░░ ▒░ ░░ ▒▓ ░▒▓░   ░ ▒░▓  ░▒▒   ▓▒█░░ ▒░   ▒ ▒ ░ ░▒ ▒  ░░░ ▒░ ░   ',
\ '			  ░ ▒ ▒░ ░ ░ ▒  ░ ▒ ░   ░ ░░   ░ ░  ░  ░▒ ░ ▒░   ░ ░ ▒  ░ ▒   ▒▒ ░░ ░░   ░ ▒░  ░  ▒    ░ ░  ░    ',
\ '			 ░ ░ ░ ▒    ░ ░    ▒ ░     ░░     ░     ░░   ░      ░ ░    ░   ▒      ░   ░ ░ ░           ░      ',
\ '			     ░ ░      ░  ░ ░        ░     ░  ░   ░            ░  ░     ░  ░         ░ ░ ░         ░  ░   ',
\ '			                          ░                                                  ░                   ',
\ '']
