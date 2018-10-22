set encoding=utf-8

" Plugins {{{
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')


" Theme
" Plugin 'lifepillar/vim-solarized8'
Plugin 'morhetz/gruvbox'
" Plugins
Plugin 'tpope/vim-dispatch'
Plugin 'radenling/vim-dispatch-neovim'
Plugin 'tpope/vim-unimpaired'
Plugin 'junegunn/fzf'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-obsession'
Plugin 'valloric/youcompleteme'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'gmarik/Vundle.vim'
Plugin 'chase/vim-ansible-yaml'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'wincent/ferret'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'nvie/vim-flake8'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-rhubarb'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'easymotion/vim-easymotion'
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

" All of your Plugins must be added before the following line
call vundle#end()            " required
" }}}

filetype plugin indent on    " required syn on NoMatchParen

" Custom changes
" remapping leader
let mapleader = ','
set bs=eol,start,indent
set ic is scs

" ignoring changes while changing buffers
set hidden

" Display all matching while tabbing
set wildmenu title diffopt+=vertical

" including childirs
" Especially for ansible roles
set path+=**

"custom tab space
set tabstop=4 expandtab shiftwidth=4
set nu

" Custom Undo
set undofile
if !has('nvim')
    set undodir=~/.vim/undo
endif

augroup vimrc
    autocmd!
    autocmd BufWritePre /tmp/* setlocal noundofile
augroup END
"""""""""""""""""""""""""
" Plugin Configs

"let g:auto_save = 1
let g:auto_save_noupdatetime = 1
let g:auto_save_in_insert_mode = 0

" Functions
function! Term()
  exec winheight(0)/4."split" | terminal
endfunction

function! BufOnly()
    :%bd | e#
endfunction

function! GlogThis()
    :Glog -- % | copen<CR>
endfunction

" Commands
command! BufOnly call BufOnly()
" keyboad mappings {{{
" visual select
vnoremap // "zy/<C-R>z<CR>

" Switch windows

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
if has('nvim')
    " Escape mode
    tnoremap <C-b><C-b> <C-\><C-n>
    " shell jumping
    tnoremap <c-h> <c-\><c-n><c-w>h
    tnoremap <c-j> <c-\><c-n><c-w>j
    tnoremap <c-k> <c-\><c-n><c-w>k
    tnoremap <c-l> <c-\><c-n><c-w>l
endif

" Quit
nnoremap <leader>w :w<Enter>
nnoremap <leader>q :q<Enter>
nnoremap <leader>wq :wq<Enter>
nnoremap <leader>1q :q!<Enter>

" Ctrl+a to select all
nnoremap <C-a> <esc>ggVG<CR>

" Folding
" au BufNewFile,BufRead *.py,*.go set foldmethod=indent 
nnoremap <space> za
nnoremap <S-space> zA


"fugitive vim
nnoremap gw :Gwrite<Enter>
nnoremap gs :Gstatus<Enter>
nnoremap gc :Gcommit<Enter>
nnoremap gp :Gpush
nnoremap gca :Gcommit --amend
function! Gpl()
    :Gfetch | git rebase
endfunction

nnoremap gpl :call Gpl()
nnoremap gl :Glog -- % --

autocmd BufReadPost fugitive://* set bufhidden=delete
" Commenting for fugitive commit session
" will take branch name as #Issue-number
let @e='5G$vByggIIssue #0000 feat: pggA'

" Change ansible from old = to new : form
let @q='ff=s: f=Bi@q[b,qjjjjjjjj[b'

"YouCompleteMe
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_seed_identifiers_with_syntax = 1
nnoremap gr :YcmCompleter GetDoc<Enter>
let g:ycm_autoclose_preview_window_after_completion=1

"NERDTreefind
nnoremap <silent> ff :NERDTreeFind <Enter>
"NERDTree toggle
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" Markdown web preview
nnoremap <leader>md :Dispatch !bash ~/grip.sh start "%" <CR>
" Killing grip md server
nnoremap <leader>mk :!bash ~/grip.sh stop <enter>

" Write files without permission
nnoremap sw :w !sudo tee % > /dev/null

" toggle hls
nnoremap <silent> <leader>h :set hls!<CR>

" Copying to system clipboard
vnoremap Y "+y
nnoremap <C-p> :<C-u>FZF<cr>

if has('nvim')
     nnoremap <expr> <leader>t ":call Term()\<CR>"
endif

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
augroup filetype_yml
    autocmd!
    au Filetype yaml set tabstop=2 expandtab shiftwidth=2 filetype=ansible " foldmethod=indent fml=10
    nnoremap <silent> ]r 0f-WvEy:e ./roles/0/tasks/main.yml 
augroup END

" start terminal in insert mode
if has('nvim')
    autocmd!
    autocmd TermOpen,BufEnter term://* startinsert
    set termguicolors
endif

"}}}

colorscheme gruvbox

"airline bar
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='angr'

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

set background=dark
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_italicize_comments = 1
