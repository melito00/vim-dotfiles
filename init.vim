"

let s:username = 'kyamada'
if has('win32')
  let s:userhome = 'c:/Users/' . s:username
  let s:home = 'c:/z/home/kyamada'
else
  let s:home = $HOME
endif

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

" let mapleader = "\<Space>"
 let mapleader = ","

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
" set updatetime=250
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
" Plug 'tpope/vim-surround'
" Plug 'junegunn/vim-easy-align'
" Auto close brackets
" Plug 'cohama/lexima.vim'
" Plug 'jiangmiao/auto-pairs'

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
" Plug 'lambdalisue/fern.vim'
" Plug 'lambdalisue/fern-git-status.vim'
" Plug 'lambdalisue/nerdfont.vim'
" Plug 'lambdalisue/fern-renderer-nerdfont.vim'
" Plug 'lambdalisue/glyph-palette.vim'

" Plug 'Shougo/defx.nvim'
" if !has('nvim'
"     Plug 'roxma/nvim-yarp'
"     Plug 'roxma/vim-hug-neovim-rpc'
" endif

" Git
" Plug 'lambdalisue/gina.vim'
"Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'

" LSP
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Programming Languages
" bash
" Plug 'itspriddle/vim-shellcheck'
" Plug 'z0mbix/vim-shfmt'

" Deno
" Plug 'vim-denops/denops.vim'

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
" Plug 'rust-lang/rust.vim'

" Complete
" Plug 'Shougo/deoplete.nvim'
" Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/cmp-buffer'

"
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'

" Syntastic
" Plug 'vim-syntastic/syntastic'

if has('nvim')
  Plug 'nvim-treesitter/nvim-treesitter'
endif

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
autocmd FileType ruby :set nowrap tabstop=2 tw=0 sw=2 expandtab
autocmd FileType eruby :set nowrap tabstop=2 tw=0 sw=2 expandtab
autocmd FileType yaml :set nowrap tabstop=2 tw=0 sw=2 expandtab noautoindent
autocmd FileType xml  :set nowrap tabstop=2 tw=0 sw=2 expandtab
autocmd FileType scala  :set nowrap tabstop=2 tw=0 sw=2 expandtab
autocmd FileType scss  :set nowrap tabstop=2 tw=0 sw=2 expandtab
autocmd FileType html  :set nowrap tabstop=2 tw=0 sw=2 expandtab

autocmd BufNewFile,BufRead *.nvim setfiletype vim
" ------------------------------------------------------------------------------
"  For golang
"  {{{
" autocmd FileType go nmap <Leader>b  <Plug>(go-build)
" autocmd FileType go nmap <Leader>r  <Plug>(go-run)
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

nnoremap <Leader>ev :tabedit $MYVIMRC<CR>
nnoremap <silent> <Leader>a :<C-u>nohlsearch<CR><C-l>

" For manupilate buffers
nnoremap <Leader>j :bprevious<CR>
nnoremap <Leader>k :bnext<CR>
nnoremap <Leader>h :bfirst<CR>
nnoremap <Leader>l :blast<CR>

nnoremap <Leader>i :ls<CR>:b<Space>
nnoremap <Leader>dd :bdelete<CR>

" nnoremap <Leader>1 :1gt
" nnoremap <Leader>2 :2gt
" nnoremap <Leader>3 :3gt
" nnoremap <Leader>4 :4gt

nnoremap <Leader>yy :normal "+yy<CR>
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
"  let mapLeader = ","
  vmap <Leader>y "+y
  vmap <Leader>d "+d
  nmap <Leader>p "+p
  nmap <Leader>P "+P
  vmap <Leader>p "+p
  vmap <Leader>P "+P
endif
"  }}}

xnoremap <Leader>yy :normal gv"+y<CR>

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
nnoremap <Leader>ff :<C-u>Fern . -reveal=% -drawer -toggle -width=40<CR>

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

" LSP
"{{{

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <Leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <Leader>f  <Plug>(coc-format-selected)
nmap <Leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<Leader>aap` for current paragraph
xmap <Leader>a  <Plug>(coc-codeaction-selected)
nmap <Leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <Leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <Leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Clojure

" Lua
" {{{
" }}}

" Rust

" TypeScript
"}}}

if 0
" Find files using Telescope command-line sugar.
nnoremap <Leader>ff <cmd>Telescope find_files<cr>
nnoremap <Leader>fg <cmd>Telescope live_grep<cr>
nnoremap <Leader>fb <cmd>Telescope buffers<cr>
nnoremap <Leader>fh <cmd>Telescope help_tags<cr>
endif

" nvim-treesitter
"
" {{{
if g:is_nvim
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
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
