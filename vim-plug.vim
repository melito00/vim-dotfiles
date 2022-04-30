" ------------------------------------------------------------------------------
" For vim-plug
" {{{
" Plugins will be downloaded under the specified directory.
"
" For Vim
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"

" For Neovim
" curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" nvim -es -u .config/nvim/init.vim -i NONE -c "PlugInstall" -c "qa"

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
  " Docs
Plug 'vim-jp/vimdoc-ja'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
"}}}
