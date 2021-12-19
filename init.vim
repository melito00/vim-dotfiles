"

let s:username = 'kyamada'
if has('win32')
  let s:userhome = 'c:/Users/' . s:username
  let s:home = 'c:/z/home/kyamada'
else
  let s:home = $HOME
endif
echomsg s:home

let g:is_nvim = has('nvim')
let g:is_vim8 = v:version >= 800 ? 1 : 0

" I do not want to use hidden directory on Windows unless XDG_* is defined
" {{{
if has('win32')
  set shellslash
  if g:is_nvim
    if $XDG_CONFIG_HOME == ""
      let s:config_home = expand("~/config/nvim")
    else
      let s:config_home = expand("$XDG_CONFIG_HOME/nvim")
    endif
    if $XDG_CACHE_HOME == ""
      let s:cache_home = expand("~/cache")
    else
      let s:cache_home = expand("$XDG_CACHE_HOME")
    endif
  else
    let s:config_home = expand("~/vimfiles")
    let s:cache_home = expand("~/cache")
  endif
else
  if g:is_nvim
    if $XDG_CONFIG_HOME == ""
      let s:config_home = expand("~/.config/nvim")
    else
      let s:config_home = expand("$XDG_CONFIG_HOME/nvim")
    endif
    if $XDG_CACHE_HOME == ""
      let s:cache_home = expand("~/.cache")
    else
      let s:cache_home = expand("$XDG_CACHE_HOME")
    endif
  else
    let s:config_home = expand("~/.vim")
    let s:cache_home = expand("~/.cache")
  endif
endif
"}}}

" For checking script local variables
" let g:config_home = s:config_home
" let g:cache_home = s:cache_home

let mapleader = "\<Space>"
" let mapleader = ","

if has('win32')
  let g:python3_host_prog = "C:/Users/kyamada/scoop/shims/python.cmd"
endif

lang en_US.UTF-8

" ------------------------------------------------------------------------------
" Options
" {{{
set fileformats=unix,dos,mac
set encoding=utf-8
set fileencoding=utf-8
scriptencoding=utf-8
"set fileencodings=euc-jp,cp932,iso-2022-jp
"set fileencodings=iso-2022-jp,euc-jp,cp932
set fileencodings=iso-2022-jp,utf-8,euc-jp,cp932

set ambiwidth=double
set nobackup
set belloff=all
set backspace=""
set cmdheight=2
set cursorline
set expandtab
set foldlevel=1
set nofoldenable
set foldmethod=indent
set hidden
set hlsearch
set noincsearch
set laststatus=2
set modeline
set modelines=5
set ruler
set showcmd
set signcolumn=yes
set noshowmode
set shiftwidth=2
set noshowmatch
set softtabstop=2
set showtabline=2
set shortmess+=c
set tabstop=2
set noundofile
set updatetime=300 " default is 4000

set directory=$HOME/.vim/tmp
set wildmode=longest:full
set wildmenu
set nowritebackup
set iminsert=0
set imsearch=0

set mouse-=a " Disable automatic visual mode using mouse

"set statusline=%<%F\ %y%{'['.(&fenc!=''?&fenc:&enc).'\|'.&ff.']'}\ \ %l/%L\ (%P)%m%=%{strftime(\"%Y/%m/%d\ %H:%M\")}

"}}}

" ------------------------------------------------------------------------------
" For vim-plug
" {{{
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
  " Docs
Plug 'vim-jp/vimdoc-ja'

" Colorscheme
Plug 'jnurmine/Zenburn'
Plug 'cocopon/iceberg.vim'
Plug 'ulwlu/elly.vim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'altercation/vim-colors-solarized'
" Plug 'fcpg/vim-orbital'
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'sainnhe/gruvbox-material'

" Color preview
" Plug 'gorodinskiy/vim-coloresque'

" Status Line
Plug 'itchyny/lightline.vim'
Plug 'gkeep/iceberg-dark'

" Text Edit
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
" Auto close brackets
" Plug 'cohama/lexima.vim'
Plug 'jiangmiao/auto-pairs'

" Move cursor quickly
"Plug 'easymotion/vim-easymotion'

" Interface
" Plug 'Shougo/denite.nvim'
" Plug 'Shougo/unite.vim'
" Plug 'junegunn/fzf.vim'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'mattn/ctrlp-ghq'

" File Manager
" Plug 'preservim/nerdtree'
" Fern
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'

