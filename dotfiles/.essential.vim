" Plugins
" ----------------- {{{
set nocompatible
set encoding=utf-8
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Plugins

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'chase/vim-ansible-yaml'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'wincent/ferret'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'gosukiwi/vim-atom-dark'
call vundle#end()            " required
" ----------------- }}}

syn on
filetype plugin indent on
let mapleader = ","
colorscheme atom-dark-256
syn on

set hidden nu is scs

" Remappings
" ----------------- {{{
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
" ----------------- }}}

" Autocmd commands
"-----------------------------    {{{
" vim
augroup filetye_vim
	autocmd!
	autocmd Filetype vim setlocal foldmethod=marker shiftwidth=4 tabstop=4 | nnoremap <space> zA
augroup END
" shell
augroup filetye_script
	autocmd!
	autocmd Filetype sh setlocal foldmethod=indent shiftwidth=4 tabstop=4 | nnoremap <space> zA
augroup END
"}}}

" Funtions
"-----------------------------    {{{
function! Hls()
	if &hlsearch
		let &l:hlsearch=0
	else
		let &l:hlsearch=1
	endif
endfunction
function! Git()
	!git rev-parse --abbrev-ref HEAD
endfunction
"}}}
