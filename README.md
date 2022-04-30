
# Prerequisite

  - Nodejs (Use asdf)
  - Python (Use asdf)
  - Deno (Use asdf)

# Share configuration between vim and Neovim

```
mkdir -p ~/.local/share/nvim/site
ln -s ~/.local/share/nvim/site ~/.vim 
ln -s .config/nvim/init.vim .vimrc
```

# Basics

## Plugin Manager

### Vim-Plug
- https://github.com/junegunn/vim-plug
```For Vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa
```

```For Neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim --headless +PlugInstall +qall
```

```For vimrc
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
```

#### Commands
  - :PlugInstall
  - :PlugUpdate
  - :PlugClean

## Colorscheme

## Utilities

## LSP

## Completion

## Snippet

# For FileType

  - Markdown
  - Lisp
  - Python
  - JavaScript
  - TypeScript / Deno
  - Scala
  - Clojure
  - Rust

## Programing Languages

# Filer

# Tools

## Fuzzy Finder

### telescope.nvim

## Git
