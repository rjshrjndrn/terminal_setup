set encoding=utf-8

" Plugins {{{
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Theme

Plugin 'gosukiwi/vim-atom-dark'

" Plugins

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'valloric/youcompleteme'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'gmarik/Vundle.vim'
Plugin 'chase/vim-ansible-yaml'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'wincent/ferret'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'nathanielc/vim-tickscript'
Plugin 'nvie/vim-flake8'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-rhubarb'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'yuttie/comfortable-motion.vim'
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

" All of your Plugins must be added before the following line
call vundle#end()            " required
" }}}

filetype plugin indent on    " required
syn on

" Custom changes
" remapping leader
let mapleader = ','
set bs=eol,start,indent

" ignoring changes while changing buffers
set hidden

" Provides tab completion for all file related tasks
set path+=**

" Display all matching while tabbing
set wildmenu
" set title

"custom tab space
set tabstop=4 expandtab shiftwidth=4
set nu

"""""""""""""""""""""""""
" Plugin Configs

"let g:auto_save = 1
let g:auto_save_noupdatetime = 1
let g:auto_save_in_insert_mode = 0

" keyboad mappings {{{
" Switch windows

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"Switch buffers
nnoremap ]t :tabn<Enter>
nnoremap [t :tabp<Enter>
nnoremap [T :tablast<Enter>
nnoremap ]T :tabfirst<Enter>

"Switch buffers
nnoremap ]b :bn<Enter>
nnoremap [b :bp<Enter>
nnoremap [B :blast<Enter>
nnoremap ]B :bfirst<Enter>

" Quit
nnoremap <leader>w :w<Enter>
nnoremap <leader>q :q<Enter>
nnoremap <leader>wq :wq<Enter>
nnoremap <leader>1q :q!<Enter>

" Ctrl+a to select all
nnoremap <C-a> <esc>ggVG<CR>

" To set paste toggle while paste from system clipboard
set pastetoggle=<F5>

" Folding
" au BufNewFile,BufRead *.py,*.go set foldmethod=indent 
nnoremap <space> za
nnoremap <S-space> zA

"fugitive vim
nnoremap gw :Gwrite<Enter>
nnoremap gs :Gstatus<Enter>
nnoremap gc :Gcommit<Enter>
nnoremap gp :Gpush
nnoremap gpl :Gpull
nnoremap gca :Gcommit --amend
nnoremap gpl :Gpull --rebase<CR>

"YouCompleteMe
let g:ycm_python_binary_path = '/usr/bin/python3'
nnoremap gr :YcmCompleter GetDoc<Enter>
nnoremap gd :YcmCompleter GoTo<Enter>

"NERDTreefind
nnoremap ff :NERDTreeFind <Enter>
"NERDTree toggle
nnoremap <C-n> :NERDTreeToggle<CR>

" Markdown web preview
nnoremap <leader>md :!bash ~/grip.sh start "%" & <enter>
" Killing grip md server
nnoremap <leader>mk :!bash ~/grip.sh stop <enter>

" Write files without permission
nnoremap sw :w !sudo tee % > /dev/null

" toggle hls
nnoremap <leader>h :set hls!<CR>

" Copying to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

"}}}

" Autocmd Commands {{{
" Vim
augroup filetype_vim 
    autocmd!
    autocmd Filetype vim,python,sh setlocal foldmethod=marker shiftwidth=4 tabstop =4 
augroup END

" Markdown specific highlights
augroup filetype_md
    autocmd!
    autocmd Filetype markdown,text setlocal spell tabstop=2 expandtab shiftwidth=2 | let auto_save=1
augroup END

" Ansible
augroup filetype_md
    autocmd!
    au Filetype *.yml,*.yaml set tabstop=2 expandtab shiftwidth=2 filetype=ansible foldmethod=indent fml=10
augroup END

"}}}

"airline bar
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badcat'


" vim theme
colorscheme atom-dark-256


" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Intent
let g:indent_guides_enable_on_vim_startup = 1

"custom file based remapings
au FileType go nmap <leader>r :!go run %<Enter>