" Plug 'Shougo/defx.nvim'
" if !has('nvim'
"     Plug 'roxma/nvim-yarp'
"     Plug 'roxma/vim-hug-neovim-rpc'
" endif

" Git
" Plug 'lambdalisue/gina.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" LSP

" Programming Languages
" bash
" Plug 'itspriddle/vim-shellcheck'
" Plug 'z0mbix/vim-shfmt'

" Deno
Plug 'vim-denops/denops.vim'

" fish
" Plug 'dag/vim-fish'

" Go
" Plug 'fatih/vim-go'

" i3-wm
" Plug 'mboughaba/i3config.vim'

" PowerShell
" Plug 'zigford/vim-powershell'

" Python
" Plug 'davidhalter/jedi-vim'

" Rust
Plug 'rust-lang/rust.vim'

" Complete
" Plug 'Shougo/deoplete.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-buffer'

"
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Syntastic
Plug 'vim-syntastic/syntastic'

Plug 'nvim-treesitter/nvim-treesitter'
" Translate
" Plug 'koron/codic-vim'

" HTML/CSS
" Plug 'mattn/emmet-vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
"}}}

" Required:
filetype plugin indent on
syntax enable


" ------------------------------------------------------------------------------
" Colorscheme
" autocmd ColorScheme * highlight Comment ctermfg=22 guifg=#008800
set background=dark
"colorscheme zenburn
" colorscheme gruvbox-material'
colorscheme iceberg

" ------------------------------------------------------------------------------

" set cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
" autocmd InsertEnter * highlight CursorLine guibg=#000050 guifg=fg
" autocmd InsertLeave * highlight CursorLine guibg=#004000 guifg=fg

" ------------------------------------------------------------------------------
au FileType ruby :set nowrap tabstop=2 tw=0 sw=2 expandtab
au FileType eruby :set nowrap tabstop=2 tw=0 sw=2 expandtab
au FileType yaml :set nowrap tabstop=2 tw=0 sw=2 expandtab noautoindent
au FileType xml  :set nowrap tabstop=2 tw=0 sw=2 expandtab
au FileType scala  :set nowrap tabstop=2 tw=0 sw=2 expandtab
au FileType scss  :set nowrap tabstop=2 tw=0 sw=2 expandtab
au FileType html  :set nowrap tabstop=2 tw=0 sw=2 expandtab

" ------------------------------------------------------------------------------
"  For golang
"  {{{
autocmd FileType go nmap <Leader>b  <Plug>(go-build)
autocmd FileType go nmap <Leader>r  <Plug>(go-run)
"}}}

