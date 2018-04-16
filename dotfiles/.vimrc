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
Plugin 'benmills/vimux'
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Setting seach 
set ic
set smartcase
set is
set hls

" Copying to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Markdown specific highlights
au BufNewFile,BufFilePre,BufRead *.md,*.txt set spell tabstop=2 expandtab shiftwidth=2
au BufNewFile,BufFilePre,BufRead *.md,*.txt let auto_save=1

" Yaml specifics
au BufNewFile,BufFilePre,BufRead *.yml,*.yaml set tabstop=2 expandtab shiftwidth=2 filetype=ansible

"""""""""""""""""""""""""
" Plugin Configs

"let g:auto_save = 1
let g:auto_save_noupdatetime = 1
let g:auto_save_in_insert_mode = 0

" The command to use to format TICKscripts, should not need to be changed
" let g:tick_fmt_command [default="tickfmt"]
 
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
nnoremap <space> zA
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"airline bar
" let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badcat'

"YouCompleteMe
let g:ycm_python_binary_path = '/usr/bin/python3'
nnoremap gr :YcmCompleter GetDoc<Enter>
nnoremap gd :YcmCompleter GoTo<Enter>

" vim theme
colorscheme atom-dark-256

"NERDTreefind
nnoremap ff :NERDTreeFind <Enter>
"NERDTree toggle
nnoremap <C-n> :NERDTreeToggle<CR>

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

"fugitive vim
nnoremap gw :Gwrite<Enter>
nnoremap gs :Gstatus<Enter>
nnoremap gc :Gcommit<Enter>

" Intent
let g:indent_guides_enable_on_vim_startup = 1


"custom file based remapings
au FileType go nmap <leader>r :!go run %<Enter>

" Markdown web preview
nnoremap <leader>md :!bash ~/grip.sh start "%" & <enter>
" Killing grip md server
nnoremap <leader>mk :!bash ~/grip.sh stop <enter>
