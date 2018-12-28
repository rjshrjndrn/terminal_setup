set encoding=utf-8

call plug#begin('~/.vim/bundle')

" On-demand loading
Plug 'scrooloose/nerdtree'

" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
" LanguageServer client for NeoVim.
Plug 'autozimu/LanguageClient-neovim', {
\ 'branch': 'next',
\ 'do': 'bash install.sh',
\ }

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-go'

Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chase/vim-ansible-yaml'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'vim-scripts/vim-auto-save'
Plug 'nvie/vim-flake8'
" Initialize plugin system
call plug#end()

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

 " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
    " found' messages
    set shortmess+=c

    " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
    inoremap <c-c> <ESC>

    " When the <Enter> key is pressed while the popup menu is visible, it only
    " hides the menu. Use this mapping to close the menu and also start a new
    " line.
    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

    " Use <TAB> to select the popup menu:
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    " wrap existing omnifunc
    " Note that omnifunc does not run in background and may probably block the
    " editor. If you don't want to be blocked by omnifunc too often, you could
    " add 180ms delay before the omni wrapper:
    "  'on_complete': ['ncm2#on_complete#delay', 180,
    "               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
    au User Ncm2Plugin call ncm2#register_source({
            \ 'name' : 'css',
            \ 'priority': 9, 
            \ 'subscope_enable': 1,
            \ 'scope': ['css','scss'],
            \ 'mark': 'css',
            \ 'word_pattern': '[\w\-]+',
            \ 'complete_pattern': ':\s*',
            \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
            \ })



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

function! FugDel()
    :bdelete fugitive://*
endfunction

" Commands
command! BufOnly call BufOnly()
" 
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

" Folding
" au BufNewFile,BufRead *.py,*.go set foldmethod=indent 
vnoremap <silent> <space> :fold<CR>
nnoremap <silent> <space> za<CR>


"fugitive vim
nnoremap gw :Gwrite<Enter>
nnoremap gs :Gstatus<Enter>
nnoremap gc :Gcommit<Enter>
nnoremap gp :Gpush
nnoremap gca :Gcommit --amend
function! Gfl()
    :Gfetch | git rebase
endfunction

nnoremap gpl :Gpull --rebase
nnoremap gfl :call Gfl()
nnoremap gl :Glog -- % --

nnoremap <silent> <leader>fd :call FugDel()<CR>

" Commenting for fugitive commit session
" will take branch name as #Issue-number
let @w='5G$vByggIIssue #000 feat: pggA'
let @e='ggIIssue #000 feat: '
let @r='ggIIssue #000 chore: '

" Change ansible from old = to new : form
let @q='ff=s: f=Bi@q[b,qjjjjjjjj[b'

colorscheme gruvbox
set background=dark

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
" }}}


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

" Enabling mouse in auo mode
set mouse=a

" Terraform variables
let g:terraform_fmt_on_save=1
let g:terraform_fold_sections=1
let g:terraform_align=1

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
    nnoremap <silent> ]r 0f-WvEy:find roles/0/tasks/main.yml 
augroup END

" start terminal in insert mode
if has('nvim')
    autocmd TermOpen term://* startinsert
    set termguicolors
endif
"
"}}}

syn on
