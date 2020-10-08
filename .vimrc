syntax on

"install plug-vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')
" Appearence {{{ "
Plug 'itchyny/lightline.vim'		" UI
Plug 'ap/vim-buftabline'		" buffers to tabline
Plug 'gruvbox-community/gruvbox'
Plug 'mhinz/vim-startify'

" }}} Appearence "

Plug 'scrooloose/nerdtree'		" NERD Tree
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}} " Completion as in vscode
Plug 'Xuyuanp/nerdtree-git-plugin' 	" show git status in Nerd tree
Plug 'preservim/nerdcommenter' " comments code
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
"Plug 'sheerun/vim-polyglot' "all lang packs :)
Plug 'qpkorr/vim-bufkill'
"JS {{{
Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'posva/vim-vue'
Plug 'prettier/vim-prettier'
Plug 'dense-analysis/ale' "ES-Lint
Plug 'pangloss/vim-javascript'
Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascript.jsx','typescript'],  'do': 'make install' }
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'SirVer/ultisnips'
Plug 'albanm/vuetify-vim'
"}}}
": Latex{{{
Plug 'lervag/vimtex'

"}}}
" Markdown {{{
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
"}}}
" GIT {{{
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" }}}

Plug 'ryanoasis/vim-devicons' " icons

call plug#end()

" Globals
let mapleader = " "
let g:filetype = 'on'
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
" auto folds
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-html', 
  \ 'coc-css', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-emoji',
  \ ]

"===================================================
" config 
" =================================================
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set hidden
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set autoread
set backspace=indent,eol,start




" Windows {{{
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wl :wincmd l<CR>
nnoremap <leader>ws :split<CR>
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>wd :hide<CR>
" }}}
"
"Buffers {{{
nnoremap <leader>bs :w<CR>
nnoremap <leader>bk :BD!<CR>
nnoremap <leader>bd :BD<CR>
nnoremap <leader>bh :bp<CR>
nnoremap <leader>bl :bn<CR>
nnoremap <leader>br! :e<CR>
"}}}

"Tabs {{{
nnoremap <leader><tab>j :tabprevious<CR>
nnoremap <leader><tab>k :tabnext<CR>
nnoremap <leader><tab>l :tablast<CR>
nnoremap <leader><tab>d :tabclose<CR>
nnoremap <leader><tab>n :tabnew<CR>
"}}}

" Files{{{
nnoremap <leader>op :NERDTreeToggle .<CR>
nnoremap <leader>fp :e ~/.vimrc<CR>
" }}

"Open {{{
nnoremap <leader>oT :term<CR>
" }}}

" Other {{{
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>. :Ranger<CR>

 "extras
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-g> <C-\><C-n>
" }}}

" key bindings {{{
" }}}

" coc config
" ======
" use tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"use enter to confirm completion
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Prettier {{{
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
" }}}

autocmd FileType vue syntax sync fromstart	" fix sync in vue files

""auto complete for omnifunction
filetype plugin on
set omnifunc=youcompleteme#CompleteFunc

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

"set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

" {{{ UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger="<>"
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" }}}


" Latex{{{
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
" }}}
