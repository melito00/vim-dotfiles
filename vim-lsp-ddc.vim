lang en_US.UTF-8

" ------------------------------------------------------------------------------
" For vim-plug
" {{{
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
" Docs
Plug 'vim-jp/vimdoc-ja'

Plug 'vim-denops/denops.vim'

Plug 'vim-skk/denops-skkeleton.vim'

if has('nvim')
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
else
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
endif

Plug 'Shougo/pum.vim'
Plug 'Shougo/ddc.vim'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'

Plug 'Shougo/ddc-cmdline'
Plug 'Shougo/ddc-cmdline-history'
Plug 'Shougo/ddc-around'
Plug 'tani/ddc-fuzzy'

if has('nvim')
  Plug 'Shougo/ddc-nvim-lsp'
else
  Plug 'shun/ddc-vim-lsp'
endif

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
"}}}

" ------------------------------------------------------------------------------
" Options
" {{{
set nocompatible

set fileformats=unix,dos,mac
set encoding=utf-8
set fileencoding=utf-8
scriptencoding=utf-8
"set fileencodings=euc-jp,cp932,iso-2022-jp
"set fileencodings=iso-2022-jp,euc-jp,cp932
set fileencodings=iso-2022-jp,utf-8,euc-jp,cp932

set ambiwidth=single
set nobackup
set belloff=all
set backspace=""
set cursorline
set expandtab
set foldlevel=1
set nofoldenable
set foldmethod=indent
set hlsearch
set noincsearch
set laststatus=2
set modeline
set modelines=5
set ruler
set showcmd
set noshowmode
set shiftwidth=2
set noshowmatch
set softtabstop=2
set tabstop=2
set noundofile

set directory=$HOME/.vim/tmp
set wildmode=longest:full
set wildmenu
set iminsert=0
set imsearch=0

set mouse-=a " Disable automatic visual mode using mouse

"set statusline=%<%F\ %y%{'['.(&fenc!=''?&fenc:&enc).'\|'.&ff.']'}\ \ %l/%L\ (%P)%m%=%{strftime(\"%Y/%m/%d\ %H:%M\")}

"}}}

" Required:
filetype plugin indent on
syntax enable

set background=dark

" ------------------------------------------------------------------------------
" LSP
" {{{
if has('nvim')
lua << EOF
require("nvim-lsp-installer").setup({
  ensure_installed = {},
  automatic_installation = false
})
local lspconfig = require("lspconfig")

local function on_attach(client, bufnr)
  -- set up buffer keymaps, etc.
end

-- lspconfig.sumneko_lua.setup { on_attach = on_attach }
-- lspconfig.tsserver.setup { on_attach = on_attach }
EOF
endif
" }}}

" ------------------------------------------------------------------------------
" ddc
" For command line completion
if 0
call ddc#custom#patch_global('autoCompleteEvents', [
  \ 'InsertEnter', 'TextChangedI', 'TextChangedP',
  \ 'CmdlineEnter', 'CmdlineChanged',
  \ ])

function! CommandlinePost() abort
  cunmap <Tab>
  cunmap <S-Tab>
  cunmap <C-y>
  cunmap <C-e>

  if exists('b:prev_buffer_config')
    call ddc#custom#set_buffer(b:prev_buffer_config)
    unlet b:prev_buffer_config
  else
    call ddc#custom#set_buffer({})
  endif
endfunction

function! CommandlinePre() abort
  cnoremap <expr> <Tab>
  \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
  \ ddc#manual_complete()
  cnoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
  cnoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
  cnoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

  if !exists('b:prev_buffer_config')
    let b:prev_buffer_config = ddc#custom#get_buffer()
  endif
  call ddc#custom#patch_buffer('sources', ['cmdline', 'cmdline-history', 'around'])
  autocmd User DDCCmdlineLeave ++once call CommandlinePost()
  autocmd InsertEnter <buffer> ++once call CommandlinePost()

  call ddc#enable_cmdline_completion()
endfunction

nnoremap : <Cmd>call CommandlinePre()<CR>:
endif
 
" skkelton
imap <C-j> <Plug>(skkeleton-toggle)
cmap <C-j> <Plug>(skkeleton-toggle)

call skkeleton#config({
  \ 'globalJisyo': '~/.skkdic/SKK-JISYO.L',
  \ 'useSkkServer': v:true,
  \ 'eggLikeNewline': v:true,
  \ 'showCandidatesCount': 2
  \ })

if has('nvim')
  call ddc#custom#patch_global('sources', ['around', 'nvim-lsp', 'skkeleton'])
else
  call ddc#custom#patch_global('sources', ['skkeleton'])
endif
call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('sourceOptions', {
  \ '_': {
  \   'matchers': ['matcher_fuzzy'],
  \   'sorters': ['sorter_fuzzy'],
  \   'converters': ['converter_fuzzy']
  \ },
  \ 'nvim-lsp': {
  \    'mark': 'L',
  \    'forceCompletionPattern': '\.\w*|:\w*|->\w*'
  \ },
  \ 'skkeleton': {
  \   'mark': 'skkeleton',
  \   'matchers': ['skkeleton'],
  \   'sorters': []
  \ },
  \ })

" pum.vim
" inoremap <Tab>   <Cmd>call pum#map#insert_relative(+1)<CR>
" inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
" inoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
" inoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
" inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
" inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>
" inoremap <PageDown> <Cmd>call pum#map#insert_relative_page(+1)<CR>
" inoremap <PageUp>   <Cmd>call pum#map#insert_relative_page(-1)<CR>

inoremap <silent><expr> <Tab>
  \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
  \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
  \ '<TAB>' : ddc#manual_complete()
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

" vim: ft=vim foldmethod=marker:
