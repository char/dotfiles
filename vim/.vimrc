if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'lilydjwg/colorizer'
Plug 'sheerun/vim-polyglot'
Plug 'w0ng/vim-hybrid'

Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'editorconfig/editorconfig-vim'

Plug 'ziglang/zig.vim'

call plug#end()

set ruler
set mouse=a

set tabstop=4
set softtabstop=4
set expandtab

syntax on

autocmd ColorScheme * highlight! Normal ctermbg=NONE guibg=NONE

set background=dark

let g:hybrid_use_Xresources = 1
colorscheme hybrid

filetype indent on

set incsearch
set hlsearch

nnoremap j gj
nnoremap k gk

set number

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

let g:pandoc#syntax#conceal#use = 0

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
vnoremap > >gv
vnoremap < <gv
