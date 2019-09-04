set encoding=utf-8
" Enabling truecolors
set termguicolors

" Installing Vim Plug
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


"{{{
call plug#begin('~/.vim/bundle')

" On-demand loading
Plug 'scrooloose/nerdtree'

" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" Run gofmt and goimports on save
" autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
" Plug 'ncm2/ncm2-go'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

let b:ale_completion_enabled = 1
Plug 'dense-analysis/ale'
let b:ale_fixers = {
\   'ansible': [
\       'prettier',
\       'remove_trailing_lines',
\       'trim_whitespace',
\   ],
\   'go': ['goimports', 'gofmt'],
\   'javascript': ['eslint'],
\}
let b:ale_linters = {
    \ 'go': ['gopls'],
    \ 'yaml.ansible': ['ansible-lint'],
    \}
let b:ale_fix_on_save = 1

Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'vim-scripts/vim-auto-save'
Plug 'nvie/vim-flake8'
Plug 'wincent/ferret'
Plug 'easymotion/vim-easymotion'

Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-obsession'

Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

Plug 'mattn/emmet-vim', { 'for': 'html,css'}
Plug 'mbbill/undotree'

Plug 'SirVer/ultisnips'
Plug 'ncm2/ncm2-ultisnips'
" Snippets are separated from the engine. Add this if you want them:
" Plug 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

Plug 'andrewstuart/vim-kubernetes'
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py --style dictionary' }
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'
let g:ansible_extra_keywords_highlight = 1
let g:ansible_normal_keywords_highlight = 'Constant'

" Initialize plugin system
call plug#end()

"}}}

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

 " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
    " found' messages
    set shortmess+=c

    " May be lang server autocompletion
    au TextChangedI * call ncm2#auto_trigger()
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

" Splits
set splitbelow splitright

" Custom Undo
set undofile
if !has('nvim')
    set undodir=~/.vim/undo
endif

"""""""""""""""""""""""""
" Plugin Configs

"let g:auto_save = 1
let g:auto_save_noupdatetime = 1
let g:auto_save_in_insert_mode = 0

" Functions
" {{{
function! Term()
  exec winheight(0)/4."split" | set nonu | terminal
endfunction
function! TermTab()
  tabnew | set nonu | terminal
endfunction

function! Scrap()
  exec winwidth(0)/4."vsplit" | edit ~/Documents/scrapnotes/scrapnote.md
endfunction
function! BufOnly()
    :%bd | e#
endfunction

function! TrailClear()
    :%s/\s\+$//g
endfunction

function! GlogThis()
    :Glog -- % | copen<CR>
endfunction
function! AnsiVarFix()
    :%s/{{\(\w\+\)}}/{{ \1 }}/g
endfunction

" function! FugDel()
"     :bdelete fugitive://*
" endfunction
"}}}

" Commands
command! BufOnly call BufOnly()
command! TrailClear call TrailClear()
command! Scrap call Scrap()
command! AnsiVarFix call AnsiVarFix()

" keyboad mappings {{{
" visual select
vnoremap // "zy/<C-R>z<CR>
vnoremap /b "zy:Back! <C-R>z<CR>
vnoremap /B "zy:Back! -w <C-R>z<CR>
let g:FerretMaxResults=1000

let g:user_emmet_leader_key='<C-l>'

"Undo map
nnoremap <silent> U :UndotreeToggle<CR>:UndotreeFocus<CR>

" vnoremap /s "zy:Ack! -w --ignore *\.wiki --ignore *doc --ignore ekstep-devops z
vnoremap <silent> /S "zy:Ack! -w  z
vnoremap <silent> /s "zy:Ack!  z
" vnoremap <silent> /s "zy:Ack! --ignore *\.wiki --ignore *doc z
" Ansible doc
vnoremap <silent> /D "zy:!ansible-doc z

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
nnoremap <leader>Q :qa!<Enter>
nnoremap <leader>wq :wq<Enter>
nnoremap <leader>wQ :wqa!<Enter>
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

function! DiffToggle(diff)
    "named argument diff
    if a:diff
        :windo diffoff
    else
        :windo diffthis
    endif
endfunction


" Easymotion plug
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap <silent> z <Plug>(easymotion-overwin-f2)

" Replacing hjkl
" Gif config
map  <silent> <Leader>j <Plug>(easymotion-j)
map <silent> <Leader>k <Plug>(easymotion-k)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion


" ALE mapping
nmap <silent> [n <Plug>(ale_previous_wrap)
nmap <silent> ]n <Plug>(ale_next_wrap)

nnoremap <silent> <leader>d :call DiffToggle(&diff)<CR>
nnoremap <silent> <leader>fd :call FugDel()<CR>

" Commenting for fugitive commit session
" will take branch name as #Issue-number
let @w='5G$vByggIIssue #000 feat: pggA'
let @e='ggIIssue #000 feat: '
let @r='ggIIssue #000 chore: '