" let g:go_list_type = "quickfix"
" ------------------------------------------------------------------------------
"  From someone's blog
" Open junk file."{{{
command! -nargs=0 JunkFile call s:open_junk_file()
function! s:open_junk_file()
  let l:junk_dir = $HOME . '/memo-rep'. strftime('/%Y/%m')
  if !isdirectory(l:junk_dir)
    call mkdir(l:junk_dir, 'p')
  endif

  let l:filename = input('Junk Code: ', l:junk_dir.strftime('/%Y-%m-%d.'))
  if l:filename != ''
    execute 'edit ' . l:filename
  endif
endfunction"}}}
" ------------------------------------------------------------------------------
"autocmd! BufNewFile,BufRead *.scala setfiletype scala

" ------------------------------------------------------------------------------
"  Normal mode map
"  {{{
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap j gj
nnoremap k gk

nnoremap Q :confirm q!

nnoremap qj  :cnext<Return>
nnoremap qk  :cprevious<Return>
"nnoremap qr  :crewind<Return>
"nnoremap qK  :cfirst<Return>
"nnoremap qJ  :clast<Return>
"nnoremap qf  :cnfile<Return>
"nnoremap qF  :cpfile<Return>
"nnoremap ql  :clist<Return>
"nnoremap qq  :cc<Return>
"nnoremap qo  :copen<Return>
"nnoremap qc  :cclose<Return>
"nnoremap qw  :cwindow<Return>
"nnoremap qp  :colder<Return>
"nnoremap qn  :cnewer<Return>
"nnoremap qm  :make<Return>
"nnoremap qM  :make<Space>
"nnoremap qg  :grep<Space>
nnoremap q   <Nop>

nnoremap Y y$

nnoremap <leader>ev :tabedit $MYVIMRC<CR>
nnoremap <silent> <leader>a :<C-u>nohlsearch<CR><C-l>

" For manupilate buffers
nnoremap <leader>j :bprevious<CR>
nnoremap <leader>k :bnext<CR>
nnoremap <leader>h :bfirst<CR>
nnoremap <leader>l :blast<CR>

nnoremap <leader>i :ls<CR>:b<Space>
nnoremap <leader>dd :bdelete<CR>

nnoremap <leader>1 :1gt
nnoremap <leader>2 :2gt
nnoremap <leader>3 :3gt
nnoremap <leader>4 :4gt

nnoremap <leader>yy :normal "+yy<CR>
"}}}

" ------------------------------------------------------------------------------
"  Insert mode map
"  {{{
imap jj <ESC>

inoremap <C-a> <Esc>I
inoremap <C-e> <Esc>A

inoremap <C-b> <Left>
inoremap <C-f> <Right>

"inoremap <C-h> <Left>
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-l> <Right>
"}}}

" ------------------------------------------------------------------------------
"  Command mode map
"  {{{
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
"}}}

" ------------------------------------------------------------------------------
"  Visual mode map
"  {{{
if 1
"  let mapleader = ","
  vmap <Leader>y "+y
  vmap <Leader>d "+d
  nmap <Leader>p "+p
  nmap <Leader>P "+P
  vmap <Leader>p "+p
  vmap <Leader>P "+P
endif
"  }}}

xnoremap <leader>yy :normal gv"+y<CR>

if 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,ColorScheme * :hi IndentGuidesOdd ctermbg=darkgray
autocmd VimEnter,ColorScheme * :hi IndentGuidesEven ctermbg=gray
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1
endif

let s:hostname = substitute(hostname(), '\.\_.*$', '', '')
let s:host_vimrc = $HOME . '/' . '.vimrc' . '.' . s:hostname
if filereadable(s:host_vimrc)
  execute 'source ' . s:host_vimrc
endif

let g:vimsyn_embed='lPr'

" ------------------------------------------------------------------------------

" Filer :: Fern
let g:fern#renderer = 'nerdfont'
let g:fern#default_hidden = 1
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END
nnoremap <leader>ff :<C-u>Fern . -reveal=% -drawer -toggle -width=40<CR>

" Git
" g]で前の変更箇所へ移動する
nnoremap g[ :GitGutterPrevHunk<CR>
" g[で次の変更箇所へ移動する
nnoremap g] :GitGutterNextHunk<CR>
" ghでdiffをハイライトする
nnoremap gh :GitGutterLineHighlightsToggle<CR>
" gpでカーソル行のdiffを表示する
nnoremap gp :GitGutterPreviewHunk<CR>
" 記号の色を変更する
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=blue
highlight GitGutterDelete ctermfg=red

"" 反映時間を短くする(デフォルトは4000ms)
set updatetime=250

" LSP
"{{{

if 0
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<Space>wa', '<Cmd>lua vim.lsp.buf.add_workspace_holder()<CR>', opts)
  buf_set_keymap('n', '<Space>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<Space>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<Space>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<Space>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<Space>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<Cmd>lua vimlsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<Space>e', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<Space>q', '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<Space>f', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end
EOF
endif


" Clojure

" Lua
" {{{
" }}}

" Rust

" TypeScript


highlight LspDiagnosticsSignError ctermbg=9 ctermfg=15
highlight LspDiagnosticsSignHint ctermbg=142 ctermfg=15

"}}}

if 0
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
endif

" nvim-treesitter
"
" {{{
if g:is_nvim
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "vue", "ruby" },  -- list of language that will be disabled
  },
}
EOF
endif
" }}}

" Deno
" {{{
" }}}

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" lightline
" Theme : icebergDark, gruvbox
let g:lightline = {
\   'colorscheme': 'gruvbox',
\   'separator': { 'left': "", 'right': "" },
\   'subseparator': {  'left': "", 'right': "" },
\   'active': {
\       'left': [['mode', 'paste'], ['filename', 'readonly', 'modified', 'fugitive']]
\   },
\   'component_function': {
\       'fugitive': 'LightLineFugitive'
\   }
\ }

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? '  '.branch : ''
  endif
  return ''
endfunction

" E0A0:  E0B0:   E0B1:   E0B2:    E0B3: 
" 2B60: ⭠ 2B80 2B81 2B32 2B83

" vim: ft=vim foldmethod=marker:
