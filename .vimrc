let mapleader = ","
let maplocalleader = ";"

" .vimrc Meta Settings {{{
" Easy access to this file
nnoremap <leader>ev :sp $MYVIMRC<cr><c-w>_
nnoremap <leader>sv :source $MYVIMRC<cr>

augroup filetype_vim
    autocmd!
    autocmd FileType vim nnoremap <buffer> <localleader>cv :source $MYVIMRC<cr>:wq<cr>
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim nnoremap <buffer> <localleader>ws :write<cr>:source %<cr>
augroup END
" }}}

execute pathogen#infect()

" Syntax Highlighting {{{
syntax on
filetype plugin indent on
colorscheme desert
set background=dark
highlight Comment ctermfg=darkred
highlight String ctermfg=darkgreen
highlight Constant ctermfg=darkgreen
highlight LineNr ctermfg=lightgrey
highlight ColorColumn ctermbg=black
let &colorcolumn=join(range(81,999),",")
highlight WarningMsg ctermfg=red
highlight Folded ctermfg=lightgrey
" }}}

" Statusline {{{
set laststatus=2            " Always show status line

set statusline=%t           " Tail of filename
set statusline+=\ %y        " Filetype
set statusline+=[%{&ff}]    " File format
set statusline+=%h          " Help file flag
set statusline+=%m          " Modified flag
set statusline+=%r          " Read only flag
set statusline+=%=          " Left/right separator
set statusline+=%c,         " Cursor column
set statusline+=%l\ of\ %L  " Cursor line/total lines
set statusline+=\ \(%P\)    " Percent through file
" }}}

" Misc. Global Settings {{{
set ignorecase  " Ignore case in searches unless a capital letter is included.
set smartcase   " Both ignorecase and smartcase must be set.
set incsearch
set gdefault
set showmatch
set nohlsearch
set showcmd
set number

set expandtab
set smartindent
set ts=4
set sw=4

set nocompatible
set modelines=0

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set hidden
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

set wrap
set textwidth=79
set formatoptions=qrn1

let g:netrw_winsize = 20
"}}}

" General Mappings {{{
" zz is hard to press and space is too good of real estate to shadow l
nnoremap <space> zz

" Make Y consistent with how D and C behave. Use yy to yank a line.
nnoremap Y y$

" Avoid the escape key at all costs
inoremap jk <esc>
inoremap kj <esc>
inoremap <esc> <nop>
vnoremap v <esc>
vnoremap <esc> <nop>

" Get around OS mapping of <c-v>
nnoremap <c-b> <c-v>

" <c-u> to capitalize the current word
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwUe

" Open a split containing the previous buffer.
nnoremap <leader>sp :execute "rightbelow split " . bufname("#")<CR>

" Two-keystroke window switching
nnoremap <c-j> <c-w>j<c-w>_
nnoremap <c-k> <c-w>k<c-w>_
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Seek and destroy trailing whitespace
nnoremap <leader>w :match Error /\v\s+$/<cr>
nnoremap <leader>W :%s/\v\s+$//<cr>:let @/=''<cr>

" Normal regex search
nnoremap / /\v
vnoremap / /\v

nnoremap <leader>cn :cnext<cr>
nnoremap <leader>cp :cprevious<cr>
nnoremap <leader>co :copen 5<cr>
nnoremap <leader>cc :cclose<cr>

nnoremap <tab> %
vnoremap <tab> %

"Save on losing focus from vim.
au FocusLost * :wa

" }}}

" Homebrew Surround Plugin {{{
nnoremap <leader>' ciw'<c-r>"'<esc>
nnoremap <leader>" ciw"<c-r>""<esc>
nnoremap <leader>[ ciw[<c-r>"]<esc>
nnoremap <leader>( ciw(<c-r>")<esc>
nnoremap <leader>{ ciw{<c-r>"}<esc>
nnoremap <leader>< ciw<<c-r>"><esc>

nnoremap <leader>d' di'hPlxx
nnoremap <leader>d" di"hPlxx
nnoremap <leader>d[ di[hPlxx
nnoremap <leader>d( di(hPlxx
nnoremap <leader>d{ di{hPlxx
nnoremap <leader>d< di<hPlxx

vnoremap <leader>' c'<esc>:setl paste<cr>a<c-r>"'<esc>:setl nopaste<cr>
vnoremap <leader>" c"<esc>:setl paste<cr>a<c-r>""<esc>:setl nopaste<cr>
vnoremap <leader>[ c[<esc>:setl paste<cr>a<c-r>"]<esc>:setl nopaste<cr>
vnoremap <leader>( c(<esc>:setl paste<cr>a<c-r>")<esc>:setl nopaste<cr>
vnoremap <leader>{ c{<esc>:setl paste<cr>a<c-r>"}<esc>:setl nopaste<cr>
vnoremap <leader>< c<<esc>:setl paste<cr>a<c-r>"><esc>:setl nopaste<cr>

onoremap in' :<c-u>normal! f'vi'<cr>
onoremap ip' :<c-u>normal! F'vi'<cr>
onoremap in" :<c-u>normal! f"vi"<cr>
onoremap ip" :<c-u>normal! F"vi"<cr>
onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap ip[ :<c-u>normal! F]vi[<cr>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap ip( :<c-u>normal! F)vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap ip{ :<c-u>normal! F}vi{<cr>
onoremap in< :<c-u>normal! f<vi<<cr>
onoremap ip< :<c-u>normal! F>vi<<cr>

onoremap an' :<c-u>normal! f'va'<cr>
onoremap ap' :<c-u>normal! F'va'<cr>
onoremap an" :<c-u>normal! f"va"<cr>
onoremap ap" :<c-u>normal! F"va"<cr>
onoremap an[ :<c-u>normal! f[va[<cr>
onoremap ap[ :<c-u>normal! F]va[<cr>
onoremap an( :<c-u>normal! f(va(<cr>
onoremap ap( :<c-u>normal! F)va(<cr>
onoremap an{ :<c-u>normal! f{va{<cr>
onoremap ap{ :<c-u>normal! F}va{<cr>
onoremap an< :<c-u>normal! f<va<<cr>
onoremap ap< :<c-u>normal! F>va<<cr>
" }}}

" Python Settings {{{

" Hack to keep smartindent from moving python comments all the way to the left
inoremap # x<bs>#
augroup filetype_python
    autocmd!
    autocmd FileType python nnoremap <buffer> <localleader>c 0i#<esc>
    autocmd FileType python nnoremap <buffer> <localleader>C 0x<esc>
    autocmd FileType python iabbrev <buffer> def def ():<cr>"""<cr>"""<up><up>
augroup END
" }}}

" HTML Settings {{{
" HTML folding
augroup filetype_html
    autocmd!
    autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END
" }}}

" Markdown Settings {{{
augroup filetype_md
    autocmd!
    autocmd FileType modula2 nnoremap <buffer> <localleader>u= yypVr=
    autocmd FileType modula2 nnoremap <buffer> <localleader>u- yypVr-
augroup END
" }}}

" Vimdiff Settings {{{
hi DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
hi DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
hi DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
hi DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black
augroup vimdiff
    autocmd!
    " Automatically refresh a diff when either file is edited
    autocmd BufWritePost * if &diff == 1 | diffupdate | endif
augroup END
" }}}