" Change ansible from old = to new : form
let @q='ff=s: f=Bi@q[b,qjjjjjjjj[b'

" colorscheme solarized8_flat
colorscheme gruvbox
set background=dark

"NERDTreefind
nnoremap <silent> ff :NERDTreeFind <Enter>
"NERDTree toggle
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" Markdown web preview
nnoremap <silent> <leader>md <plug>MarkdownPreviewToggle

" Killing grip md server
nnoremap <leader>mk :!bash ~/grip.sh stop <enter>

" Write files without permission
nnoremap sw :w !sudo tee % > /dev/null

" Copying to system clipboard
vnoremap Y "+y
nnoremap <C-p> :<C-u>FZF<cr>

if has('nvim')
     nnoremap <expr> <leader>t ":call Term()\<CR>"
     nnoremap <expr> <leader>T ":call TermTab()\<CR>"
endif
" }}}


let g:FerretJob=0
"airline bar
let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='angr'
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

" " old vim-powerline symbols
" let g:airline_left_sep = '⮀'
" " let g:airline_left_alt_sep = '⮁'
" let g:airline_right_sep = '⮂'
" " let g:airline_right_alt_sep = '⮃'
" let g:airline_symbols.branch = '⭠'
" let g:airline_symbols.readonly = '⭤'
" let g:airline_symbols.linenr = '⭡'

" let g:airline_section_b = '%-0.10{getcwd()}'
let g:airline_section_c = '%t'
" Enable fugitive
let g:airline#extensions#branch#enabled = 1
" to truncate all path sections but the last one, e.g. a branch
" 'foo/bar/baz' becomes 'f/b/baz', use
let g:airline#extensions#branch#format = 2
 call airline#parts#define('branch', {
        \ 'raw': '',
        \ 'minwidth': 120})

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

" customization for wiki
let wiki_personal= {'path': '~/vimwiki_personal/', 'syntax': 'markdown', 'ext': '.md'}
let wiki_work = {'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}
let g:vimwiki_list = [wiki_work, wiki_personal]
let g:vimwiki_ext2syntax = {'.md': 'markdown',
                  \ '.mkd': 'markdown',
                  \ '.wiki': 'media'}
map gc<Space> <Plug>VimwikiToggleListItem

" Intent
let g:indent_guides_enable_on_vim_startup = 1


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
augroup filetypes
    autocmd!
    " autocmd BufEnter,BufWritePre *.yml set foldmethod=indent foldlevel=10
    autocmd Filetype vim,python,sh setlocal foldmethod=marker shiftwidth=4 tabstop =4  expandtab
    autocmd Filetype yaml setlocal shiftwidth=2 tabstop=2 expandtab
    autocmd Filetype gitcommit setlocal spell
    autocmd Filetype git setlocal nofoldenable
    autocmd BufEnter ".*\.md$" set spell tabstop=2 expandtab shiftwidth=2 ft=markdown
    autocmd BufEnter Jenkinsfile setlocal ft=groovy
    autocmd FileType vimwiki let b:auto_save=1
    "custom file based remapings
    au FileType go nmap <leader>gr <Plug>(go-run)
    au FileType go nmap <leader>gt <Plug>(go-test)
augroup END


" Ansible
augroup filetype_yml
    autocmd!
    au BufRead,BufNewFile *.y[a]?ml set tabstop=2 expandtab shiftwidth=2 filetype=yaml.ansible  " foldmethod=indent fml=10
    nnoremap <silent> ]r 0f-WvEy:find roles/0/tasks/main.yml
    nnoremap <silent> <leader>at :!ansible-playbook % --syntax-check<CR>
augroup END

" start terminal in insert mode
" Issue with new async terminal 
" ends up current buffer in inesert mode.
" if has('nvim')
"     autocmd!
"     autocmd TermOpen term://* startinsert
" endif

"}}}


" set noswapfile nobackup nowb
set scrolloff=3
set confirm autoread
" make . to work with visually selected lines
vnoremap . :normal.<CR>

" Temporary ansible refactor LP and DP find var
let @d='/.*d-data-p.*\(ansible\|role\)'
let @l='/.*d-learning-p.*\(ansible\|role\)'
let @p='/public-devops\/ansible\/\(roles\/\S\{-}\/\|.\+group_vars\|\S\+\.y\)'
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

function! VimwikiLinkHandler(link)
    let link = a:link
    if link =~# '^vfile:'
        let link = link[1:]
    else
        return 0
    endif
    let link_infos = vimwiki#base#resolve_link(link)
    if link_infos.filename ==? ''
        echomsg 'Vimwiki Error: Unable to resolve link!'
        return 0
    else
        exe 'edit' . fnameescape(link_infos.filename)
        return 1
    endif
endfunction
